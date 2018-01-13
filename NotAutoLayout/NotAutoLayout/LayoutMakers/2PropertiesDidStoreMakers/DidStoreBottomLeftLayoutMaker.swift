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
	
	public typealias WillSetTopCenterProperty = LayoutEditor
	
	public func evaluateFrame(topCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let topCenter = topCenter.evaluated(from: property)
		return self.makeFrame(bottomLeft: bottomLeft, topCenter: topCenter)
	}
	
}

// MARK: TopRight
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public typealias WillSetTopRightProperty = LayoutEditor
	
	public func evaluateFrame(topRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let topRight = topRight.evaluated(from: property)
		return self.makeFrame(bottomLeft: bottomLeft, topRight: topRight)
	}
	
}

// MARK: MiddleCenter
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public typealias WillSetMiddleCenterProperty = LayoutEditor
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let middleCenter = middleCenter.evaluated(from: property)
		return self.makeFrame(bottomLeft: bottomLeft, middleCenter: middleCenter)
	}
	
}

// MARK: MiddleRight
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public typealias WillSetMiddleRightProperty = LayoutEditor
	
	public func evaluateFrame(middleRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let middleRight = middleRight.evaluated(from: property)
		return self.makeFrame(bottomLeft: bottomLeft, middleRight: middleRight)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeProperty = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreBottomLeftCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Line) -> DidStoreBottomLeftCenterLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 center: center)
		
	}
	
}

// MARK: Right
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreBottomLeftRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreBottomLeftRightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 right: right)
		
	}
	
}

// MARK: Top
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreBottomLeftTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreBottomLeftTopLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreBottomLeftMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreBottomLeftMiddleLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreBottomLeftWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreBottomLeftWidthLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreBottomLeftLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreBottomLeftHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreBottomLeftHeightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 height: height)
		
	}
	
}
