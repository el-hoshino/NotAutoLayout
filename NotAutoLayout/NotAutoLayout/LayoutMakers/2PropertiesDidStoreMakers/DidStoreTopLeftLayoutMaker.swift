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
	
	public typealias WillSetMiddleCenterProperty = LayoutEditor
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: property)
		let middleCenter = middleCenter.evaluated(from: property)
		return self.makeFrame(topLeft: topLeft, middleCenter: middleCenter)
	}
	
}

// MARK: MiddleRight
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public typealias WillSetMiddleRightProperty = LayoutEditor
	
	public func evaluateFrame(middleRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: property)
		let middleRight = middleRight.evaluated(from: property)
		return self.makeFrame(topLeft: topLeft, middleRight: middleRight)
	}
	
}

// MARK: BottomCenter
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public typealias WillSetBottomCenterProperty = LayoutEditor
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: property)
		let bottomCenter = bottomCenter.evaluated(from: property)
		return self.makeFrame(topLeft: topLeft, bottomCenter: bottomCenter)
	}
	
}

// MARK: BottomRight
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public typealias WillSetBottomRightProperty = LayoutEditor
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: property)
		let bottomRight = bottomRight.evaluated(from: property)
		return self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
	}
	
}
// MARK: - Set A Size -
// MARK: Size
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeProperty = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreTopLeftCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Line) -> DidStoreTopLeftCenterLayoutProperty {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 center: center)
		
	}
	
}

// MARK: Right
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreTopLeftRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreTopLeftRightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 right: right)
		
	}
	
}

// MARK: Middle
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreTopLeftMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreTopLeftMiddleLayoutProperty {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreTopLeftBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreTopLeftBottomLayoutProperty {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreTopLeftWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreTopLeftWidthLayoutProperty {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreTopLeftLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreTopLeftHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreTopLeftHeightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 height: height)
		
	}
	
}
