//
//  DidStoreTopRightLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopRightLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topRight: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreTopRightLayoutMaker {
	
	private func makeFrame(topRight: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = topRight.x - middleLeft.x
		let height = (middleLeft.y - topRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (topRight.x - middleCenter.x).doubled
		let height = (middleCenter.y - topRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = topRight.x - bottomLeft.x
		let height = bottomLeft.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (topRight.x - bottomCenter.x).doubled
		let height = bottomCenter.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: CGPoint, size: CGSize) -> CGRect {
		
		let x = topRight.x - size.width
		let y = topRight.y
		let width = size.width
		let height = size.height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleLeft
extension DidStoreTopRightLayoutMaker: LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public typealias WillSetMiddleLeftMaker = LayoutEditor
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let topRight = self.topRight.evaluated(from: property)
		let middleLeft = middleLeft.evaluated(from: property)
		return self.makeFrame(topRight: topRight, middleLeft: middleLeft)
	}
	
}

// MARK: MiddleCenter
extension DidStoreTopRightLayoutMaker: LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public typealias WillSetMiddleCenterMaker = LayoutEditor
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let topRight = self.topRight.evaluated(from: property)
		let middleCenter = middleCenter.evaluated(from: property)
		return self.makeFrame(topRight: topRight, middleCenter: middleCenter)
	}
	
}

// MARK: BottomLeft
extension DidStoreTopRightLayoutMaker: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public typealias WillSetBottomLeftMaker = LayoutEditor
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let topRight = self.topRight.evaluated(from: property)
		let bottomLeft = bottomLeft.evaluated(from: property)
		return self.makeFrame(topRight: topRight, bottomLeft: bottomLeft)
	}
	
}

// MARK: BottomCenter
extension DidStoreTopRightLayoutMaker: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public typealias WillSetBottomCenterMaker = LayoutEditor
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let topRight = self.topRight.evaluated(from: property)
		let bottomCenter = bottomCenter.evaluated(from: property)
		return self.makeFrame(topRight: topRight, bottomCenter: bottomCenter)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreTopRightLayoutMaker: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreTopRightLayoutMaker: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftMaker = DidStoreTopRightLeftLayoutMaker
	
	public func storeLeft(_ left: LayoutElement.Line) -> DidStoreTopRightLeftLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: self.topRight,
					 left: left)
		
	}
	
}

// MARK: Center
extension DidStoreTopRightLayoutMaker: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterMaker = DidStoreTopRightCenterLayoutMaker
	
	public func storeCenter(_ center: LayoutElement.Line) -> DidStoreTopRightCenterLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: self.topRight,
					 center: center)
		
	}
	
}

// MARK: Middle
extension DidStoreTopRightLayoutMaker: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreTopRightMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreTopRightMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: self.topRight,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreTopRightLayoutMaker: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreTopRightBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreTopRightBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: self.topRight,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreTopRightLayoutMaker: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreTopRightWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreTopRightWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: self.topRight,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreTopRightLayoutMaker: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreTopRightHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreTopRightHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: self.topRight,
					 height: height)
		
	}
	
}
