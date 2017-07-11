//
//  LayoutIndividualAdditions.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/07/11.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Layout.Individual {
	
	public typealias Evaluation = (_ boundSize: CGSize) -> CGFloat

}

extension Layout.Individual {
	
	public var additionalEvaluationsRemoved: Layout.Individual {
		return self.settingAdditionalEvaluations([])
	}
	
}

extension Layout.Individual {
	
	public func movingLeft(to left: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.moveLeftTo(left)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingLeft(to left: CGFloat) -> Layout.Individual {
		
		return self.movingLeft(to: { _ in left })
		
	}
	
	public func movingCenter(to center: @escaping (_ boundSize: CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.moveCenterTo(center)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingCenter(to center: CGFloat) -> Layout.Individual {
		
		return self.movingCenter(to: { _ in center })
		
	}
	
	public func movingRight(to right: @escaping (_ boundSize: CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.moveRightTo(right)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingRight(to right: CGFloat) -> Layout.Individual {
		
		return self.movingRight(to: { _ in right })
		
	}
	
}

extension Layout.Individual {
	
	public func movingTop(to top: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.moveTopTo(top)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingTop(to top: CGFloat) -> Layout.Individual {
		
		return self.movingTop(to: { _ in top })
		
	}
	
	public func movingMiddle(to middle: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.moveMiddleTo(middle)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingMiddle(to middle: CGFloat) -> Layout.Individual {
		
		return self.movingMiddle(to: { _ in middle })
		
	}
	
	public func movingBottom(to bottom: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.moveBottomTo(bottom)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingBottom(to bottom: CGFloat) -> Layout.Individual {
		
		return self.movingBottom(to: { _ in bottom })
		
	}
	
}

extension Layout.Individual {
	
	public func movingHorizontally(by offset: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.moveHorizontallyBy(offset)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingHorizontally(by offset: CGFloat) -> Layout.Individual {
		
		return self.movingHorizontally(by: { _ in offset })
		
	}
	
	public func movingVertically(by offset: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.moveVerticallyBy(offset)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func movingVertically(by offset: CGFloat) -> Layout.Individual {
		
		return self.movingVertically(by: { _ in offset })
		
	}
	
}

extension Layout.Individual {
	
	public func pinchingLeft(to left: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.pinchLeftTo(left)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingLeft(to left: CGFloat) -> Layout.Individual {
		
		return self.pinchingLeft(to: { _ in left })
		
	}
	
	public func pinchingLeft(by left: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.pinchLeftTo(left)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingLeft(by left: CGFloat) -> Layout.Individual {
		
		return self.pinchingLeft(by: { _ in left })
		
	}
	
}

extension Layout.Individual {
	
	public func pinchingRight(to right: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.pinchRightTo(right)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingRight(to right: CGFloat) -> Layout.Individual {
		
		return self.pinchingRight(to: { _ in right })
		
	}
	
	public func pinchingRight(by right: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.pinchRightTo(right)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingRight(by right: CGFloat) -> Layout.Individual {
		
		return self.pinchingRight(by: { _ in right })
		
	}
	
}

extension Layout.Individual {
	
	public func pinchingTop(to top: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.pinchTopTo(top)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingTop(to top: CGFloat) -> Layout.Individual {
		
		return self.pinchingTop(to: { _ in top })
		
	}
	
	public func pinchingTop(by top: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.pinchTopTo(top)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingTop(by top: CGFloat) -> Layout.Individual {
		
		return self.pinchingTop(by: { _ in top })
		
	}
	
}

extension Layout.Individual {
	
	public func pinchingBottom(to bottom: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.pinchBottomTo(bottom)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingBottom(to bottom: CGFloat) -> Layout.Individual {
		
		return self.pinchingBottom(to: { _ in bottom })
		
	}
	
	public func pinchingBottom(by bottom: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.pinchBottomTo(bottom)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func pinchingBottom(by bottom: CGFloat) -> Layout.Individual {
		
		return self.pinchingBottom(by: { _ in bottom })
		
	}
	
}

extension Layout.Individual {
	
	public func expandingWidth(to width: @escaping (_ boundSize: CGSize) -> CGFloat, from reference: CGRect.HorizontalBasePoint) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.expandWidthTo(width, from: reference)
		return self.addingAdditionalEvaluation(evaluation)

	}
	
	public func expandingWidth(to width: CGFloat, from reference: CGRect.HorizontalBasePoint) -> Layout.Individual {
		
		return self.expandingWidth(to:{ _ in width }, from: reference)
		
	}
	
	public func expandingWidth(by diff: @escaping (_ boundSize: CGSize) -> CGFloat, from reference: CGRect.HorizontalBasePoint) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.expandWidthBy(diff, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingWidth(by diff: CGFloat, from reference: CGRect.HorizontalBasePoint) -> Layout.Individual {
		
		return self.expandingWidth(by:{ _ in diff }, from: reference)
		
	}
	
}

extension Layout.Individual {
	
	public func expandingHeight(to height: @escaping (_ boundSize: CGSize) -> CGFloat, from reference: CGRect.VerticalBasePoint) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.expandHeightTo(height, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingHeight(to height: CGFloat, from reference: CGRect.VerticalBasePoint) -> Layout.Individual {
		
		return self.expandingHeight(to:{ _ in height }, from: reference)
		
	}
	
	public func expandingHeight(by diff: @escaping (_ boundSize: CGSize) -> CGFloat, from reference: CGRect.VerticalBasePoint) -> Layout.Individual {
		
		let evaluation = FrameAdditionalEvaluation.expandHeightBy(diff, from: reference)
		return self.addingAdditionalEvaluation(evaluation)
		
	}
	
	public func expandingHeight(by diff: CGFloat, from reference: CGRect.VerticalBasePoint) -> Layout.Individual {
		
		return self.expandingHeight(by:{ _ in diff }, from: reference)
		
	}
	
}
