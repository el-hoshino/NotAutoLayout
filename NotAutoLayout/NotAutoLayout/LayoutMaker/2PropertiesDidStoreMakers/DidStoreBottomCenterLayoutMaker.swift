//
//  DidStoreBottomCenterLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomCenterLayoutProperty {
		
	let bottomCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreBottomCenterLayoutProperty {
	
	private func makeFrame(bottomCenter: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - topLeft.x).doubled
		let height = bottomCenter.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = (topRight.x - bottomCenter.x).doubled
		let height = bottomCenter.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - middleLeft.x).doubled
		let height = (bottomCenter.y - middleLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = (middleRight.x - bottomCenter.x).doubled
		let height = (bottomCenter.y - middleRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = bottomCenter.x - size.width.halved
		let y = bottomCenter.y - size.height
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
	
	public func evaluateFrame(topLeft: LayoutElement.Point, parameters: CalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let topLeft = topLeft.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, topLeft: topLeft)
		
	}
	
}

// MARK: TopRight
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public func evaluateFrame(topRight: LayoutElement.Point, parameters: CalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let topRight = topRight.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, topRight: topRight)
		
	}
	
}

// MARK: MiddleLeft
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, parameters: CalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let middleLeft = middleLeft.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleRight
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func evaluateFrame(middleRight: LayoutElement.Point, parameters: CalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let middleRight = middleRight.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, middleRight: middleRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: CalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = DidStoreBottomCenterLeftLayoutProperty
	
	public func storeLeft(_ left: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreBottomCenterLayoutProperty>) -> LayoutMaker<DidStoreBottomCenterLeftLayoutProperty> {
		
		let bottomCenterLeft = DidStoreBottomCenterLeftLayoutProperty(bottomCenter: self.bottomCenter,
																	  left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenterLeft)
		
		return maker
		
	}
	
}

// MARK: Right
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreBottomCenterRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreBottomCenterLayoutProperty>) -> LayoutMaker<DidStoreBottomCenterRightLayoutProperty> {
		
		let bottomCenterRight = DidStoreBottomCenterRightLayoutProperty(bottomCenter: self.bottomCenter,
																		right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenterRight)
		
		return maker
		
	}
	
}

// MARK: Top
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreBottomCenterTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreBottomCenterLayoutProperty>) -> LayoutMaker<DidStoreBottomCenterTopLayoutProperty> {
		
		let bottomCenterTop = DidStoreBottomCenterTopLayoutProperty(bottomCenter: self.bottomCenter,
																	top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenterTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreBottomCenterMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreBottomCenterLayoutProperty>) -> LayoutMaker<DidStoreBottomCenterMiddleLayoutProperty> {
		
		let bottomCenterMiddle = DidStoreBottomCenterMiddleLayoutProperty(bottomCenter: self.bottomCenter,
																		  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenterMiddle)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreBottomCenterWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<DidStoreBottomCenterLayoutProperty>) -> LayoutMaker<DidStoreBottomCenterWidthLayoutProperty> {
		
		let bottomCenterWidth = DidStoreBottomCenterWidthLayoutProperty(bottomCenter: self.bottomCenter,
																		width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenterWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreBottomCenterHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<DidStoreBottomCenterLayoutProperty>) -> LayoutMaker<DidStoreBottomCenterHeightLayoutProperty> {
		
		let bottomCenterHeight = DidStoreBottomCenterHeightLayoutProperty(bottomCenter: self.bottomCenter,
																		  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenterHeight)
		
		return maker
		
	}
	
}
