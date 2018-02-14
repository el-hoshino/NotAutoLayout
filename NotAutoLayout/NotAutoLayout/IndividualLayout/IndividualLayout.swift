//
//  LayoutIndividual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct IndividualLayout {
	
	private var basicFrameEvaluation: Frame
	
	private var additionalEvaluations: [FrameAdditionalEvaluation]
	
}

extension IndividualLayout {
	
	static let dummy: IndividualLayout = IndividualLayout(frame: .zero)
	
}

extension IndividualLayout {
	
	init(frame: CGRect) {
		self.basicFrameEvaluation = Frame({ _ in frame })
		self.additionalEvaluations = []
	}
	
	init(frame: Frame) {
		self.basicFrameEvaluation = frame
		self.additionalEvaluations = []
	}
	
	init(frame: @escaping (CalculationParameters) -> CGRect) {
		self.basicFrameEvaluation = Frame(frame)
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
		
		let parameters: CalculationParameters = (targetView, property)
		
		var frame = self.basicFrameEvaluation.evaluated(from: parameters)
		
		for evaluation in self.additionalEvaluations {
			frame = evaluation.evaluated(from: frame, with: parameters)
		}
		
		return frame
		
	}
	
}
