//
//  LayoutIndividual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct IndividualLayout<ParentView: UIView>: LayoutMakerPropertyType {
	
	private var basicFrameEvaluation: IndividualFrame<ParentView>
	
	private var additionalEvaluations: [FrameAdditionalEvaluation]
	
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
	
	init<ParentView>(frame: @escaping (IndividualFrameCalculationParameters<ParentView>) -> CGRect) {
		self.basicFrameEvaluation = IndividualFrame(frame)
		self.additionalEvaluations = []
	}
	
}

extension IndividualLayout {
	
	var frameAdditionalEvaluations: [FrameAdditionalEvaluation] {
		return self.additionalEvaluations
	}
	
}

extension IndividualLayout {
	
	mutating func addAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation) {
		
		self.additionalEvaluations.append(evaluation)
		
	}
	
	mutating func setAdditionalEvaluations(_ evaluations: [FrameAdditionalEvaluation]) {
		
		self.additionalEvaluations = evaluations
		
	}
	
}

extension IndividualLayout {
	
	func evaluatedFrame(for targetView: UIView, from property: ViewFrameProperty) -> CGRect {
		
		let parameters: IndividualFrameCalculationParameters = (targetView, property)
		
		var frame = self.basicFrameEvaluation.evaluated(from: parameters)
		
		for evaluation in self.additionalEvaluations {
			frame = evaluation.evaluated(from: frame, with: parameters)
		}
		
		return frame
		
	}
	
}
