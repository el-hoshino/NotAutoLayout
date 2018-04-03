//
//  BottomCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomCenter {
		
		let bottomCenter: LayoutElement.Point
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomCenter {
	
	private func makeFrame(bottomCenter: Point, topLeft: Point) -> Rect {
		
		let width = (bottomCenter.x - topLeft.x).double
		let height = bottomCenter.y - topLeft.y
		let size = Size(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: Point, topRight: Point) -> Rect {
		
		let width = (topRight.x - bottomCenter.x).double
		let height = bottomCenter.y - topRight.y
		let size = Size(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: Point, middleLeft: Point) -> Rect {
		
		let width = (bottomCenter.x - middleLeft.x).double
		let height = (bottomCenter.y - middleLeft.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: Point, middleRight: Point) -> Rect {
		
		let width = (middleRight.x - bottomCenter.x).double
		let height = (bottomCenter.y - middleRight.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: Point, size: Size) -> Rect {
		
		let x = bottomCenter.x - size.width.half
		let y = bottomCenter.y - size.height
		let origin = Point(x: x, y: y)
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension IndividualProperty.BottomCenter: LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
	
	public func evaluateFrame(topLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let topLeft = topLeft.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, topLeft: topLeft)
		
	}
	
}

// MARK: TopRight
extension IndividualProperty.BottomCenter: LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public func evaluateFrame(topRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let topRight = topRight.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, topRight: topRight)
		
	}
	
}

// MARK: MiddleLeft
extension IndividualProperty.BottomCenter: LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let middleLeft = middleLeft.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleRight
extension IndividualProperty.BottomCenter: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func evaluateFrame(middleRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let middleRight = middleRight.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, middleRight: middleRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.BottomCenter: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.BottomCenter: LayoutPropertyCanStoreLeftType {
	
	public func storeLeft(_ left: LayoutElement.Horizontal) -> IndividualProperty.BottomCenterLeft {
		
		let bottomCenterLeft = IndividualProperty.BottomCenterLeft(bottomCenter: self.bottomCenter,
																   left: left)
		
		return bottomCenterLeft
		
	}
	
}

// MARK: Right
extension IndividualProperty.BottomCenter: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = IndividualProperty.BottomCenterRight
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<IndividualProperty.BottomCenter>) -> LayoutMaker<IndividualProperty.BottomCenterRight> {
		
		let bottomCenterRight = IndividualProperty.BottomCenterRight(bottomCenter: self.bottomCenter,
																		right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenterRight)
		
		return maker
		
	}
	
}

// MARK: Top
extension IndividualProperty.BottomCenter: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = IndividualProperty.BottomCenterTop
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.BottomCenter>) -> LayoutMaker<IndividualProperty.BottomCenterTop> {
		
		let bottomCenterTop = IndividualProperty.BottomCenterTop(bottomCenter: self.bottomCenter,
																	top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenterTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.BottomCenter: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.BottomCenterMiddle
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.BottomCenter>) -> LayoutMaker<IndividualProperty.BottomCenterMiddle> {
		
		let bottomCenterMiddle = IndividualProperty.BottomCenterMiddle(bottomCenter: self.bottomCenter,
																		  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenterMiddle)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.BottomCenter: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.BottomCenterWidth
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.BottomCenter>) -> LayoutMaker<IndividualProperty.BottomCenterWidth> {
		
		let bottomCenterWidth = IndividualProperty.BottomCenterWidth(bottomCenter: self.bottomCenter,
																		width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenterWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.BottomCenter: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.BottomCenterHeight
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.BottomCenter>) -> LayoutMaker<IndividualProperty.BottomCenterHeight> {
		
		let bottomCenterHeight = IndividualProperty.BottomCenterHeight(bottomCenter: self.bottomCenter,
																		  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenterHeight)
		
		return maker
		
	}
	
}
