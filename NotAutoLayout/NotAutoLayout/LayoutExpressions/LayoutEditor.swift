//
//  LayoutEditor.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LayoutEditor {
	
	private(set) var layout: Layout
	
	init(_ layout: Layout) {
		self.layout = layout
	}
	
}

extension LayoutEditor {
	
	func addingAdditionalEvaluation(_ evaluation: FrameAdditionalEvaluation) -> LayoutEditor {
		
		var editor = self
		editor.layout.addAdditionalEvaluation(evaluation)
		
		return editor
		
	}
	
}

extension LayoutEditor {
	
	func settingAdditionalEvaluations(to evaluations: [FrameAdditionalEvaluation]) -> LayoutEditor {
		
		var editor = self
		editor.layout.setAdditionalEvaluations(evaluations)
		
		return editor
		
	}
	
}

extension LayoutEditor {
	
	public typealias AdditionalFloatEvaluation = (_ frame: CGRect, _ parameter: LayoutControlParameter) -> CGFloat
	public typealias AdditionalPointEvaluation = (_ frame: CGRect, _ parameter: LayoutControlParameter) -> CGPoint
	public typealias AdditionalSizeEvaluation = (_ frame: CGRect, _ parameter: LayoutControlParameter) -> CGSize
	
	public typealias AdditionalProcess = (_ view: UIView, _ frame: CGRect, _ parameter: LayoutControlParameter) -> Void
	
}

extension LayoutEditor {
	
	public var resettingAdditionalEvaluations: LayoutEditor {
		return self.settingAdditionalEvaluations(to: [])
	}
	
}

extension LayoutEditor {
	
