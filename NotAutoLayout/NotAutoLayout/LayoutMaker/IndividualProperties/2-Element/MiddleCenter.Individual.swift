//
//  MiddleCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleCenter {
		
		let middleCenter: LayoutElement.Point
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleCenter {
	
	private func makeFrame(middleCenter: Point, topLeft: Point) -> Rect {
		
		let width = (middleCenter.x - topLeft.x).double
		let height = (middleCenter.y - topLeft.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: Point, topRight: Point) -> Rect {
		
		let width = (topRight.x - middleCenter.x).double
		let height = (middleCenter.y - topRight.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: Point, bottomLeft: Point) -> Rect {
		
		let width = (middleCenter.x - bottomLeft.x).double
		let height = (bottomLeft.y - middleCenter.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: Point, bottomRight: Point) -> Rect {
		
		let width = (bottomRight.x - middleCenter.x).double
		let height = (bottomRight.y - middleCenter.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: Point, size: Size) -> Rect {
		
		let x = middleCenter.x - size.width.half
		let y = middleCenter.y - size.height.half
		let origin = Point(x: x, y: y)
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
	
	public func evaluateFrame(topLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let topLeft = topLeft.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, topLeft: topLeft)
		
	}
	
}

// MARK: TopRight
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public func evaluateFrame(topRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let topRight = topRight.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, topRight: topRight)
		
	}
	
}

// MARK: BottomLeft
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let bottomLeft = bottomLeft.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomRight
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let bottomRight = bottomRight.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreLeftType {
	
	public func storeLeft(_ left: LayoutElement.Horizontal) -> IndividualProperty.MiddleCenterLeft {
		
		let middleCenterLeft = IndividualProperty.MiddleCenterLeft(middleCenter: self.middleCenter,
																   left: left)
		
		return middleCenterLeft
		
	}
	
}

// MARK: Right
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreRightType {
	
	public func storeRight(_ right: LayoutElement.Horizontal) -> IndividualProperty.MiddleCenterRight {
		
		let middleCenterRight = IndividualProperty.MiddleCenterRight(middleCenter: self.middleCenter,
																	 right: right)
		
		return middleCenterRight
		
	}
	
}

// MARK: Top
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreTopType {
	
	public func storeTop(_ top: LayoutElement.Vertical) -> IndividualProperty.MiddleCenterTop {
		
		let middleCenterTop = IndividualProperty.MiddleCenterTop(middleCenter: self.middleCenter,
																 top: top)
		
		return middleCenterTop
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.MiddleCenterBottom
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.MiddleCenter>) -> LayoutMaker<IndividualProperty.MiddleCenterBottom> {
		
		let middleCenterBottom = IndividualProperty.MiddleCenterBottom(middleCenter: self.middleCenter,
																		  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.MiddleCenterWidth
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.MiddleCenter>) -> LayoutMaker<IndividualProperty.MiddleCenterWidth> {
		
		let middleCenterWidth = IndividualProperty.MiddleCenterWidth(middleCenter: self.middleCenter,
																		width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.MiddleCenterHeight
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.MiddleCenter>) -> LayoutMaker<IndividualProperty.MiddleCenterHeight> {
		
		let middleCenterHeight = IndividualProperty.MiddleCenterHeight(middleCenter: self.middleCenter,
																		  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterHeight)
		
		return maker
		
	}
	
}
