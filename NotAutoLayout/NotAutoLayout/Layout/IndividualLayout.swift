//
//  LayoutIndividual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct IndividualLayout<ParentView: UIView> {
	
	private var basicFrameEvaluation: IndividualFrame<ParentView>
	
	private var additionalEvaluations: [FrameAdditionalEvaluation<ParentView>]
	
}

extension IndividualLayout: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

extension IndividualLayout {
	
	init(frame: CGRect) {
		self.basicFrameEvaluation = IndividualFrame({ _ in frame })
		self.additionalEvaluations = []
	}
	
	init(frame: IndividualFrame<ParentView>) {
		self.basicFrameEvaluation = frame
		self.additionalEvaluations = []
	}
	
	init(frame: @escaping (IndividualFrameCalculationParameters<ParentView>) -> CGRect) {
		self.basicFrameEvaluation = IndividualFrame(frame)
		self.additionalEvaluations = []
	}
	
}

extension IndividualLayout {
	
	var frameAdditionalEvaluations: [FrameAdditionalEvaluation<ParentView>] {
		return self.additionalEvaluations
	}
	
}

extension IndividualLayout {
	
	mutating func addAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation<ParentView>) {
		
		self.additionalEvaluations.append(evaluation)
		
	}
	
	mutating func setAdditionalEvaluations(_ evaluations: [FrameAdditionalEvaluation<ParentView>]) {
		
		self.additionalEvaluations = evaluations
		
	}
	
}

extension IndividualLayout {
	
	func evaluatedFrame(for targetView: UIView, from property: ViewFrameProperty<ParentView>) -> CGRect {
		
		let parameters: IndividualFrameCalculationParameters = (targetView, property)
		
		var frame = self.basicFrameEvaluation.evaluated(from: parameters)
		
		for evaluation in self.additionalEvaluations {
			frame = evaluation.evaluated(from: frame, with: parameters)
		}
		
		return frame
		
	}
	
}
