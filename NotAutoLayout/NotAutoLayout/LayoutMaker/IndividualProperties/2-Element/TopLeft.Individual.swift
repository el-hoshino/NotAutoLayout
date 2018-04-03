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
	
	private func makeFrame(topLeft: Point, middleCenter: Point) -> Rect {
		
		let width = (middleCenter.x - topLeft.x).double
		let height = (middleCenter.y - topLeft.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: Point, middleRight: Point) -> Rect {
		
		let width = middleRight.x - topLeft.x
		let height = (middleRight.y - topLeft.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: Point, bottomCenter: Point) -> Rect {
		
		let width = (bottomCenter.x - topLeft.x).double
		let height = bottomCenter.y - topLeft.y
		let size = Size(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: Point, bottomRight: Point) -> Rect {
		
		let width = bottomRight.x - topLeft.x
		let height = bottomRight.y - topLeft.y
		let size = Size(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: Point, size: Size) -> Rect {
		
		let origin = topLeft
		let size = size
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleCenter
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let middleCenter = middleCenter.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, middleCenter: middleCenter)
		
	}
	
}

// MARK: MiddleRight
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func evaluateFrame(middleRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let middleRight = middleRight.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, middleRight: middleRight)
		
	}
	
}

// MARK: BottomCenter
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let bottomCenter = bottomCenter.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, bottomCenter: bottomCenter)
		
	}
	
}

// MARK: BottomRight
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let bottomRight = bottomRight.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
		
	}
	
}
// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreCenterType {
	
	public func storeCenter(_ center: LayoutElement.Horizontal) -> IndividualProperty.TopLeftCenter {
		
		let topLeftCenter = IndividualProperty.TopLeftCenter(topLeft: self.topLeft,
															 center: center)
		
		return topLeftCenter
		
	}
	
}

// MARK: Right
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreRightType {
	
	public func storeRight(_ right: LayoutElement.Horizontal) -> IndividualProperty.TopLeftRight {
		
		let topLeftRight = IndividualProperty.TopLeftRight(topLeft: self.topLeft,
														   right: right)
		
		return topLeftRight
		
	}
	
}

// MARK: Middle
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreMiddleType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> IndividualProperty.TopLeftMiddle {
		
		let topLeftMiddle = IndividualProperty.TopLeftMiddle(topLeft: self.topLeft,
															 middle: middle)
		
		return topLeftMiddle
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopLeft: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.TopLeftBottom
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.TopLeft>) -> LayoutMaker<IndividualProperty.TopLeftBottom> {
		
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
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.TopLeft>) -> LayoutMaker<IndividualProperty.TopLeftWidth> {
		
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
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.TopLeft>) -> LayoutMaker<IndividualProperty.TopLeftHeight> {
		
		let topLeftHeight = IndividualProperty.TopLeftHeight(topLeft: self.topLeft,
																height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeftHeight)
		
		return maker
		
	}
	
}
