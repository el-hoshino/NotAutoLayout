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
	public typealias Individual = Layout
	
	private var basicFrameEvaluation: Frame
	
	private var additionalEvaluations: [FrameAdditionalEvaluation]
	
}

extension Layout {
	
	static let dummy: Layout = Layout(frame: .zero)
	
}

extension Layout {
	
	init(frame: CGRect) {
		self.basicFrameEvaluation = Frame(frame)
		self.additionalEvaluations = []
	}
	
	init(frame: @escaping (_ parameter: ViewFrameProperty) -> CGRect) {
		self.basicFrameEvaluation = Frame(frame)
		self.additionalEvaluations = []
	}
	
	init(frame: @escaping (_ parameter: ViewFrameProperty, _ fitting: (CGSize) -> CGSize) -> CGRect) {
		self.basicFrameEvaluation = Frame(frame)
		self.additionalEvaluations = []
	}

	
}

extension Layout {
	
	var frameAdditionalEvaluations: [FrameAdditionalEvaluation] {
		return self.additionalEvaluations
	}
	
}

extension Layout {
	
	public func editing(_ editing: (LayoutEditor) -> LayoutEditor) -> Layout {
		
		let editor = LayoutEditor(self)
		let result = editing(editor).layout
		
		return result
		
	}
	
}

extension Layout {
	
	mutating func addAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation) {
		
		self.additionalEvaluations.append(evaluation)
		
	}
	
	mutating func setAdditionalEvaluations(_ evaluations: [FrameAdditionalEvaluation]) {
		
		self.additionalEvaluations = evaluations
		
	}
	
}

extension Layout {
	
	func evaluatedFrame(for view: UIView, with parameter: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		var frame = self.basicFrameEvaluation.evaluated(from: parameter, fitting: fittingCalculation)
		
		for evaluation in self.additionalEvaluations {
			frame = evaluation.evaluated(for: view, from: frame, with: parameter)
		}
		
		return frame
		
	}
	
}
