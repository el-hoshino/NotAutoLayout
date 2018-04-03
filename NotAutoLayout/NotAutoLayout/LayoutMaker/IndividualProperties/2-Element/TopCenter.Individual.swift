//
//  TopCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopCenter {
		
		let topCenter: LayoutElement.Point
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopCenter {
	
	private func makeFrame(topCenter: Point, middleLeft: Point) -> Rect {
		
		let width = (topCenter.x - middleLeft.x).double
		let height = (middleLeft.y - topCenter.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: Point, middleRight: Point) -> Rect {
		
		let width = (middleRight.x - topCenter.x).double
		let height = (middleRight.y - topCenter.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: Point, bottomLeft: Point) -> Rect {
		
		let width = (topCenter.x - bottomLeft.x).double
		let height = bottomLeft.y - topCenter.y
		let size = Size(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: Point, bottomRight: Point) -> Rect {
		
		let width = (bottomRight.x - topCenter.x).double
		let height = bottomRight.y - topCenter.y
		let size = Size(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: Point, size: Size) -> Rect {
		
		let x = topCenter.x - size.width.half
		let y = topCenter.y
		let origin = Point(x: x, y: y)
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleLeft
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let middleLeft = middleLeft.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleRight
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func evaluateFrame(middleRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let middleRight = middleRight.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, middleRight: middleRight)
		
	}
	
}

// MARK: BottomLeft
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let bottomLeft = bottomLeft.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomRight
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let bottomRight = bottomRight.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreLeftType {
	
	public func storeLeft(_ left: LayoutElement.Horizontal) -> IndividualProperty.TopCenterLeft {
		
		let topCenterLeft = IndividualProperty.TopCenterLeft(topCenter: self.topCenter,
															 left: left)
		
		return topCenterLeft
		
	}
	
}

// MARK: Right
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreRightType {
	
	public func storeRight(_ right: LayoutElement.Horizontal) -> IndividualProperty.TopCenterRight {
		
		let topCenterRight = IndividualProperty.TopCenterRight(topCenter: self.topCenter,
															   right: right)
		
		return topCenterRight
		
	}
	
}

// MARK: Middle
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreMiddleType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> IndividualProperty.TopCenterMiddle {
		
		let topCenterMiddle = IndividualProperty.TopCenterMiddle(topCenter: self.topCenter,
																 middle: middle)
		
		return topCenterMiddle
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.TopCenterBottom
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.TopCenter>) -> LayoutMaker<IndividualProperty.TopCenterBottom> {
		
		let topCenterBottom = IndividualProperty.TopCenterBottom(topCenter: self.topCenter,
																	bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.TopCenterWidth
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.TopCenter>) -> LayoutMaker<IndividualProperty.TopCenterWidth> {
		
		let topCenterWidth = IndividualProperty.TopCenterWidth(topCenter: self.topCenter,
																  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreHeightType {

	public typealias WillSetHeightProperty = IndividualProperty.TopCenterHeight
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.TopCenter>) -> LayoutMaker<IndividualProperty.TopCenterHeight> {
		
		let topCenterHeight = IndividualProperty.TopCenterHeight(topCenter: self.topCenter,
																	height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterHeight)
		
		return maker
		
	}
	
}