	public func movingLeft(to left: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.moveLeftTo(left)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingLeft(to left: CGFloat) -> LayoutEditor {
		
		return self.movingLeft(to: { _, _ in left })
		
	}
	
	public func movingCenter(to center: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.moveCenterTo(center)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingCenter(to center: CGFloat) -> LayoutEditor {
		
		return self.movingCenter(to: { _, _ in center })
		
	}
	
	public func movingRight(to right: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.moveRightTo(right)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingRight(to right: CGFloat) -> LayoutEditor {
		
		return self.movingRight(to: { _, _ in right })
		
	}
	
}

extension LayoutEditor {
	
	public func movingTop(to top: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.moveTopTo(top)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingTop(to top: CGFloat) -> LayoutEditor {
		
		return self.movingTop(to: { _, _ in top })
		
	}
	
	public func movingMiddle(to middle: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.moveMiddleTo(middle)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingMiddle(to middle: CGFloat) -> LayoutEditor {
		
		return self.movingMiddle(to: { _, _ in middle })
		
	}
	
	public func movingBottom(to bottom: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.moveBottomTo(bottom)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingBottom(to bottom: CGFloat) -> LayoutEditor {
		
		return self.movingBottom(to: { _, _ in bottom })
		
	}
	
}

extension LayoutEditor {
	
	public func movingX(by offset: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.moveXBy(offset)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingX(by offset: CGFloat) -> LayoutEditor {
		
		return self.movingX(by: { _, _ in offset })
		
	}
	
	public func movingY(by offset: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.moveYBy(offset)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingY(by offset: CGFloat) -> LayoutEditor {
		
		return self.movingY(by: { _, _ in offset })
		
	}
	
	public func movingOrigin(by offset: @escaping AdditionalPointEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.moveOriginBy(offset)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingOrigin(by offset: CGPoint) -> LayoutEditor {
		
		return self.movingOrigin(by: { _, _ in offset })
		
	}
	
}

extension LayoutEditor {
	
	public func pinchingLeft(to left: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.pinchLeftTo(left)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingLeft(to left: CGFloat) -> LayoutEditor {
		
		return self.pinchingLeft(to: { _, _ in left })
		
	}
	
	public func pinchingLeft(by left: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.pinchLeftBy(left)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingLeft(by left: CGFloat) -> LayoutEditor {
		
		return self.pinchingLeft(by: { _, _ in left })
		
	}
	
}

extension LayoutEditor {
	
	public func pinchingRight(to right: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.pinchRightTo(right)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingRight(to right: CGFloat) -> LayoutEditor {
		
		return self.pinchingRight(to: { _, _ in right })
		
	}
	
	public func pinchingRight(by right: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.pinchRightBy(right)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingRight(by right: CGFloat) -> LayoutEditor {
		
		return self.pinchingRight(by: { _, _ in right })
		
	}
	
}

extension LayoutEditor {
	
	public func pinchingTop(to top: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.pinchTopTo(top)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingTop(to top: CGFloat) -> LayoutEditor {
		
		return self.pinchingTop(to: { _, _ in top })
		
	}
	
	public func pinchingTop(by top: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.pinchTopBy(top)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingTop(by top: CGFloat) -> LayoutEditor {
		
		return self.pinchingTop(by: { _, _ in top })
		
	}
	
}

extension LayoutEditor {
	
	public func pinchingBottom(to bottom: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.pinchBottomTo(bottom)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingBottom(to bottom: CGFloat) -> LayoutEditor {
		
		return self.pinchingBottom(to: { _, _ in bottom })
		
	}
	
	public func pinchingBottom(by bottom: @escaping AdditionalFloatEvaluation) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.pinchBottomBy(bottom)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingBottom(by bottom: CGFloat) -> LayoutEditor {
		
		return self.pinchingBottom(by: { _, _ in bottom })
		
	}
	
}

extension LayoutEditor {
	
	public func expandingWidth(to width: @escaping AdditionalFloatEvaluation, from reference: CGRect.HorizontalBaseLine) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.expandWidthTo(width, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingWidth(to width: CGFloat, from reference: CGRect.HorizontalBaseLine) -> LayoutEditor {
		
		return self.expandingWidth(to: { _, _ in width }, from: reference)
		
	}
	
	public func expandingWidth(by diff: @escaping AdditionalFloatEvaluation, from reference: CGRect.HorizontalBaseLine) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.expandWidthBy(diff, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingWidth(by diff: CGFloat, from reference: CGRect.HorizontalBaseLine) -> LayoutEditor {
		
		return self.expandingWidth(by: { _, _ in diff }, from: reference)
		
	}
	
}

extension LayoutEditor {
	
	public func expandingHeight(to height: @escaping AdditionalFloatEvaluation, from reference: CGRect.VerticalBaseLine) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.expandHeightTo(height, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingHeight(to height: CGFloat, from reference: CGRect.VerticalBaseLine) -> LayoutEditor {
		
		return self.expandingHeight(to: { _, _ in height }, from: reference)
		
	}
	
	public func expandingHeight(by diff: @escaping AdditionalFloatEvaluation, from reference: CGRect.VerticalBaseLine) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.expandHeightBy(diff, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingHeight(by diff: CGFloat, from reference: CGRect.VerticalBaseLine) -> LayoutEditor {
		
		return self.expandingHeight(by: { _, _ in diff }, from: reference)
		
	}
	
}

extension LayoutEditor {
	
	public func expandingSize(to size: @escaping AdditionalSizeEvaluation, from reference: CGRect.PlaneBasePoint) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.expandSizeTo(size, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingSize(to size: CGSize, from reference: CGRect.PlaneBasePoint) -> LayoutEditor {
		
		return self.expandingSize(to: { _, _ in size }, from: reference)
		
	}
	
	public func expandingSize(by diff: @escaping AdditionalSizeEvaluation, from reference: CGRect.PlaneBasePoint) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.expandSizeBy(diff, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingSize(by diff: CGSize, from reference: CGRect.PlaneBasePoint) -> LayoutEditor {
		
		return self.expandingSize(by: { _, _ in diff }, from: reference)
		
	}
	
}

extension LayoutEditor {
	
	public func addingProcess(by process: @escaping AdditionalProcess) -> LayoutEditor {
		
		let evaluation = FrameAdditionalEvaluation.addotionalProcess(process)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
}
