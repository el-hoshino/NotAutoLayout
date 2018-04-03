//
//  LayoutIndividual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension SequentialProperty {
	
	public struct Layout: LayoutMakerPropertyType {
		
		private var basicFrameEvaluation: SequentialFrame
		
		private var additionalEvaluations: [FrameAdditionalEvaluation]
		
	}
	
}

extension SequentialProperty.Layout {
	
	init(frame: SequentialFrame) {
		self.basicFrameEvaluation = frame
		self.additionalEvaluations = []
	}
	
	init(frame: @escaping (SequentialFrameCalculationParameters) -> [Rect]) {
		self.basicFrameEvaluation = SequentialFrame(frame)
		self.additionalEvaluations = []
	}
	
}

extension SequentialProperty.Layout {
	
	var frameAdditionalEvaluations: [FrameAdditionalEvaluation] {
		return self.additionalEvaluations
	}
	
}

extension SequentialProperty.Layout {
	
	mutating func addAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation) {
		
		self.additionalEvaluations.append(evaluation)
		
	}
	
	mutating func setAdditionalEvaluations(_ evaluations: [FrameAdditionalEvaluation]) {
		
		self.additionalEvaluations = evaluations
		
	}
	
}

extension SequentialProperty.Layout {
	
	func evaluatedFrame(for targetViews: [UIView], from guides: ViewLayoutGuides) -> [Rect] {
		
		let parameters: SequentialFrameCalculationParameters = (targetViews, guides)
		
		let frames = self.basicFrameEvaluation.evaluated(from: parameters)
		
		return frames
		
	}
	
}
