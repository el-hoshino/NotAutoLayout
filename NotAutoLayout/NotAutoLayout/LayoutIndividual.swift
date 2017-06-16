//
//  LayoutIndividual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Layout {
	
	public struct Individual {
		
		private var basicFrameEvaluation: (_ boundSize: CGSize) -> CGRect
		
		private var additionalEvaluations: [FrameAdditionalEvaluation]
		
		private init(evaluation: @escaping (_ boundSize: CGSize) -> CGRect) {
			self.basicFrameEvaluation = evaluation
			self.additionalEvaluations = []
		}
		
		private init(frame: CGRect) {
			self.basicFrameEvaluation = { _ in return frame }
			self.additionalEvaluations = []
		}
		
	}
	
}

extension Layout.Individual {
	
	static func makeAbsolute(from frame: CGRect) -> Layout.Individual {
		let layout = Layout.Individual(frame: frame)
		return layout
	}
	
}

extension Layout.Individual {
	
	mutating func addAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation) {
		
		self.additionalEvaluations.append(evaluation)
		
	}
	
}

extension Layout.Individual {
	
	mutating func setAdditionalEvaluations(_ evaluations: [FrameAdditionalEvaluation]) {
		
		self.additionalEvaluations = evaluations
		
	}
	
}

extension Layout.Individual {
	
	func evaluatedFrame(in boundSize: CGSize) -> CGRect {
		
		var frame = self.basicFrameEvaluation(boundSize)
		
		for evaluation in self.additionalEvaluations {
			frame = evaluation.evaluated(from: frame, in: boundSize)
		}
		
		return frame
		
	}
	
}
