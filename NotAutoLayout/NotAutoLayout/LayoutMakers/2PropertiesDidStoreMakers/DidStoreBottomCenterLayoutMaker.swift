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

// MARK: TopRight

// MARK: MiddleLeft

// MARK: MiddleRight

// MARK: - Set A Size -
// MARK: Size
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeProperty = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = DidStoreBottomCenterLeftLayoutProperty
	
	public func storeLeft(_ left: LayoutElement.Line) -> DidStoreBottomCenterLeftLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 left: left)
		
	}
	
}

// MARK: Right
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreBottomCenterRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreBottomCenterRightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 right: right)
		
	}
	
}

// MARK: Top
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreBottomCenterTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreBottomCenterTopLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreBottomCenterMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreBottomCenterMiddleLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreBottomCenterWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreBottomCenterWidthLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreBottomCenterLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreBottomCenterHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreBottomCenterHeightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 height: height)
		
	}
	
}
