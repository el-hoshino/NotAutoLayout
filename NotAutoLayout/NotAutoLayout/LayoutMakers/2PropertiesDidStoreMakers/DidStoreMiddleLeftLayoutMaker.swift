//
//  MiddleLeftDidSetLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleLeftLayoutProperty {
		
	let middleLeft: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreMiddleLeftLayoutProperty {
	
	private func makeFrame(middleLeft: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (topCenter.x - middleLeft.x).doubled
		let height = topCenter.y - middleLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = topRight.x - middleLeft.x
		let height = (middleLeft.y - topRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - middleLeft.x).doubled
		let height = (bottomCenter.y - middleLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = bottomRight.x - middleLeft.x
		let height = (bottomRight.y - middleLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleLeft.x
		let y = middleLeft.y - size.height.halved
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopCenter
extension DidStoreMiddleLeftLayoutProperty: LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public func evaluateFrame(topCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let topCenter = topCenter.evaluated(from: property)
		
		return self.makeFrame(middleLeft: middleLeft, topCenter: topCenter)
		
	}
	
}

// MARK: TopRight
extension DidStoreMiddleLeftLayoutProperty: LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public func evaluateFrame(topRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let topRight = topRight.evaluated(from: property)
		
		return self.makeFrame(middleLeft: middleLeft, topRight: topRight)
		
	}
	
}

// MARK: BottomCenter
extension DidStoreMiddleLeftLayoutProperty: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let bottomCenter = bottomCenter.evaluated(from: property)
		
		return self.makeFrame(middleLeft: middleLeft, bottomCenter: bottomCenter)
		
	}
	
}

// MARK: BottomRight
extension DidStoreMiddleLeftLayoutProperty: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let bottomRight = bottomRight.evaluated(from: property)
		
		return self.makeFrame(middleLeft: middleLeft, bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreMiddleLeftLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let size = size.evaluated(from: property)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension DidStoreMiddleLeftLayoutProperty: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreMiddleLeftCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreMiddleLeftLayoutProperty>) -> LayoutMaker<DidStoreMiddleLeftCenterLayoutProperty> {
		
		let middleLeftCenter = DidStoreMiddleLeftCenterLayoutProperty(middleLeft: self.middleLeft,
																	  center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleLeftCenter)
		
		return maker
		
	}
	
}

// MARK: Right
extension DidStoreMiddleLeftLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreMiddleLeftRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreMiddleLeftLayoutProperty>) -> LayoutMaker<DidStoreMiddleLeftRightLayoutProperty> {
		
		let middleLeftRight = DidStoreMiddleLeftRightLayoutProperty(middleLeft: self.middleLeft,
																	right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleLeftRight)
		
		return maker
		
	}
	
}

// MARK: Top
extension DidStoreMiddleLeftLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreMiddleLeftTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreMiddleLeftLayoutProperty>) -> LayoutMaker<DidStoreMiddleLeftTopLayoutProperty> {
		
		let middleLeftTop = DidStoreMiddleLeftTopLayoutProperty(middleLeft: self.middleLeft,
																top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleLeftTop)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleLeftLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreMiddleLeftBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreMiddleLeftLayoutProperty>) -> LayoutMaker<DidStoreMiddleLeftBottomLayoutProperty> {
		
		let middleLeftBottom = DidStoreMiddleLeftBottomLayoutProperty(middleLeft: self.middleLeft,
																	  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleLeftBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleLeftLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreMiddleLeftWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<DidStoreMiddleLeftLayoutProperty>) -> LayoutMaker<DidStoreMiddleLeftWidthLayoutProperty> {
		
		let middleLeftWidth = DidStoreMiddleLeftWidthLayoutProperty(middleLeft: self.middleLeft,
																	width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleLeftWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension DidStoreMiddleLeftLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreMiddleLeftHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<DidStoreMiddleLeftLayoutProperty>) -> LayoutMaker<DidStoreMiddleLeftHeightLayoutProperty> {
		
		let middleLeftHeight = DidStoreMiddleLeftHeightLayoutProperty(middleLeft: self.middleLeft,
																	  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleLeftHeight)
		
		return maker
		
	}
	
}
