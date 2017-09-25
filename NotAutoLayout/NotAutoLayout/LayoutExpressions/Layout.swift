//
//  LayoutIndividual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct Layout {
	
	@available(*, introduced: 2.0, deprecated: 2.1, renamed: "Layout", message: "Layout.Individual has been renamed to Layout, in addition sequential layout and matrical layout will have their own type names in future release, too.")
	typealias Individual = Layout
	
	fileprivate enum Frame {
		case constant(CGRect)
		case basicEvaluation((_ parameter: LayoutControlParameter) -> CGRect)
		case fittingEvaluation((_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ parameter: LayoutControlParameter) -> CGRect)
	}
	
	private var basicFrameEvaluation: Frame
	
	private var additionalEvaluations: [FrameAdditionalEvaluation]
	
	private init(frame: CGRect) {
		self.basicFrameEvaluation = Frame.constant(frame)
		self.additionalEvaluations = []
	}
	
	private init(evaluation: @escaping (_ parameter: LayoutControlParameter) -> CGRect) {
		self.basicFrameEvaluation = Frame.basicEvaluation(evaluation)
		self.additionalEvaluations = []
	}
	
	private init(evaluation: @escaping (_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ parameter: LayoutControlParameter) -> CGRect) {
		self.basicFrameEvaluation = Frame.fittingEvaluation(evaluation)
		self.additionalEvaluations = []
	}
	
	private init(x: @escaping (LayoutControlParameter) -> CGFloat, y: @escaping (LayoutControlParameter) -> CGFloat, width: @escaping (LayoutControlParameter) -> CGFloat, height: @escaping (LayoutControlParameter) -> CGFloat) {
		
		let frame: (LayoutControlParameter) -> CGRect = { parameter in
			let frame = CGRect(x: x(parameter),
			                   y: y(parameter),
			                   width: width(parameter),
			                   height: height(parameter))
			return frame
		}
		
		self.basicFrameEvaluation = Frame.basicEvaluation(frame)
		self.additionalEvaluations = []
		
	}

}

extension Layout {
	
	static func makeAbsolute(frame: CGRect) -> Layout {
		let layout = Layout(frame: frame)
		return layout
	}
	
	static func makeCustom(x: @escaping (LayoutControlParameter) -> CGFloat, y: @escaping (LayoutControlParameter) -> CGFloat, width: @escaping (LayoutControlParameter) -> CGFloat, height: @escaping (LayoutControlParameter) -> CGFloat) -> Layout {
		let layout = Layout(x: x, y: y, width: width, height: height)
		return layout
	}
	
	static func makeCustom(frame: @escaping (LayoutControlParameter) -> CGRect) -> Layout {
		let layout = Layout(evaluation: frame)
		return layout
	}
	
	static func makeCustom(frame: @escaping (_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ parameter: LayoutControlParameter) -> CGRect) -> Layout {
		let layout = Layout(evaluation: frame)
		return layout
	}
	
}

extension Layout {
	
	func addingAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation) -> Layout {
		
		var layout = self
		layout.additionalEvaluations.append(evaluation)
		
		return layout
		
	}
	
	mutating func addAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation) {
		
		self = self.addingAdditionalEvaluation(evaluation)
		
	}
	
}

extension Layout {
	
	func settingAdditionalEvaluations(to evaluations: [FrameAdditionalEvaluation]) -> Layout {
		
		var layout = self
		layout.additionalEvaluations = evaluations
		
		return layout
		
	}
	
	mutating func setAdditionalEvaluations(_ evaluations: [FrameAdditionalEvaluation]) {
		
		self = self.settingAdditionalEvaluations(to: evaluations)
		
	}
	
}

extension Layout {
	
	func evaluatedFrame(for view: UIView, fittedBy fitting: (_ fittingSize: CGSize) -> CGSize, with parameter: LayoutControlParameter) -> CGRect {
		
		var frame = self.basicFrameEvaluation.frame(fittedBy: fitting, with: parameter)
		
		for evaluation in self.additionalEvaluations {
			frame = evaluation.evaluated(for: view, from: frame, with: parameter)
		}
		
		return frame
		
	}
	
}

extension Layout.Frame {
	
	func frame(fittedBy fitting: (_ fittingSize: CGSize) -> CGSize, with parameter: LayoutControlParameter) -> CGRect {
		
		switch self {
		case .constant(let frame):
			return frame
			
		case .basicEvaluation(let frame):
			return frame(parameter)
			
		case .fittingEvaluation(let frame):
			return frame(fitting, parameter)
		}
		
	}
	
}
