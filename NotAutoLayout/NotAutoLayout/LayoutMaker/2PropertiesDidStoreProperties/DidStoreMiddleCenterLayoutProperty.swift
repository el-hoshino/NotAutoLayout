//
//  DidStoreMiddleCenterLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleCenterLayoutProperty {
		
	let middleCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreMiddleCenterLayoutProperty {
	
	private func makeFrame(middleCenter: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - topLeft.x).doubled
		let height = (middleCenter.y - topLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = (topRight.x - middleCenter.x).doubled
		let height = (middleCenter.y - topRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - bottomLeft.x).doubled
		let height = (bottomLeft.y - middleCenter.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - middleCenter.x).doubled
		let height = (bottomRight.y - middleCenter.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleCenter.x - size.width.halved
		let y = middleCenter.y - size.height.halved
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
	
	public func evaluateFrame(topLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let topLeft = topLeft.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, topLeft: topLeft)
		
	}
	
}

// MARK: TopRight
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public func evaluateFrame(topRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let topRight = topRight.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, topRight: topRight)
		
	}
	
}

// MARK: BottomLeft
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let bottomLeft = bottomLeft.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomRight
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let bottomRight = bottomRight.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = DidStoreMiddleCenterLeftLayoutProperty
	
	public func storeLeft(_ left: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreMiddleCenterLayoutProperty>) -> LayoutMaker<DidStoreMiddleCenterLeftLayoutProperty> {
		
		let middleCenterLeft = DidStoreMiddleCenterLeftLayoutProperty(middleCenter: self.middleCenter,
																	  left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterLeft)
		
		return maker
		
	}
	
}

// MARK: Right
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreMiddleCenterRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreMiddleCenterLayoutProperty>) -> LayoutMaker<DidStoreMiddleCenterRightLayoutProperty> {
		
		let middleCenterRight = DidStoreMiddleCenterRightLayoutProperty(middleCenter: self.middleCenter,
																		right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterRight)
		
		return maker
		
	}
	
}

// MARK: Top
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreMiddleCenterTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreMiddleCenterLayoutProperty>) -> LayoutMaker<DidStoreMiddleCenterTopLayoutProperty> {
		
		let middleCenterTop = DidStoreMiddleCenterTopLayoutProperty(middleCenter: self.middleCenter,
																	top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterTop)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreMiddleCenterBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreMiddleCenterLayoutProperty>) -> LayoutMaker<DidStoreMiddleCenterBottomLayoutProperty> {
		
		let middleCenterBottom = DidStoreMiddleCenterBottomLayoutProperty(middleCenter: self.middleCenter,
																		  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreMiddleCenterWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<DidStoreMiddleCenterLayoutProperty>) -> LayoutMaker<DidStoreMiddleCenterWidthLayoutProperty> {
		
		let middleCenterWidth = DidStoreMiddleCenterWidthLayoutProperty(middleCenter: self.middleCenter,
																		width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreMiddleCenterHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<DidStoreMiddleCenterLayoutProperty>) -> LayoutMaker<DidStoreMiddleCenterHeightLayoutProperty> {
		
		let middleCenterHeight = DidStoreMiddleCenterHeightLayoutProperty(middleCenter: self.middleCenter,
																		  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterHeight)
		
		return maker
		
	}
	
}
