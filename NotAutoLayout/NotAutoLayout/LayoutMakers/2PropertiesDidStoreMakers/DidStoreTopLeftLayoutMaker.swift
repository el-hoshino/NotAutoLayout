//
//  DidStoreTopLeftLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopLeftLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topLeft: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreTopLeftLayoutMaker {
	
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
extension DidStoreTopLeftLayoutMaker: LayoutMakerCanStoreMiddleCenterToEvaluateFrameType {
	
	public typealias WillSetMiddleCenterMaker = LayoutEditor
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: property)
		let middleCenter = middleCenter.evaluated(from: property)
		return self.makeFrame(topLeft: topLeft, middleCenter: middleCenter)
	}
	
}

// MARK: MiddleRight
extension DidStoreTopLeftLayoutMaker: LayoutMakerCanStoreMiddleRightToEvaluateFrameType {
	
	public typealias WillSetMiddleRightMaker = LayoutEditor
	
	public func evaluateFrame(middleRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: property)
		let middleRight = middleRight.evaluated(from: property)
		return self.makeFrame(topLeft: topLeft, middleRight: middleRight)
	}
	
}

// MARK: BottomCenter
extension DidStoreTopLeftLayoutMaker: LayoutMakerCanStoreBottomCenterToEvaluateFrameType {
	
	public typealias WillSetBottomCenterMaker = LayoutEditor
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: property)
		let bottomCenter = bottomCenter.evaluated(from: property)
		return self.makeFrame(topLeft: topLeft, bottomCenter: bottomCenter)
	}
	
}

// MARK: BottomRight
extension DidStoreTopLeftLayoutMaker: LayoutMakerCanStoreBottomRightToEvaluateFrameType {
	
	public typealias WillSetBottomRightMaker = LayoutEditor
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: property)
		let bottomRight = bottomRight.evaluated(from: property)
		return self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
	}
	
}
// MARK: - Set A Size -
// MARK: Size
extension DidStoreTopLeftLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension DidStoreTopLeftLayoutMaker: LayoutMakerCanStoreCenterType {
	
	public typealias WillSetCenterMaker = DidStoreTopLeftCenterLayoutMaker
	
	public func storeCenter(_ center: LayoutElement.Line) -> DidStoreTopLeftCenterLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 center: center)
		
	}
	
}

// MARK: Right
extension DidStoreTopLeftLayoutMaker: LayoutMakerCanStoreRightType {
	
	public typealias WillSetRightMaker = DidStoreTopLeftRightLayoutMaker
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreTopLeftRightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 right: right)
		
	}
	
}

// MARK: Middle
extension DidStoreTopLeftLayoutMaker: LayoutMakerCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreTopLeftMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreTopLeftMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreTopLeftLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreTopLeftBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreTopLeftBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreTopLeftLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreTopLeftWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreTopLeftWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreTopLeftLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreTopLeftHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreTopLeftHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 height: height)
		
	}
	
}
