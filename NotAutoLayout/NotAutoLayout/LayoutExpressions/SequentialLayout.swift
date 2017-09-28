//
//  SequentialLayout.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/18.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct SequentialLayout {
	
	private var firstLayout: Layout
	
	private var restFrameEvaluations: [SequentialRestFrameEvaluation]
	
	private init(firstLayout: Layout, restFrameEvaluations: [SequentialRestFrameEvaluation]) {
		
		self.firstLayout = firstLayout
		
		self.restFrameEvaluations = restFrameEvaluations
		
	}
	
	private init(frame: CGRect, offset: CGPoint) {
		
		self.firstLayout = Layout(frame: frame)
		
		self.restFrameEvaluations = [.movingOriginBy({ _, _ in offset })]
		
	}
	
}

extension SequentialLayout {
	
	static func makeInitial(from firstLayout: Layout) -> SequentialLayout {
		
		let layout = SequentialLayout(firstLayout: firstLayout, restFrameEvaluations: [])
		
		return layout
		
	}
	
}

extension SequentialLayout {
	
	public func editing(_ editing: (SequentialLayoutEditor) -> SequentialLayoutEditor) -> SequentialLayout {
		
		let editor = SequentialLayoutEditor(self)
		let result = editing(editor).sequentialLayout
		
		return result
		
	}
	
}

extension SequentialLayout {
	
	mutating func addRestFrameEvaluation(_ evaluation: SequentialRestFrameEvaluation) {
		
		self.restFrameEvaluations.append(evaluation)
		
	}
	
	mutating func setRestFrameEvaluations(_ evaluations: [SequentialRestFrameEvaluation]) {
		
		self.restFrameEvaluations = evaluations
		
	}
	
}

extension SequentialLayout {
	
	func evaluatedFrame(for view: UIView, after previousView: UIView?, with parameter: LayoutControlParameter) -> CGRect {
		
		if let previousView = previousView {
			var frame = previousView.nal.identityFrame
			
			for evaluation in self.restFrameEvaluations {
				frame = evaluation.evaluated(for: view, from: frame, with: parameter)
			}
			
			return frame
			
		} else {
			let firstFrame = self.firstLayout.evaluatedFrame(for: view, with: parameter)
			
			return firstFrame
			
		}
		
	}
	
}
