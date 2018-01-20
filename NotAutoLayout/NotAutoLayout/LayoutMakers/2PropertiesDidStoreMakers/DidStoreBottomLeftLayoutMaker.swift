//
//  DidStoreBottomLeftLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomLeftLayoutProperty {
		
	let bottomLeft: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreBottomLeftLayoutProperty {
	
	private func makeFrame(bottomLeft: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (topCenter.x - bottomLeft.x).doubled
		let height = bottomLeft.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = topRight.x - bottomLeft.x
		let height = bottomLeft.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - bottomLeft.x).doubled
		let height = (bottomLeft.y - middleCenter.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = middleRight.x - bottomLeft.x
		let height = (bottomLeft.y - middleRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, size: CGSize) -> CGRect {
		
		let x = bottomLeft.x
		let y = bottomLeft.y - size.height
		let width = size.width
		let height = size.height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopCenter
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public func evaluateFrame(topCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let topCenter = topCenter.evaluated(from: property)
		
		return self.makeFrame(bottomLeft: bottomLeft, topCenter: topCenter)
		
	}
	
}

// MARK: TopRight
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public func evaluateFrame(topRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let topRight = topRight.evaluated(from: property)
		
		return self.makeFrame(bottomLeft: bottomLeft, topRight: topRight)
		
	}
	
}

// MARK: MiddleCenter
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let middleCenter = middleCenter.evaluated(from: property)
		
		return self.makeFrame(bottomLeft: bottomLeft, middleCenter: middleCenter)
		
	}
	
}

// MARK: MiddleRight
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func evaluateFrame(middleRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let middleRight = middleRight.evaluated(from: property)
		
		return self.makeFrame(bottomLeft: bottomLeft, middleRight: middleRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let size = size.evaluated(from: property)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreBottomLeftCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreBottomLeftLayoutProperty>) -> LayoutMaker<DidStoreBottomLeftCenterLayoutProperty> {
		
		let bottomLeftCenter = DidStoreBottomLeftCenterLayoutProperty(bottomLeft: self.bottomLeft,
																	  center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftCenter)
		
		return maker
		
	}
	
}

// MARK: Right
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreBottomLeftRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreBottomLeftLayoutProperty>) -> LayoutMaker<DidStoreBottomLeftRightLayoutProperty> {
		
		let bottomLeftRight = DidStoreBottomLeftRightLayoutProperty(bottomLeft: self.bottomLeft,
																	right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftRight)
		
		return maker
		
	}
	
}

// MARK: Top
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreBottomLeftTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreBottomLeftLayoutProperty>) -> LayoutMaker<DidStoreBottomLeftTopLayoutProperty> {
		
		let bottomLeftTop = DidStoreBottomLeftTopLayoutProperty(bottomLeft: self.bottomLeft,
																top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreBottomLeftMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreBottomLeftLayoutProperty>) -> LayoutMaker<DidStoreBottomLeftMiddleLayoutProperty> {
		
		let bottomLeftMiddle = DidStoreBottomLeftMiddleLayoutProperty(bottomLeft: self.bottomLeft,
																	  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftMiddle)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreBottomLeftWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<DidStoreBottomLeftLayoutProperty>) -> LayoutMaker<DidStoreBottomLeftWidthLayoutProperty> {
		
		let bottomLeftWidth = DidStoreBottomLeftWidthLayoutProperty(bottomLeft: self.bottomLeft,
																	width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreBottomLeftHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<DidStoreBottomLeftLayoutProperty>) -> LayoutMaker<DidStoreBottomLeftHeightLayoutProperty> {
		
		let bottomLeftHeight = DidStoreBottomLeftHeightLayoutProperty(bottomLeft: self.bottomLeft,
																	  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftHeight)
		
		return maker
		
	}
	
}
