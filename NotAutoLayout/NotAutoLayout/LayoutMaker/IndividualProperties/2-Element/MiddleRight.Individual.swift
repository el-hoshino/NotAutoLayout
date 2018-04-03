//
//  MiddleRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleRight {
		
		let middleRight: LayoutElement.Point
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleRight {
	
	private func makeFrame(middleRight: Point, topLeft: Point) -> Rect {
		
		let width = middleRight.x - topLeft.x
		let height = (middleRight.y - topLeft.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: Point, topCenter: Point) -> Rect {
		
		let width = (middleRight.x - topCenter.x).double
		let height = (middleRight.y - topCenter.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: Point, bottomLeft: Point) -> Rect {
		
		let width = middleRight.x - bottomLeft.x
		let height = (bottomLeft.y - middleRight.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: Point, bottomCenter: Point) -> Rect {
		
		let width = (middleRight.x - bottomCenter.x).double
		let height = (bottomCenter.y - middleRight.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: Point, size: Size) -> Rect {
		
		let x = middleRight.x - size.width
		let y = middleRight.y - size.height.half
		let origin = Point(x: x, y: y)
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
		
	public func evaluateFrame(topLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let topLeft = topLeft.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, topLeft: topLeft)
		
	}
	
}

// MARK: TopCenter
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public func evaluateFrame(topCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let topCenter = topCenter.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, topCenter: topCenter)
		
	}
	
}

// MARK: BottomLeft
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let bottomLeft = bottomLeft.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomCenter
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let bottomCenter = bottomCenter.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, bottomCenter: bottomCenter)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreLeftType {
	
	public func storeLeft(_ left: LayoutElement.Horizontal) -> IndividualProperty.MiddleRightLeft {
		
		let middleRightLeft = IndividualProperty.MiddleRightLeft(middleRight: self.middleRight,
																 left: left)
		
		return middleRightLeft
		
	}
	
}

// MARK: Center
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreCenterType {
	
	public func storeCenter(_ center: LayoutElement.Horizontal) -> IndividualProperty.MiddleRightCenter {
		
		let middleRightCenter = IndividualProperty.MiddleRightCenter(middleRight: self.middleRight,
																	 center: center)
		
		return middleRightCenter
		
	}
	
}

// MARK: Top
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreTopType {
	
	public func storeTop(_ top: LayoutElement.Vertical) -> IndividualProperty.MiddleRightTop {
		
		let middleRightTop = IndividualProperty.MiddleRightTop(middleRight: self.middleRight,
															   top: top)
		
		return middleRightTop
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreBottomType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> IndividualProperty.MiddleRightBottom {
		
		let middleRightBottom = IndividualProperty.MiddleRightBottom(middleRight: self.middleRight,
																	 bottom: bottom)
		
		return middleRightBottom
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreWidthType {
	
	public func storeWidth(_ width: LayoutElement.Length) -> IndividualProperty.MiddleRightWidth {
		
		let middleRightWidth = IndividualProperty.MiddleRightWidth(middleRight: self.middleRight,
																   width: width)
		
		return middleRightWidth
		
	}
	
}

// MARK: Height
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.MiddleRightHeight
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.MiddleRight>) -> LayoutMaker<IndividualProperty.MiddleRightHeight> {
		
		let middleRightHeight = IndividualProperty.MiddleRightHeight(middleRight: self.middleRight,
																		height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRightHeight)
		
		return maker
		
	}
	
}
