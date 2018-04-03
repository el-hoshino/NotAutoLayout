//
//  TopRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopRight {
		
		let topRight: LayoutElement.Point
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopRight {
	
	private func makeFrame(topRight: Point, middleLeft: Point) -> Rect {
		
		let width = topRight.x - middleLeft.x
		let height = (middleLeft.y - topRight.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: Point, middleCenter: Point) -> Rect {
		
		let width = (topRight.x - middleCenter.x).double
		let height = (middleCenter.y - topRight.y).double
		let size = Size(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: Point, bottomLeft: Point) -> Rect {
		
		let width = topRight.x - bottomLeft.x
		let height = bottomLeft.y - topRight.y
		let size = Size(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: Point, bottomCenter: Point) -> Rect {
		
		let width = (topRight.x - bottomCenter.x).double
		let height = bottomCenter.y - topRight.y
		let size = Size(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: Point, size: Size) -> Rect {
		
		let x = topRight.x - size.width
		let y = topRight.y
		let width = size.width
		let height = size.height
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleLeft
extension IndividualProperty.TopRight: LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let middleLeft = middleLeft.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleCenter
extension IndividualProperty.TopRight: LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let middleCenter = middleCenter.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, middleCenter: middleCenter)
		
	}
	
}

// MARK: BottomLeft
extension IndividualProperty.TopRight: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let bottomLeft = bottomLeft.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomCenter
extension IndividualProperty.TopRight: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let bottomCenter = bottomCenter.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, bottomCenter: bottomCenter)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.TopRight: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.TopRight: LayoutPropertyCanStoreLeftType {
	
	public func storeLeft(_ left: LayoutElement.Horizontal) -> IndividualProperty.TopRightLeft {
		
		let topRightLeft = IndividualProperty.TopRightLeft(topRight: self.topRight,
														   left: left)
		
		return topRightLeft
		
	}
	
}

// MARK: Center
extension IndividualProperty.TopRight: LayoutPropertyCanStoreCenterType {
	
	public func storeCenter(_ center: LayoutElement.Horizontal) -> IndividualProperty.TopRightCenter {
		
		let topRightCenter = IndividualProperty.TopRightCenter(topRight: self.topRight,
															   center: center)
		
		return topRightCenter
		
	}
	
}

// MARK: Middle
extension IndividualProperty.TopRight: LayoutPropertyCanStoreMiddleType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> IndividualProperty.TopRightMiddle {
		
		let topRightMiddle = IndividualProperty.TopRightMiddle(topRight: self.topRight,
															   middle: middle)
		
		return topRightMiddle
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopRight: LayoutPropertyCanStoreBottomType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> IndividualProperty.TopRightBottom {
		
		let topRightBottom = IndividualProperty.TopRightBottom(topRight: self.topRight,
															   bottom: bottom)
		
		return topRightBottom
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopRight: LayoutPropertyCanStoreWidthType {
	
	public func storeWidth(_ width: LayoutElement.Length) -> IndividualProperty.TopRightWidth {
		
		let topRightWidth = IndividualProperty.TopRightWidth(topRight: self.topRight,
															 width: width)
		
		return topRightWidth
		
	}
	
}

// MARK: Height
extension IndividualProperty.TopRight: LayoutPropertyCanStoreHeightType {
	
	public func storeHeight(_ height: LayoutElement.Length) -> IndividualProperty.TopRightHeight {
		
		let topRightHeight = IndividualProperty.TopRightHeight(topRight: self.topRight,
															   height: height)
		
		return topRightHeight
		
	}
	
}
