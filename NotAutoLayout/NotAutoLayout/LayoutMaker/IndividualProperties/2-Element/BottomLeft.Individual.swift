//
//  BottomLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomLeft {
		
		let bottomLeft: LayoutElement.Point
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomLeft {
	
	private func makeFrame(bottomLeft: Point, topCenter: Point) -> Rect {
		
		let width = (topCenter.x - bottomLeft.x).double
		let height = bottomLeft.y - topCenter.y
		let size = Size(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: Point, topRight: Point) -> Rect {
		
		let width = topRight.x - bottomLeft.x
		let height = bottomLeft.y - topRight.y
		let size = Size(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: Point, middleCenter: Point) -> Rect {
		
		let width = (middleCenter.x - bottomLeft.x).double
		let height = (bottomLeft.y - middleCenter.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: Point, middleRight: Point) -> Rect {
		
		let width = middleRight.x - bottomLeft.x
		let height = (bottomLeft.y - middleRight.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: Point, size: Size) -> Rect {
		
		let x = bottomLeft.x
		let y = bottomLeft.y - size.height
		let width = size.width
		let height = size.height
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopCenter
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public func evaluateFrame(topCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let topCenter = topCenter.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, topCenter: topCenter)
		
	}
	
}

// MARK: TopRight
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public func evaluateFrame(topRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let topRight = topRight.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, topRight: topRight)
		
	}
	
}

// MARK: MiddleCenter
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let middleCenter = middleCenter.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, middleCenter: middleCenter)
		
	}
	
}

// MARK: MiddleRight
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func evaluateFrame(middleRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let middleRight = middleRight.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, middleRight: middleRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreCenterType {
	
	public func storeCenter(_ center: LayoutElement.Horizontal) -> IndividualProperty.BottomLeftCenter {
		
		let bottomLeftCenter = IndividualProperty.BottomLeftCenter(bottomLeft: self.bottomLeft,
																   center: center)
		
		return bottomLeftCenter
		
	}
	
}

// MARK: Right
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreRightType {
	
	public func storeRight(_ right: LayoutElement.Horizontal) -> IndividualProperty.BottomLeftRight {
		
		let bottomLeftRight = IndividualProperty.BottomLeftRight(bottomLeft: self.bottomLeft,
																 right: right)
		
		return bottomLeftRight
		
	}
	
}

// MARK: Top
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreTopType {
	
	public func storeTop(_ top: LayoutElement.Vertical) -> IndividualProperty.BottomLeftTop {
		
		let bottomLeftTop = IndividualProperty.BottomLeftTop(bottomLeft: self.bottomLeft,
															 top: top)
		
		return bottomLeftTop
		
	}
	
}

// MARK: Middle
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreMiddleType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> IndividualProperty.BottomLeftMiddle {
		
		let bottomLeftMiddle = IndividualProperty.BottomLeftMiddle(bottomLeft: self.bottomLeft,
																   middle: middle)
		
		return bottomLeftMiddle
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.BottomLeftWidth
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.BottomLeft>) -> LayoutMaker<IndividualProperty.BottomLeftWidth> {
		
		let bottomLeftWidth = IndividualProperty.BottomLeftWidth(bottomLeft: self.bottomLeft,
																	width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.BottomLeftHeight
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.BottomLeft>) -> LayoutMaker<IndividualProperty.BottomLeftHeight> {
		
		let bottomLeftHeight = IndividualProperty.BottomLeftHeight(bottomLeft: self.bottomLeft,
																	  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftHeight)
		
		return maker
		
	}
	
}
