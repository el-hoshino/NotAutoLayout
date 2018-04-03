//
//  MiddleLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleLeft {
	
		let middleLeft: LayoutElement.Point
	
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleLeft {
	
	private func makeFrame(middleLeft: Point, topCenter: Point) -> Rect {
		
		let width = (topCenter.x - middleLeft.x).double
		let height = topCenter.y - middleLeft.y
		let size = Size(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: Point, topRight: Point) -> Rect {
		
		let width = topRight.x - middleLeft.x
		let height = (middleLeft.y - topRight.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: Point, bottomCenter: Point) -> Rect {
		
		let width = (bottomCenter.x - middleLeft.x).double
		let height = (bottomCenter.y - middleLeft.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: Point, bottomRight: Point) -> Rect {
		
		let width = bottomRight.x - middleLeft.x
		let height = (bottomRight.y - middleLeft.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: Point, size: Size) -> Rect {
		
		let x = middleLeft.x
		let y = middleLeft.y - size.height.half
		let origin = Point(x: x, y: y)
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopCenter
extension IndividualProperty.MiddleLeft: LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public func evaluateFrame(topCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let topCenter = topCenter.evaluated(from: parameters)
		
		return self.makeFrame(middleLeft: middleLeft, topCenter: topCenter)
		
	}
	
}

// MARK: TopRight
extension IndividualProperty.MiddleLeft: LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public func evaluateFrame(topRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let topRight = topRight.evaluated(from: parameters)
		
		return self.makeFrame(middleLeft: middleLeft, topRight: topRight)
		
	}
	
}

// MARK: BottomCenter
extension IndividualProperty.MiddleLeft: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let bottomCenter = bottomCenter.evaluated(from: parameters)
		
		return self.makeFrame(middleLeft: middleLeft, bottomCenter: bottomCenter)
		
	}
	
}

// MARK: BottomRight
extension IndividualProperty.MiddleLeft: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let bottomRight = bottomRight.evaluated(from: parameters)
		
		return self.makeFrame(middleLeft: middleLeft, bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.MiddleLeft: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension IndividualProperty.MiddleLeft: LayoutPropertyCanStoreCenterType {
	
	public func storeCenter(_ center: LayoutElement.Horizontal) -> IndividualProperty.MiddleLeftCenter {
		
		let middleLeftCenter = IndividualProperty.MiddleLeftCenter(middleLeft: self.middleLeft,
																   center: center)
		
		return middleLeftCenter
		
	}
	
}

// MARK: Right
extension IndividualProperty.MiddleLeft: LayoutPropertyCanStoreRightType {
	
	public func storeRight(_ right: LayoutElement.Horizontal) -> IndividualProperty.MiddleLeftRight {
		
		let middleLeftRight = IndividualProperty.MiddleLeftRight(middleLeft: self.middleLeft,
																 right: right)
		
		return middleLeftRight
		
	}
	
}

// MARK: Top
extension IndividualProperty.MiddleLeft: LayoutPropertyCanStoreTopType {
	
	public func storeTop(_ top: LayoutElement.Vertical) -> IndividualProperty.MiddleLeftTop {
		
		let middleLeftTop = IndividualProperty.MiddleLeftTop(middleLeft: self.middleLeft,
															 top: top)
		
		return middleLeftTop
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleLeft: LayoutPropertyCanStoreBottomType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> IndividualProperty.MiddleLeftBottom {
		
		let middleLeftBottom = IndividualProperty.MiddleLeftBottom(middleLeft: self.middleLeft,
																   bottom: bottom)
		
		return middleLeftBottom
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleLeft: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.MiddleLeftWidth
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.MiddleLeft>) -> LayoutMaker<IndividualProperty.MiddleLeftWidth> {
		
		let middleLeftWidth = IndividualProperty.MiddleLeftWidth(middleLeft: self.middleLeft,
																	width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleLeftWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.MiddleLeft: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.MiddleLeftHeight
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.MiddleLeft>) -> LayoutMaker<IndividualProperty.MiddleLeftHeight> {
		
		let middleLeftHeight = IndividualProperty.MiddleLeftHeight(middleLeft: self.middleLeft,
																	  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleLeftHeight)
		
		return maker
		
	}
	
}
