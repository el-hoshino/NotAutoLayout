//
//  LayoutIndividual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Layout {
	
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

extension Layout.Individual {
	
	static func makeAbsolute(frame: CGRect) -> Layout.Individual {
		let layout = Layout.Individual(frame: frame)
		return layout
	}
	
	static func makeCustom(x: @escaping (LayoutControlParameter) -> CGFloat, y: @escaping (LayoutControlParameter) -> CGFloat, width: @escaping (LayoutControlParameter) -> CGFloat, height: @escaping (LayoutControlParameter) -> CGFloat) -> Layout.Individual {
		let layout = Layout.Individual(x: x, y: y, width: width, height: height)
		return layout
	}
	
	static func makeCustom(frame: @escaping (LayoutControlParameter) -> CGRect) -> Layout.Individual {
		let layout = Layout.Individual(evaluation: frame)
		return layout
	}
	
	static func makeCustom(frame: @escaping (_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ parameter: LayoutControlParameter) -> CGRect) -> Layout.Individual {
		let layout = Layout.Individual(evaluation: frame)
		return layout
	}
	
}

extension Layout.Individual {
	
	func addingAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation) -> Layout.Individual {
		
		var layout = self
		layout.additionalEvaluations.append(evaluation)
		
		return layout
		
	}
	
	mutating func addAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation) {
		
		self = self.addingAdditionalEvaluation(evaluation)
		
	}
	
}

extension Layout.Individual {
	
	func settingAdditionalEvaluations(to evaluations: [FrameAdditionalEvaluation]) -> Layout.Individual {
		
		var layout = self
		layout.additionalEvaluations = evaluations
		
		return layout
		
	}
	
	mutating func setAdditionalEvaluations(_ evaluations: [FrameAdditionalEvaluation]) {
		
		self = self.settingAdditionalEvaluations(to: evaluations)
		
	}
	
}

extension Layout.Individual {
	
	func evaluatedFrame(for view: UIView, fittedBy fitting: (_ fittingSize: CGSize) -> CGSize, with parameter: LayoutControlParameter) -> CGRect {
		
		var frame = self.basicFrameEvaluation.frame(fittedBy: fitting, with: parameter)
		
		for evaluation in self.additionalEvaluations {
			frame = evaluation.evaluated(for: view, from: frame, with: parameter)
		}
		
		return frame
		
	}
	
}

extension Layout.Individual.Frame {
	
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
