//
//  DidStoreBottomRightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomRightLayoutProperty {
		
	let bottomRight: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreBottomRightLayoutProperty {
	
	private func makeFrame(bottomRight: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = bottomRight.x - topLeft.x
		let height = bottomRight.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - topCenter.x).doubled
		let height = bottomRight.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = bottomRight.x - middleLeft.x
		let height = (bottomRight.y - middleLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - middleCenter.x).doubled
		let height = (bottomRight.y - middleCenter.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, size: CGSize) -> CGRect {
		
		let x = bottomRight.x - size.width
		let y = bottomRight.y - size.height
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
	
	public func evaluateFrame(topLeft: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: property)
		let topLeft = topLeft.evaluated(from: property)
		
		return self.makeFrame(bottomRight: bottomRight, topLeft: topLeft)
		
	}
	
}

// MARK: TopCenter
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public func evaluateFrame(topCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: property)
		let topCenter = topCenter.evaluated(from: property)
		
		return self.makeFrame(bottomRight: bottomRight, topCenter: topCenter)
		
	}
	
}

// MARK: MiddleLeft
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: property)
		let middleLeft = middleLeft.evaluated(from: property)
		
		return self.makeFrame(bottomRight: bottomRight, middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleCenter
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: property)
		let middleCenter = middleCenter.evaluated(from: property)
		
		return self.makeFrame(bottomRight: bottomRight, middleCenter: middleCenter)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: property)
		let size = size.evaluated(from: property)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = DidStoreBottomRightLeftLayoutProperty
	
	public func storeLeft(_ left: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreBottomRightLayoutProperty>) -> LayoutMaker<DidStoreBottomRightLeftLayoutProperty> {
		
		let bottomRightLeft = DidStoreBottomRightLeftLayoutProperty(bottomRight: self.bottomRight,
																	left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomRightLeft)
		
		return maker
		
	}
	
}

// MARK: Center
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreBottomRightCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreBottomRightLayoutProperty>) -> LayoutMaker<DidStoreBottomRightCenterLayoutProperty> {
		
		let bottomRightCenter = DidStoreBottomRightCenterLayoutProperty(bottomRight: self.bottomRight,
																		center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomRightCenter)
		
		return maker
		
	}
	
}

// MARK: Top
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreBottomRightTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreBottomRightLayoutProperty>) -> LayoutMaker<DidStoreBottomRightTopLayoutProperty> {
		
		let bottomRightTop = DidStoreBottomRightTopLayoutProperty(bottomRight: self.bottomRight,
																  top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomRightTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreBottomRightMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreBottomRightLayoutProperty>) -> LayoutMaker<DidStoreBottomRightMiddleLayoutProperty> {
		
		let bottomRightMiddle = DidStoreBottomRightMiddleLayoutProperty(bottomRight: self.bottomRight,
																		middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomRightMiddle)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreBottomRightWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<DidStoreBottomRightLayoutProperty>) -> LayoutMaker<DidStoreBottomRightWidthLayoutProperty> {
		
		let bottomRightWidth = DidStoreBottomRightWidthLayoutProperty(bottomRight: self.bottomRight,
																	  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomRightWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreBottomRightHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<DidStoreBottomRightLayoutProperty>) -> LayoutMaker<DidStoreBottomRightHeightLayoutProperty> {
		
		let bottomRightHeight = DidStoreBottomRightHeightLayoutProperty(bottomRight: self.bottomRight,
																		height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomRightHeight)
		
		return maker
		
	}
	
}
