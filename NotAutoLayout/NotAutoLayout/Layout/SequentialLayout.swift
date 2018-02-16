//
//  LayoutIndividual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct SequentialLayout<ParentView: UIView>: LayoutMakerPropertyType {
	
	private var basicFrameEvaluation: SequentialFrame
	
	private var additionalEvaluations: [FrameAdditionalEvaluation]
	
}

extension SequentialLayout {
	
	init(frame: SequentialFrame) {
		self.basicFrameEvaluation = frame
		self.additionalEvaluations = []
	}
	
	init(frame: @escaping (SequentialFrameCalculationParameters) -> [CGRect]) {
		self.basicFrameEvaluation = SequentialFrame(frame)
		self.additionalEvaluations = []
	}
	
}

extension SequentialLayout {
	
	var frameAdditionalEvaluations: [FrameAdditionalEvaluation] {
		return self.additionalEvaluations
	}
	
}

extension SequentialLayout {
	
	mutating func addAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation) {
		
		self.additionalEvaluations.append(evaluation)
		
	}
	
	mutating func setAdditionalEvaluations(_ evaluations: [FrameAdditionalEvaluation]) {
		
		self.additionalEvaluations = evaluations
		
	}
	
}

extension SequentialLayout {
	
	func evaluatedFrame(for targetViews: [UIView], from property: ViewFrameProperty) -> [CGRect] {
		
		let parameters: SequentialFrameCalculationParameters = (targetViews, property)
		
		let frames = self.basicFrameEvaluation.evaluated(from: parameters)
		
		return frames
		
	}
	
}
