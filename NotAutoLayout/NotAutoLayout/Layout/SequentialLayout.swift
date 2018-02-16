//
//  LayoutIndividual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct SequentialLayout<ParentView: UIView> {
	
	private var basicFrameEvaluation: SequentialFrame<ParentView>
	
	private var additionalEvaluations: [FrameAdditionalEvaluation<ParentView>]
	
}

extension SequentialLayout: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

extension SequentialLayout {
	
	init(frame: SequentialFrame<ParentView>) {
		self.basicFrameEvaluation = frame
		self.additionalEvaluations = []
	}
	
	init(frame: @escaping (SequentialFrameCalculationParameters<ParentView>) -> [CGRect]) {
		self.basicFrameEvaluation = SequentialFrame(frame)
		self.additionalEvaluations = []
	}
	
}

extension SequentialLayout {
	
	var frameAdditionalEvaluations: [FrameAdditionalEvaluation<ParentView>] {
		return self.additionalEvaluations
	}
	
}

extension SequentialLayout {
	
	mutating func addAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation<ParentView>) {
		
		self.additionalEvaluations.append(evaluation)
		
	}
	
	mutating func setAdditionalEvaluations(_ evaluations: [FrameAdditionalEvaluation<ParentView>]) {
		
		self.additionalEvaluations = evaluations
		
	}
	
}

extension SequentialLayout {
	
	func evaluatedFrame(for targetViews: [UIView], from property: ViewFrameProperty<ParentView>) -> [CGRect] {
		
		let parameters: SequentialFrameCalculationParameters<ParentView> = (targetViews, property)
		
		let frames = self.basicFrameEvaluation.evaluated(from: parameters)
		
		return frames
		
	}
	
}
