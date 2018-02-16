//
//  TopRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopRight<ParentView: UIView> {
		
		let topRight: LayoutElement.Point<ParentView>
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopRight {
	
	private func makeFrame(topRight: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = topRight.x - middleLeft.x
		let height = (middleLeft.y - topRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (topRight.x - middleCenter.x).doubled
		let height = (middleCenter.y - topRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = topRight.x - bottomLeft.x
		let height = bottomLeft.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (topRight.x - bottomCenter.x).doubled
		let height = bottomCenter.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: CGPoint, size: CGSize) -> CGRect {
		
		let x = topRight.x - size.width
		let y = topRight.y
		let width = size.width
		let height = size.height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleLeft
extension IndividualProperty.TopRight: LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let middleLeft = middleLeft.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleCenter
extension IndividualProperty.TopRight: LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let middleCenter = middleCenter.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, middleCenter: middleCenter)
		
	}
	
}

// MARK: BottomLeft
extension IndividualProperty.TopRight: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let bottomLeft = bottomLeft.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomCenter
extension IndividualProperty.TopRight: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let bottomCenter = bottomCenter.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, bottomCenter: bottomCenter)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.TopRight: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.TopRight: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = IndividualProperty.TopRightLeft
	
	public func storeLeft <ParentView> (_ left: LayoutElement.Horizontal, to maker: LayoutMaker<ParentView, IndividualProperty.TopRight>) -> LayoutMaker<ParentView, IndividualProperty.TopRightLeft> {
		
		let topRightLeft = IndividualProperty.TopRightLeft(topRight: self.topRight,
															  left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topRightLeft)
		
		return maker
		
	}
	
}

// MARK: Center
extension IndividualProperty.TopRight: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = IndividualProperty.TopRightCenter
	
	public func storeCenter <ParentView> (_ center: LayoutElement.Horizontal, to maker: LayoutMaker<ParentView, IndividualProperty.TopRight>) -> LayoutMaker<ParentView, IndividualProperty.TopRightCenter> {
		
		let topRightCenter = IndividualProperty.TopRightCenter(topRight: self.topRight,
																  center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topRightCenter)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.TopRight: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.TopRightMiddle
	
	public func storeMiddle <ParentView> (_ middle: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.TopRight>) -> LayoutMaker<ParentView, IndividualProperty.TopRightMiddle> {
		
		let topRightMiddle = IndividualProperty.TopRightMiddle(topRight: self.topRight,
																  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topRightMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopRight: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.TopRightBottom
	
	public func storeBottom <ParentView> (_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.TopRight>) -> LayoutMaker<ParentView, IndividualProperty.TopRightBottom> {
		
		let topRightBottom = IndividualProperty.TopRightBottom(topRight: self.topRight,
																  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topRightBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopRight: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.TopRightWidth
	
	public func storeWidth <ParentView> (_ width: LayoutElement.Length, to maker: LayoutMaker<ParentView, IndividualProperty.TopRight>) -> LayoutMaker<ParentView, IndividualProperty.TopRightWidth> {
		
		let topRightWidth = IndividualProperty.TopRightWidth(topRight: self.topRight,
																width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topRightWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.TopRight: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.TopRightHeight
	
	public func storeHeight <ParentView> (_ height: LayoutElement.Length, to maker: LayoutMaker<ParentView, IndividualProperty.TopRight>) -> LayoutMaker<ParentView, IndividualProperty.TopRightHeight> {
		
		let topRightHeight = IndividualProperty.TopRightHeight(topRight: self.topRight,
																  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topRightHeight)
		
		return maker
		
	}
	
}
