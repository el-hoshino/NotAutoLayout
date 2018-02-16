//
//  DidStoreTopLeftLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopLeftLayoutProperty {
	
	let topLeft: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreTopLeftLayoutProperty {
	
	private func makeFrame(topLeft: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - topLeft.x).doubled
		let height = (middleCenter.y - topLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = middleRight.x - topLeft.x
		let height = (middleRight.y - topLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - topLeft.x).doubled
		let height = bottomCenter.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = bottomRight.x - topLeft.x
		let height = bottomRight.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, size: CGSize) -> CGRect {
		
		let origin = topLeft
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleCenter
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let middleCenter = middleCenter.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, middleCenter: middleCenter)
		
	}
	
}

// MARK: MiddleRight
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func evaluateFrame(middleRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let middleRight = middleRight.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, middleRight: middleRight)
		
	}
	
}

// MARK: BottomCenter
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let bottomCenter = bottomCenter.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, bottomCenter: bottomCenter)
		
	}
	
}

// MARK: BottomRight
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let bottomRight = bottomRight.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
		
	}
	
}
// MARK: - Set A Size -
// MARK: Size
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreTopLeftCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreTopLeftLayoutProperty>) -> LayoutMaker<DidStoreTopLeftCenterLayoutProperty> {
		
		let topLeftCenter = DidStoreTopLeftCenterLayoutProperty(topLeft: self.topLeft,
																center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeftCenter)
		
		return maker
		
	}
	
}

// MARK: Right
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreTopLeftRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreTopLeftLayoutProperty>) -> LayoutMaker<DidStoreTopLeftRightLayoutProperty> {
		
		let topLeftRight = DidStoreTopLeftRightLayoutProperty(topLeft: self.topLeft,
															  right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeftRight)
		
		return maker
		
	}
	
}

// MARK: Middle
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreTopLeftMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreTopLeftLayoutProperty>) -> LayoutMaker<DidStoreTopLeftMiddleLayoutProperty> {
		
		let topLeftMiddle = DidStoreTopLeftMiddleLayoutProperty(topLeft: self.topLeft,
																middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeftMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreTopLeftBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreTopLeftLayoutProperty>) -> LayoutMaker<DidStoreTopLeftBottomLayoutProperty> {
		
		let topLeftBottom = DidStoreTopLeftBottomLayoutProperty(topLeft: self.topLeft,
																bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeftBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreTopLeftWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<DidStoreTopLeftLayoutProperty>) -> LayoutMaker<DidStoreTopLeftWidthLayoutProperty> {
		
		let topLeftWidth = DidStoreTopLeftWidthLayoutProperty(topLeft: self.topLeft,
															  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeftWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreTopLeftHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<DidStoreTopLeftLayoutProperty>) -> LayoutMaker<DidStoreTopLeftHeightLayoutProperty> {
		
		let topLeftHeight = DidStoreTopLeftHeightLayoutProperty(topLeft: self.topLeft,
																height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeftHeight)
		
		return maker
		
	}
	
}
