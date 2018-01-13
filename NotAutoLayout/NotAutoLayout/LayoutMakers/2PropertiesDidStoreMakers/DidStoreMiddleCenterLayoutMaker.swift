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
	
	public typealias WillSetTopLeftProperty = LayoutEditor
	
	public func evaluateFrame(topLeft: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: property)
		let topLeft = topLeft.evaluated(from: property)
		return self.makeFrame(middleCenter: middleCenter, topLeft: topLeft)
		
	}
	
}

// MARK: TopRight
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public typealias WillSetTopRightProperty = LayoutEditor
	
	public func evaluateFrame(topRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let middleCenter = self.middleCenter.evaluated(from: property)
		let topRight = topRight.evaluated(from: property)
		return self.makeFrame(middleCenter: middleCenter, topRight: topRight)
	}
	
}

// MARK: BottomLeft
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public typealias WillSetBottomLeftProperty = LayoutEditor
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let middleCenter = self.middleCenter.evaluated(from: property)
		let bottomLeft = bottomLeft.evaluated(from: property)
		return self.makeFrame(middleCenter: middleCenter, bottomLeft: bottomLeft)
	}
	
}

// MARK: BottomRight
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public typealias WillSetBottomRightProperty = LayoutEditor
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let middleCenter = self.middleCenter.evaluated(from: property)
		let bottomRight = bottomRight.evaluated(from: property)
		return self.makeFrame(middleCenter: middleCenter, bottomRight: bottomRight)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeProperty = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = DidStoreMiddleCenterLeftLayoutProperty
	
	public func storeLeft(_ left: LayoutElement.Line) -> DidStoreMiddleCenterLeftLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 left: left)
		
	}
	
}

// MARK: Right
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreMiddleCenterRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreMiddleCenterRightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 right: right)
		
	}
	
}

// MARK: Top
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreMiddleCenterTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreMiddleCenterTopLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 top: top)
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreMiddleCenterBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreMiddleCenterBottomLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreMiddleCenterWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreMiddleCenterWidthLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreMiddleCenterLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreMiddleCenterHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreMiddleCenterHeightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 height: height)
		
	}
	
}
