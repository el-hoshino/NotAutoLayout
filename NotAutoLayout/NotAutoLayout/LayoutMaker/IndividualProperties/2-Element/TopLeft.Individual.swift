//
//  TopLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopLeft {
		
		let topLeft: LayoutElement.Point
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopLeft {
	
	private func makeFrame(topLeft: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - topLeft.x).doubled
		let height = (middleCenter.y - topLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = middleRight.x - topLeft.x
		let height = (middleRight.y - topLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - topLeft.x).doubled
		let height = bottomCenter.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = bottomRight.x - topLeft.x
		let height = bottomRight.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, size: CGSize) -> CGRect {
		
		let origin = topLeft
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleCenter
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let middleCenter = middleCenter.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, middleCenter: middleCenter)
		
	}
	
}

// MARK: MiddleRight
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func evaluateFrame(middleRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let middleRight = middleRight.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, middleRight: middleRight)
		
	}
	
}

// MARK: BottomCenter
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let bottomCenter = bottomCenter.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, bottomCenter: bottomCenter)
		
	}
	
}

// MARK: BottomRight
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let bottomRight = bottomRight.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
		
	}
	
}
// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = IndividualProperty.TopLeftCenter
	
	public func storeCenter <ParentView> (_ center: LayoutElement.Horizontal, to maker: LayoutMaker<ParentView, IndividualProperty.TopLeft>) -> LayoutMaker<ParentView, IndividualProperty.TopLeftCenter> {
		
		let topLeftCenter = IndividualProperty.TopLeftCenter(topLeft: self.topLeft,
																center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeftCenter)
		
		return maker
		
	}
	
}

// MARK: Right
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = IndividualProperty.TopLeftRight
	
	public func storeRight <ParentView> (_ right: LayoutElement.Horizontal, to maker: LayoutMaker<ParentView, IndividualProperty.TopLeft>) -> LayoutMaker<ParentView, IndividualProperty.TopLeftRight> {
		
		let topLeftRight = IndividualProperty.TopLeftRight(topLeft: self.topLeft,
															  right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeftRight)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.TopLeftMiddle
	
	public func storeMiddle <ParentView> (_ middle: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.TopLeft>) -> LayoutMaker<ParentView, IndividualProperty.TopLeftMiddle> {
		
		let topLeftMiddle = IndividualProperty.TopLeftMiddle(topLeft: self.topLeft,
																middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeftMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.TopLeftBottom
	
	public func storeBottom <ParentView> (_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.TopLeft>) -> LayoutMaker<ParentView, IndividualProperty.TopLeftBottom> {
		
		let topLeftBottom = IndividualProperty.TopLeftBottom(topLeft: self.topLeft,
																bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeftBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.TopLeftWidth
	
	public func storeWidth <ParentView> (_ width: LayoutElement.Length, to maker: LayoutMaker<ParentView, IndividualProperty.TopLeft>) -> LayoutMaker<ParentView, IndividualProperty.TopLeftWidth> {
		
		let topLeftWidth = IndividualProperty.TopLeftWidth(topLeft: self.topLeft,
															  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeftWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.TopLeftHeight
	
	public func storeHeight <ParentView> (_ height: LayoutElement.Length, to maker: LayoutMaker<ParentView, IndividualProperty.TopLeft>) -> LayoutMaker<ParentView, IndividualProperty.TopLeftHeight> {
		
		let topLeftHeight = IndividualProperty.TopLeftHeight(topLeft: self.topLeft,
																height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeftHeight)
		
		return maker
		
	}
	
}
