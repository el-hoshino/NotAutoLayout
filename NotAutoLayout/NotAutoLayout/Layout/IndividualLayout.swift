//
//  LayoutIndividual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct Layout: LayoutMakerPropertyType {
		
		private var basicFrameEvaluation: IndividualFrame
		
		private var additionalEvaluations: [FrameAdditionalEvaluation]
		
	}
	
}

extension IndividualProperty.Layout {
	
	static let dummy: IndividualProperty.Layout = .init(frame: .zero)
	
}

extension IndividualProperty.Layout {
	
	init(frame: Rect) {
		self.basicFrameEvaluation = IndividualFrame({ _ in frame })
		self.additionalEvaluations = []
	}
	
	init(frame: IndividualFrame) {
		self.basicFrameEvaluation = frame
		self.additionalEvaluations = []
	}
	
	init(frame: @escaping (IndividualFrameCalculationParameters) -> Rect) {
		self.basicFrameEvaluation = IndividualFrame(frame)
		self.additionalEvaluations = []
	}
	
}

extension IndividualProperty.Layout {
	
	var frameAdditionalEvaluations: [FrameAdditionalEvaluation] {
		return self.additionalEvaluations
	}
	
}

extension IndividualProperty.Layout {
	
	mutating func addAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation) {
		
		self.additionalEvaluations.append(evaluation)
		
	}
	
	mutating func setAdditionalEvaluations(_ evaluations: [FrameAdditionalEvaluation]) {
		
		self.additionalEvaluations = evaluations
		
	}
	
}

extension IndividualProperty.Layout {
	
	func evaluatedFrame(for targetView: UIView, from guides: ViewLayoutGuides) -> Rect {
		
		let parameters: IndividualFrameCalculationParameters = (targetView, guides)
		
		var frame = self.basicFrameEvaluation.evaluated(from: parameters)
		
		for evaluation in self.additionalEvaluations {
			frame = evaluation.evaluated(from: frame, with: parameters)
		}
		
		return frame
		
	}
	
}
