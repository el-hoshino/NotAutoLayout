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
	
	public typealias WillSetTopLeftProperty = LayoutEditor
	
	public func evaluateFrame(topLeft: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: property)
		let topLeft = topLeft.evaluated(from: property)
		return self.makeFrame(bottomRight: bottomRight, topLeft: topLeft)
	}
	
}

// MARK: TopCenter
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public typealias WillSetTopCenterProperty = LayoutEditor
	
	public func evaluateFrame(topCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: property)
		let topCenter = topCenter.evaluated(from: property)
		return self.makeFrame(bottomRight: bottomRight, topCenter: topCenter)
	}
	
}

// MARK: MiddleLeft
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public typealias WillSetMiddleLeftProperty = LayoutEditor
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: property)
		let middleLeft = middleLeft.evaluated(from: property)
		return self.makeFrame(bottomRight: bottomRight, middleLeft: middleLeft)
	}
	
}

// MARK: MiddleCenter
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public typealias WillSetMiddleCenterProperty = LayoutEditor
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: property)
		let middleCenter = middleCenter.evaluated(from: property)
		return self.makeFrame(bottomRight: bottomRight, middleCenter: middleCenter)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeProperty = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = DidStoreBottomRightLeftLayoutProperty
	
	public func storeLeft(_ left: LayoutElement.Line) -> DidStoreBottomRightLeftLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 left: left)
		
	}
	
}

// MARK: Center
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreBottomRightCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Line) -> DidStoreBottomRightCenterLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 center: center)
		
	}
	
}

// MARK: Top
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreBottomRightTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreBottomRightTopLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreBottomRightMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreBottomRightMiddleLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreBottomRightWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreBottomRightWidthLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreBottomRightLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreBottomRightHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreBottomRightHeightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 height: height)
		
	}
	
}
