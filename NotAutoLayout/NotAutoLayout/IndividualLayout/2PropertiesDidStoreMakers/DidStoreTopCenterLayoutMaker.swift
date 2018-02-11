//
//  DidStoreTopCenterLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopCenterLayoutProperty {
		
	let topCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreTopCenterLayoutProperty {
	
	private func makeFrame(topCenter: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = (topCenter.x - middleLeft.x).doubled
		let height = (middleLeft.y - topCenter.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = (middleRight.x - topCenter.x).doubled
		let height = (middleRight.y - topCenter.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = (topCenter.x - bottomLeft.x).doubled
		let height = bottomLeft.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - topCenter.x).doubled
		let height = bottomRight.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = topCenter.x - size.width.halved
		let y = topCenter.y
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleLeft
extension DidStoreTopCenterLayoutProperty: LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let middleLeft = middleLeft.evaluated(from: property)
		
		return self.makeFrame(topCenter: topCenter, middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleRight
extension DidStoreTopCenterLayoutProperty: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func evaluateFrame(middleRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let middleRight = middleRight.evaluated(from: property)
		
		return self.makeFrame(topCenter: topCenter, middleRight: middleRight)
		
	}
	
}

// MARK: BottomLeft
extension DidStoreTopCenterLayoutProperty: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let bottomLeft = bottomLeft.evaluated(from: property)
		
		return self.makeFrame(topCenter: topCenter, bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomRight
extension DidStoreTopCenterLayoutProperty: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let bottomRight = bottomRight.evaluated(from: property)
		
		return self.makeFrame(topCenter: topCenter, bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreTopCenterLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let size = size.evaluated(from: property)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreTopCenterLayoutProperty: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = DidStoreTopCenterLeftLayoutProperty
	
	public func storeLeft(_ left: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreTopCenterLayoutProperty>) -> LayoutMaker<DidStoreTopCenterLeftLayoutProperty> {
		
		let topCenterLeft = DidStoreTopCenterLeftLayoutProperty(topCenter: self.topCenter,
																left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterLeft)
		
		return maker
		
	}
	
}

// MARK: Right
extension DidStoreTopCenterLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreTopCenterRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreTopCenterLayoutProperty>) -> LayoutMaker<DidStoreTopCenterRightLayoutProperty> {
		
		let topCenterRight = DidStoreTopCenterRightLayoutProperty(topCenter: self.topCenter,
																  right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterRight)
		
		return maker
		
	}
	
}

// MARK: Middle
extension DidStoreTopCenterLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreTopCenterMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreTopCenterLayoutProperty>) -> LayoutMaker<DidStoreTopCenterMiddleLayoutProperty> {
		
		let topCenterMiddle = DidStoreTopCenterMiddleLayoutProperty(topCenter: self.topCenter,
																	middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension DidStoreTopCenterLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreTopCenterBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreTopCenterLayoutProperty>) -> LayoutMaker<DidStoreTopCenterBottomLayoutProperty> {
		
		let topCenterBottom = DidStoreTopCenterBottomLayoutProperty(topCenter: self.topCenter,
																	bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreTopCenterLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreTopCenterWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<DidStoreTopCenterLayoutProperty>) -> LayoutMaker<DidStoreTopCenterWidthLayoutProperty> {
		
		let topCenterWidth = DidStoreTopCenterWidthLayoutProperty(topCenter: self.topCenter,
																  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension DidStoreTopCenterLayoutProperty: LayoutPropertyCanStoreHeightType {

	public typealias WillSetHeightProperty = DidStoreTopCenterHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<DidStoreTopCenterLayoutProperty>) -> LayoutMaker<DidStoreTopCenterHeightLayoutProperty> {
		
		let topCenterHeight = DidStoreTopCenterHeightLayoutProperty(topCenter: self.topCenter,
																	height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterHeight)
		
		return maker
		
	}
	
}
