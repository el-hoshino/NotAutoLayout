//
//  MiddleLeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleLeftLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleLeft: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreMiddleLeftLayoutMaker {
	
	private func makeFrame(middleLeft: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (topCenter.x - middleLeft.x).doubled
		let height = topCenter.y - middleLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = topRight.x - middleLeft.x
		let height = (middleLeft.y - topRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - middleLeft.x).doubled
		let height = (bottomCenter.y - middleLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = bottomRight.x - middleLeft.x
		let height = (bottomRight.y - middleLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleLeft.x
		let y = middleLeft.y - size.height.halved
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopCenter
extension DidStoreMiddleLeftLayoutMaker: LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public typealias WillSetTopCenterMaker = LayoutEditor
	
	public func evaluateFrame(topCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let middleLeft = self.middleLeft.evaluated(from: property)
		let topCenter = topCenter.evaluated(from: property)
		return self.makeFrame(middleLeft: middleLeft, topCenter: topCenter)
	}
	
}

// MARK: TopRight
extension DidStoreMiddleLeftLayoutMaker: LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public typealias WillSetTopRightMaker = LayoutEditor
	
	public func evaluateFrame(topRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let middleLeft = self.middleLeft.evaluated(from: property)
		let topRight = topRight.evaluated(from: property)
		return self.makeFrame(middleLeft: middleLeft, topRight: topRight)
	}
	
}

// MARK: BottomCenter
extension DidStoreMiddleLeftLayoutMaker: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public typealias WillSetBottomCenterMaker = LayoutEditor
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let middleLeft = self.middleLeft.evaluated(from: property)
		let bottomCenter = bottomCenter.evaluated(from: property)
		return self.makeFrame(middleLeft: middleLeft, bottomCenter: bottomCenter)
	}
	
}

// MARK: BottomRight
extension DidStoreMiddleLeftLayoutMaker: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public typealias WillSetBottomRightMaker = LayoutEditor
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, property: ViewFrameProperty) -> CGRect {
		let middleLeft = self.middleLeft.evaluated(from: property)
		let bottomRight = bottomRight.evaluated(from: property)
		return self.makeFrame(middleLeft: middleLeft, bottomRight: bottomRight)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreMiddleLeftLayoutMaker: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension DidStoreMiddleLeftLayoutMaker: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterMaker = DidStoreMiddleLeftCenterLayoutMaker
	
	public func storeCenter(_ center: LayoutElement.Line) -> DidStoreMiddleLeftCenterLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 center: center)
		
	}
	
}

// MARK: Right
extension DidStoreMiddleLeftLayoutMaker: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightMaker = DidStoreMiddleLeftRightLayoutMaker
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreMiddleLeftRightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 right: right)
		
	}
	
}

// MARK: Top
extension DidStoreMiddleLeftLayoutMaker: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopMaker = DidStoreMiddleLeftTopLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreMiddleLeftTopLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 top: top)
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleLeftLayoutMaker: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreMiddleLeftBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreMiddleLeftBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleLeftLayoutMaker: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreMiddleLeftWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreMiddleLeftWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreMiddleLeftLayoutMaker: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreMiddleLeftHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreMiddleLeftHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 height: height)
		
	}
	
}
