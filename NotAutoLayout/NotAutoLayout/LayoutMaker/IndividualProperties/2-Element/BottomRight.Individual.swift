//
//  BottomRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomRight {
		
		let bottomRight: LayoutElement.Point
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomRight {
	
	private func makeFrame(bottomRight: Point, topLeft: Point) -> Rect {
		
		let width = bottomRight.x - topLeft.x
		let height = bottomRight.y - topLeft.y
		let size = Size(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: Point, topCenter: Point) -> Rect {
		
		let width = (bottomRight.x - topCenter.x).double
		let height = bottomRight.y - topCenter.y
		let size = Size(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: Point, middleLeft: Point) -> Rect {
		
		let width = bottomRight.x - middleLeft.x
		let height = (bottomRight.y - middleLeft.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: Point, middleCenter: Point) -> Rect {
		
		let width = (bottomRight.x - middleCenter.x).double
		let height = (bottomRight.y - middleCenter.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: Point, size: Size) -> Rect {
		
		let x = bottomRight.x - size.width
		let y = bottomRight.y - size.height
		let origin = Point(x: x, y: y)
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension IndividualProperty.BottomRight: LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
	
	public func evaluateFrame(topLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let topLeft = topLeft.evaluated(from: parameters)
		
		return self.makeFrame(bottomRight: bottomRight, topLeft: topLeft)
		
	}
	
}

// MARK: TopCenter
extension IndividualProperty.BottomRight: LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public func evaluateFrame(topCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let topCenter = topCenter.evaluated(from: parameters)
		
		return self.makeFrame(bottomRight: bottomRight, topCenter: topCenter)
		
	}
	
}

// MARK: MiddleLeft
extension IndividualProperty.BottomRight: LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let middleLeft = middleLeft.evaluated(from: parameters)
		
		return self.makeFrame(bottomRight: bottomRight, middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleCenter
extension IndividualProperty.BottomRight: LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let middleCenter = middleCenter.evaluated(from: parameters)
		
		return self.makeFrame(bottomRight: bottomRight, middleCenter: middleCenter)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.BottomRight: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.BottomRight: LayoutPropertyCanStoreLeftType {
	
	public func storeLeft(_ left: LayoutElement.Horizontal) -> IndividualProperty.BottomRightLeft {
		
		let bottomRightLeft = IndividualProperty.BottomRightLeft(bottomRight: self.bottomRight,
																 left: left)
		
		return bottomRightLeft
		
	}
	
}

// MARK: Center
extension IndividualProperty.BottomRight: LayoutPropertyCanStoreCenterType {
	
	public func storeCenter(_ center: LayoutElement.Horizontal) -> IndividualProperty.BottomRightCenter {
		
		let bottomRightCenter = IndividualProperty.BottomRightCenter(bottomRight: self.bottomRight,
																	 center: center)
		
		return bottomRightCenter
		
	}
	
}

// MARK: Top
extension IndividualProperty.BottomRight: LayoutPropertyCanStoreTopType {
	
	public func storeTop(_ top: LayoutElement.Vertical) -> IndividualProperty.BottomRightTop {
		
		let bottomRightTop = IndividualProperty.BottomRightTop(bottomRight: self.bottomRight,
															   top: top)
		
		return bottomRightTop
		
	}
	
}

// MARK: Middle
extension IndividualProperty.BottomRight: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.BottomRightMiddle
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.BottomRight>) -> LayoutMaker<IndividualProperty.BottomRightMiddle> {
		
		let bottomRightMiddle = IndividualProperty.BottomRightMiddle(bottomRight: self.bottomRight,
																		middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomRightMiddle)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.BottomRight: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.BottomRightWidth
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.BottomRight>) -> LayoutMaker<IndividualProperty.BottomRightWidth> {
		
		let bottomRightWidth = IndividualProperty.BottomRightWidth(bottomRight: self.bottomRight,
																	  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomRightWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.BottomRight: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.BottomRightHeight
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.BottomRight>) -> LayoutMaker<IndividualProperty.BottomRightHeight> {
		
		let bottomRightHeight = IndividualProperty.BottomRightHeight(bottomRight: self.bottomRight,
																		height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomRightHeight)
		
		return maker
		
	}
	
}
