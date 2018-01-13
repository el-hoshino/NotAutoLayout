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
	
	public typealias WillSetTopLeftProperty = LayoutEditor
	
	public func evaluateFrame(topLeft: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let middleRight = self.middleRight.evaluated(from: property)
		let topLeft = topLeft.evaluated(from: property)
		return self.makeFrame(middleRight: middleRight, topLeft: topLeft)
	}
	
}

// MARK: TopCenter
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public typealias WillSetTopCenterProperty = LayoutEditor
	
	public func evaluateFrame(topCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let middleRight = self.middleRight.evaluated(from: property)
		let topCenter = topCenter.evaluated(from: property)
		return self.makeFrame(middleRight: middleRight, topCenter: topCenter)
	}
	
}

// MARK: BottomLeft
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public typealias WillSetBottomLeftProperty = LayoutEditor
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let middleRight = self.middleRight.evaluated(from: property)
		let bottomLeft = bottomLeft.evaluated(from: property)
		return self.makeFrame(middleRight: middleRight, bottomLeft: bottomLeft)
	}
	
}

// MARK: BottomCenter
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public typealias WillSetBottomCenterProperty = LayoutEditor
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let middleRight = self.middleRight.evaluated(from: property)
		let bottomCenter = bottomCenter.evaluated(from: property)
		return self.makeFrame(middleRight: middleRight, bottomCenter: bottomCenter)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeProperty = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = DidStoreMiddleRightLeftLayoutProperty
	
	public func storeLeft(_ left: LayoutElement.Line) -> DidStoreMiddleRightLeftLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 left: left)
		
	}
	
}

// MARK: Center
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreMiddleRightCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Line) -> DidStoreMiddleRightCenterLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 center: center)
		
	}
	
}

// MARK: Top
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreMiddleRightTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreMiddleRightTopLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 top: top)
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreMiddleRightBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreMiddleRightBottomLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreMiddleRightWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreMiddleRightWidthLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreMiddleRightLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreMiddleRightHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreMiddleRightHeightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 height: height)
		
	}
	
}
