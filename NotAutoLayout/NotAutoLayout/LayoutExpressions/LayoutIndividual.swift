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
		
		private init(x: @escaping (CGSize) -> CGFloat, y: @escaping (CGSize) -> CGFloat, width: @escaping (CGSize) -> CGFloat, height: @escaping (CGSize) -> CGFloat) {
			
			let frame: (CGSize) -> CGRect = { boundSize in
				let frame = CGRect(x: x(boundSize),
				                   y: y(boundSize),
				                   width: width(boundSize),
				                   height: height(boundSize))
				return frame
			}
			
			self.basicFrameEvaluation = frame
			self.additionalEvaluations = []
			
		}
		
		private init(frame: @escaping (CGSize) -> CGRect) {
			
			self.basicFrameEvaluation = frame
			self.additionalEvaluations = []
			
		}
	}
	
}

extension Layout.Individual {
	
	static func makeAbsolute(from frame: CGRect) -> Layout.Individual {
		let layout = Layout.Individual(frame: frame)
		return layout
	}
	
	static func makeCustom(x: @escaping (CGSize) -> CGFloat, y: @escaping (CGSize) -> CGFloat, width: @escaping (CGSize) -> CGFloat, height: @escaping (CGSize) -> CGFloat) -> Layout.Individual {
		let layout = Layout.Individual(x: x, y: y, width: width, height: height)
		return layout
	}
	
	static func makeCustom(frame: @escaping (CGSize) -> CGRect) -> Layout.Individual {
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
