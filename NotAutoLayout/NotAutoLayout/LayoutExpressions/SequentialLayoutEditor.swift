//
//  SequentialLayoutEditor.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct SequentialLayoutEditor {
	
	private(set) var sequentialLayout: SequentialLayout
	
	init(_ sequentialLayout: SequentialLayout) {
		self.sequentialLayout = sequentialLayout
	}
	
	init(_ layout: Layout) {
		let sequentialLayout = SequentialLayout.makeInitial(from: layout)
		self.sequentialLayout = sequentialLayout
	}
	
}

extension SequentialLayoutEditor {
	
	func addingRestFrameEvaluation(_ evaluation: SequentialRestFrameEvaluation) -> SequentialLayoutEditor {
		
		var editor = self
		editor.sequentialLayout.addRestFrameEvaluation(evaluation)
		
		return editor
		
	}
	
}

extension SequentialLayoutEditor {
	
	public typealias RestFrameFloatEvaluation = (_ frame: CGRect, _ parameter: LayoutControlParameter) -> CGFloat
	public typealias RestFramePointEvaluation = (_ frame: CGRect, _ parameter: LayoutControlParameter) -> CGPoint
	public typealias RestFrameSizeEvaluation = (_ frame: CGRect, _ parameter: LayoutControlParameter) -> CGSize
	
}

extension SequentialLayoutEditor {
	
	func settingRestFrameEvaluations(to evaluations: [SequentialRestFrameEvaluation]) -> SequentialLayoutEditor {
		
		var editor = self
		editor.sequentialLayout.setRestFrameEvaluations(evaluations)
		
		return editor
		
	}
	
}

extension SequentialLayoutEditor {
	
	public var resettingRestFrameEvaluations: SequentialLayoutEditor {
		return self.settingRestFrameEvaluations(to: [])
	}
	
}

extension SequentialLayoutEditor {
	
	public func movingX(by offset: @escaping RestFrameFloatEvaluation) -> SequentialLayoutEditor {
		
		let evaluation = SequentialRestFrameEvaluation.movingXBy(offset)
		return self.addingRestFrameEvaluation(evaluation)
		
	}
	
	public func movingX(by offset: CGFloat) -> SequentialLayoutEditor {
		
		return self.movingX(by: { _, _ in offset })
		
	}
	
	public func movingY(by offset: @escaping RestFrameFloatEvaluation) -> SequentialLayoutEditor {
		
		let evaluation = SequentialRestFrameEvaluation.movingYBy(offset)
		return self.addingRestFrameEvaluation(evaluation)
		
	}
	
	public func movingY(by offset: CGFloat) -> SequentialLayoutEditor {
		
		return self.movingY(by: { _, _ in offset })
		
	}
	
	public func movingOrigin(by offset: @escaping RestFramePointEvaluation) -> SequentialLayoutEditor {
		
		let evaluation = SequentialRestFrameEvaluation.movingOriginBy(offset)
		return self.addingRestFrameEvaluation(evaluation)
		
	}
	
	public func movingOrigin(by offset: CGPoint) -> SequentialLayoutEditor {
		
		return self.movingOrigin(by: { _, _ in offset })
		
	}
	
}

extension SequentialLayoutEditor {
	
	public func expandingWidth(by diff: @escaping RestFrameFloatEvaluation, from reference: CGRect.HorizontalBasePoint) -> SequentialLayoutEditor {
		
		let evaluation = SequentialRestFrameEvaluation.expandingWidthBy(diff, from: reference)
		return self.addingRestFrameEvaluation(evaluation)
		
	}
	
	public func expandingWidth(by diff: CGFloat, from reference: CGRect.HorizontalBasePoint) -> SequentialLayoutEditor {
		
		return self.expandingWidth(by: { _, _ in diff }, from: reference)
		
	}
	
	public func expandingLeft(by diff: @escaping RestFrameFloatEvaluation) -> SequentialLayoutEditor {
		
		return self.expandingWidth(by: diff, from: .right)
		
	}
	
	public func expandingLeft(by diff: CGFloat) -> SequentialLayoutEditor {
		
		return self.expandingWidth(by: { _, _ in diff }, from: .right)
		
	}
	
	public func expandingRight(by diff: @escaping RestFrameFloatEvaluation) -> SequentialLayoutEditor {
		
		return self.expandingWidth(by: diff, from: .left)
		
	}
	
	public func expandingRight(by diff: CGFloat) -> SequentialLayoutEditor {
		
		return self.expandingWidth(by: { _, _ in diff }, from: .left)
		
	}
	
	public func expandingHeight(by diff: @escaping RestFrameFloatEvaluation, from reference: CGRect.VerticalBasePoint) -> SequentialLayoutEditor {
		
		let evaluation = SequentialRestFrameEvaluation.expandingHeightBy(diff, from: reference)
		return self.addingRestFrameEvaluation(evaluation)
		
	}
	
	public func expandingHeight(by diff: CGFloat, from reference: CGRect.VerticalBasePoint) -> SequentialLayoutEditor {
		
		return self.expandingHeight(by: { _, _ in diff }, from: reference)
		
	}
	
	public func expandingTop(by diff: @escaping RestFrameFloatEvaluation) -> SequentialLayoutEditor {
		
		return self.expandingHeight(by: diff, from: .bottom)
		
	}
	
	public func expandingTop(by diff: CGFloat) -> SequentialLayoutEditor {
		
		return self.expandingHeight(by: { _, _ in diff }, from: .bottom)
		
	}
	
	public func expandingBottom(by diff: @escaping RestFrameFloatEvaluation) -> SequentialLayoutEditor {
		
		return self.expandingHeight(by: diff, from: .top)
		
	}
	
	public func expandingBottom(by diff: CGFloat) -> SequentialLayoutEditor {
		
		return self.expandingHeight(by: { _, _ in diff }, from: .top)
		
	}
	
}
