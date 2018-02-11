//
//  LayoutIndividual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct Layout {
	
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
	
	init(frame: @escaping Frame.FrameCalculation) {
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
	
	mutating func addAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation) {
		
		self.additionalEvaluations.append(evaluation)
		
	}
	
	mutating func setAdditionalEvaluations(_ evaluations: [FrameAdditionalEvaluation]) {
		
		self.additionalEvaluations = evaluations
		
	}
	
}

extension Layout {
	
	func evaluatedFrame(from property: ViewFrameProperty) -> CGRect {
		
		var frame = self.basicFrameEvaluation.evaluated(from: property)
		
		for evaluation in self.additionalEvaluations {
			frame = evaluation.evaluated(from: frame, with: property)
		}
		
		return frame
		
	}
	
}
