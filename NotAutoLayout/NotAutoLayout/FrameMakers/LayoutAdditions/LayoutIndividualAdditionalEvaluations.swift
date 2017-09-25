//
//  LayoutIndividualAdditions.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/07/11.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Layout {
	
	public typealias AdditionalFloatEvaluation = (_ frame: CGRect, _ parameter: LayoutControlParameter) -> CGFloat
	public typealias AdditionalPointEvaluation = (_ frame: CGRect, _ parameter: LayoutControlParameter) -> CGPoint
	public typealias AdditionalSizeEvaluation = (_ frame: CGRect, _ parameter: LayoutControlParameter) -> CGSize
	
	public typealias AdditionalProcess = (_ view: UIView, _ frame: CGRect, _ parameter: LayoutControlParameter) -> Void
	
}

extension Layout {
	
	public var resettingAdditionalEvaluations: Layout {
		return self.settingAdditionalEvaluations(to: [])
	}
	
}

extension Layout {
	
	public func movingLeft(to left: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.moveLeftTo(left)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingLeft(to left: CGFloat) -> Layout {
		
		return self.movingLeft(to: { _, _ in left })
		
	}
	
	public func movingCenter(to center: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.moveCenterTo(center)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingCenter(to center: CGFloat) -> Layout {
		
		return self.movingCenter(to: { _, _ in center })
		
	}
	
	public func movingRight(to right: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.moveRightTo(right)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingRight(to right: CGFloat) -> Layout {
		
		return self.movingRight(to: { _, _ in right })
		
	}
	
}

extension Layout {
	
	public func movingTop(to top: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.moveTopTo(top)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingTop(to top: CGFloat) -> Layout {
		
		return self.movingTop(to: { _, _ in top })
		
	}
	
	public func movingMiddle(to middle: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.moveMiddleTo(middle)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingMiddle(to middle: CGFloat) -> Layout {
		
		return self.movingMiddle(to: { _, _ in middle })
		
	}
	
	public func movingBottom(to bottom: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.moveBottomTo(bottom)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingBottom(to bottom: CGFloat) -> Layout {
		
		return self.movingBottom(to: { _, _ in bottom })
		
	}
	
}

extension Layout {
	
	public func movingX(by offset: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.moveXBy(offset)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingX(by offset: CGFloat) -> Layout {
		
		return self.movingX(by: { _, _ in offset })
		
	}
	
	public func movingY(by offset: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.moveYBy(offset)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingY(by offset: CGFloat) -> Layout {
		
		return self.movingY(by: { _, _ in offset })
		
	}
	
	public func movingOrigin(by offset: @escaping AdditionalPointEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.moveOriginBy(offset)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingOrigin(by offset: CGPoint) -> Layout {
		
		return self.movingOrigin(by: { _, _ in offset })
		
	}
	
}

extension Layout {
	
	public func pinchingLeft(to left: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.pinchLeftTo(left)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingLeft(to left: CGFloat) -> Layout {
		
		return self.pinchingLeft(by: { _, _ in left })
		
	}
	
	public func pinchingLeft(by left: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.pinchLeftTo(left)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingLeft(by left: CGFloat) -> Layout {
		
		return self.pinchingLeft(by: { _, _ in left })
		
	}
	
}

extension Layout {
	
	public func pinchingRight(to right: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.pinchRightTo(right)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingRight(to right: CGFloat) -> Layout {
		
		return self.pinchingRight(by: { _, _ in right })
		
	}
	
	public func pinchingRight(by right: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.pinchRightTo(right)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingRight(by right: CGFloat) -> Layout {
		
		return self.pinchingRight(by: { _, _ in right })
		
	}
	
}

extension Layout {
	
	public func pinchingTop(to top: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.pinchTopTo(top)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingTop(to top: CGFloat) -> Layout {
		
		return self.pinchingTop(by: { _, _ in top })
		
	}
	
	public func pinchingTop(by top: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.pinchTopBy(top)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingTop(by top: CGFloat) -> Layout {
		
		return self.pinchingTop(by: { _, _ in top })
		
	}
	
}

extension Layout {
	
	public func pinchingBottom(to bottom: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.pinchBottomTo(bottom)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingBottom(to bottom: CGFloat) -> Layout {
		
		return self.pinchingBottom(by: { _, _ in bottom })
		
	}
	
	public func pinchingBottom(by bottom: @escaping AdditionalFloatEvaluation) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.pinchBottomBy(bottom)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingBottom(by bottom: CGFloat) -> Layout {
		
		return self.pinchingBottom(by: { _, _ in bottom })
		
	}
	
}

extension Layout {
	
	public func expandingWidth(to width: @escaping AdditionalFloatEvaluation, from reference: CGRect.HorizontalBasePoint) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.expandWidthTo(width, from: reference)
		return self.addingAdditionalEvaluation(evaluation)

	}
	
	public func expandingWidth(to width: CGFloat, from reference: CGRect.HorizontalBasePoint) -> Layout {
		
		return self.expandingWidth(to: { _, _ in width }, from: reference)
		
	}
	
	public func expandingWidth(by diff: @escaping AdditionalFloatEvaluation, from reference: CGRect.HorizontalBasePoint) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.expandWidthBy(diff, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingWidth(by diff: CGFloat, from reference: CGRect.HorizontalBasePoint) -> Layout {
		
		return self.expandingWidth(by: { _, _ in diff }, from: reference)
		
	}
	
}

extension Layout {
	
	public func expandingHeight(to height: @escaping AdditionalFloatEvaluation, from reference: CGRect.VerticalBasePoint) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.expandHeightTo(height, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingHeight(to height: CGFloat, from reference: CGRect.VerticalBasePoint) -> Layout {
		
		return self.expandingHeight(to: { _, _ in height }, from: reference)
		
	}
	
	public func expandingHeight(by diff: @escaping AdditionalFloatEvaluation, from reference: CGRect.VerticalBasePoint) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.expandHeightBy(diff, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingHeight(by diff: CGFloat, from reference: CGRect.VerticalBasePoint) -> Layout {
		
		return self.expandingHeight(by: { _, _ in diff }, from: reference)
		
	}
	
}

extension Layout {
	
	public func expandingSize(to size: @escaping AdditionalSizeEvaluation, from reference: CGRect.PlaneBasePoint) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.expandSizeTo(size, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingSize(to size: CGSize, from reference: CGRect.PlaneBasePoint) -> Layout {
		
		return self.expandingSize(to: { _, _ in size }, from: reference)
		
	}
	
	public func expandingSize(by diff: @escaping AdditionalSizeEvaluation, from reference: CGRect.PlaneBasePoint) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.expandSizeBy(diff, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingSize(by diff: CGSize, from reference: CGRect.PlaneBasePoint) -> Layout {
		
		return self.expandingSize(by: { _, _ in diff }, from: reference)
		
	}
	
}

extension Layout {
	
	public func addingProcess(by process: @escaping AdditionalProcess) -> Layout {
		
		let evaluation = FrameAdditionalEvaluation.addotionalProcess(process)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
}
