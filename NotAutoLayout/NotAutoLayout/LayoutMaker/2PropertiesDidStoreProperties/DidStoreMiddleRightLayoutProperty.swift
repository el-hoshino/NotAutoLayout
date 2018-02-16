//
//  DidStoreMiddleRightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleRightLayoutProperty {
		
	let middleRight: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreMiddleRightLayoutProperty {
	
	private func makeFrame(middleRight: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = middleRight.x - topLeft.x
		let height = (middleRight.y - topLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (middleRight.x - topCenter.x).doubled
		let height = (middleRight.y - topCenter.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = middleRight.x - bottomLeft.x
		let height = (bottomLeft.y - middleRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (middleRight.x - bottomCenter.x).doubled
		let height = (bottomCenter.y - middleRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleRight.x - size.width
		let y = middleRight.y - size.height.halved
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
		
	public func evaluateFrame(topLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let topLeft = topLeft.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, topLeft: topLeft)
		
	}
	
}

// MARK: TopCenter
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public func evaluateFrame(topCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let topCenter = topCenter.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, topCenter: topCenter)
		
	}
	
}

// MARK: BottomLeft
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let bottomLeft = bottomLeft.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomCenter
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let bottomCenter = bottomCenter.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, bottomCenter: bottomCenter)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = DidStoreMiddleRightLeftLayoutProperty
	
	public func storeLeft(_ left: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreMiddleRightLayoutProperty>) -> LayoutMaker<DidStoreMiddleRightLeftLayoutProperty> {
		
		let middleRightLeft = DidStoreMiddleRightLeftLayoutProperty(middleRight: self.middleRight,
																	left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRightLeft)
		
		return maker
		
	}
	
}

// MARK: Center
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreMiddleRightCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreMiddleRightLayoutProperty>) -> LayoutMaker<DidStoreMiddleRightCenterLayoutProperty> {
		
		let middleRightCenter = DidStoreMiddleRightCenterLayoutProperty(middleRight: self.middleRight,
																		center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRightCenter)
		
		return maker
		
	}
	
}

// MARK: Top
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreMiddleRightTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreMiddleRightLayoutProperty>) -> LayoutMaker<DidStoreMiddleRightTopLayoutProperty> {
		
		let middleRightTop = DidStoreMiddleRightTopLayoutProperty(middleRight: self.middleRight,
																  top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRightTop)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreMiddleRightBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreMiddleRightLayoutProperty>) -> LayoutMaker<DidStoreMiddleRightBottomLayoutProperty> {
		
		let middleRightBottom = DidStoreMiddleRightBottomLayoutProperty(middleRight: self.middleRight,
																		bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRightBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreMiddleRightWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<DidStoreMiddleRightLayoutProperty>) -> LayoutMaker<DidStoreMiddleRightWidthLayoutProperty> {
		
		let middleRightWidth = DidStoreMiddleRightWidthLayoutProperty(middleRight: self.middleRight,
																	  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRightWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreMiddleRightHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<DidStoreMiddleRightLayoutProperty>) -> LayoutMaker<DidStoreMiddleRightHeightLayoutProperty> {
		
		let middleRightHeight = DidStoreMiddleRightHeightLayoutProperty(middleRight: self.middleRight,
																		height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRightHeight)
		
		return maker
		
	}
	
}
