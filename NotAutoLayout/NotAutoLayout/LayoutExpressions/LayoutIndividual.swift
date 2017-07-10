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
		
		fileprivate enum Frame {
			case constant(CGRect)
			case basicEvaluation((_ boundSize: CGSize) -> CGRect)
			case fittingEvaluation((_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ boundSize: CGSize) -> CGRect)
		}
		
		private var basicFrameEvaluation: Frame
		
		private var additionalEvaluations: [FrameAdditionalEvaluation]
		
		private init(frame: CGRect) {
			self.basicFrameEvaluation = Frame.constant(frame)
			self.additionalEvaluations = []
		}
		
		private init(evaluation: @escaping (_ boundSize: CGSize) -> CGRect) {
			self.basicFrameEvaluation = Frame.basicEvaluation(evaluation)
			self.additionalEvaluations = []
		}
		
		private init(evaluation: @escaping (_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ boundSize: CGSize) -> CGRect) {
			self.basicFrameEvaluation = Frame.fittingEvaluation(evaluation)
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
			
			self.basicFrameEvaluation = Frame.basicEvaluation(frame)
			self.additionalEvaluations = []
			
		}
		
	}
	
}

extension Layout.Individual {
	
	static func makeAbsolute(frame: CGRect) -> Layout.Individual {
		let layout = Layout.Individual(frame: frame)
		return layout
	}
	
	static func makeCustom(x: @escaping (CGSize) -> CGFloat, y: @escaping (CGSize) -> CGFloat, width: @escaping (CGSize) -> CGFloat, height: @escaping (CGSize) -> CGFloat) -> Layout.Individual {
		let layout = Layout.Individual(x: x, y: y, width: width, height: height)
		return layout
	}
	
	static func makeCustom(frame: @escaping (CGSize) -> CGRect) -> Layout.Individual {
		let layout = Layout.Individual(evaluation: frame)
		return layout
	}
	
	static func makeCustom(frame: @escaping (_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ boundSize: CGSize) -> CGRect) -> Layout.Individual {
		let layout = Layout.Individual(evaluation: frame)
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
	
	func evaluatedFrame(fittedBy fitting: (_ fittingSize: CGSize) -> CGSize, in boundSize: CGSize) -> CGRect {
		
		var frame = self.basicFrameEvaluation.frame(fittedBy: fitting, in: boundSize)
		
		for evaluation in self.additionalEvaluations {
			frame = evaluation.evaluated(from: frame, in: boundSize)
		}
		
		return frame
		
	}
	
}

extension Layout.Individual.Frame {
	
	func frame(fittedBy fitting: (_ fittingSize: CGSize) -> CGSize, in boundSize: CGSize) -> CGRect {
		
		switch self {
		case .constant(let frame):
			return frame
			
		case .basicEvaluation(let frame):
			return frame(boundSize)
			
		case .fittingEvaluation(let frame):
			return frame(fitting, boundSize)
		}
		
	}
	
}
