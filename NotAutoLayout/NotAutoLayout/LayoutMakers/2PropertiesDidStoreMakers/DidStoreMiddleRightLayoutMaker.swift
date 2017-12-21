//
//  DidStoreMiddleRightLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleRightLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleRight: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreMiddleRightLayoutMaker {
	
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
extension DidStoreMiddleRightLayoutMaker: LayoutMakerCanStoreTopLeftToEvaluateFrameType {
	
	public typealias WillSetTopLeftMaker = LayoutEditor
	
	public func evaluateFrame(topLeft: LayoutElement.Point, parameter: ViewFrameProperty) -> CGRect {
		let middleRight = self.middleRight.evaluated(from: parameter)
		let topLeft = topLeft.evaluated(from: parameter)
		return self.makeFrame(middleRight: middleRight, topLeft: topLeft)
	}
	
}

// MARK: TopCenter
extension DidStoreMiddleRightLayoutMaker: LayoutMakerCanStoreTopCenterToEvaluateFrameType {
	
	public typealias WillSetTopCenterMaker = LayoutEditor
	
	public func evaluateFrame(topCenter: LayoutElement.Point, parameter: ViewFrameProperty) -> CGRect {
		let middleRight = self.middleRight.evaluated(from: parameter)
		let topCenter = topCenter.evaluated(from: parameter)
		return self.makeFrame(middleRight: middleRight, topCenter: topCenter)
	}
	
}

// MARK: BottomLeft
extension DidStoreMiddleRightLayoutMaker: LayoutMakerCanStoreBottomLeftToEvaluateFrameType {
	
	public typealias WillSetBottomLeftMaker = LayoutEditor
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameter: ViewFrameProperty) -> CGRect {
		let middleRight = self.middleRight.evaluated(from: parameter)
		let bottomLeft = bottomLeft.evaluated(from: parameter)
		return self.makeFrame(middleRight: middleRight, bottomLeft: bottomLeft)
	}
	
}

// MARK: BottomCenter
extension DidStoreMiddleRightLayoutMaker: LayoutMakerCanStoreBottomCenterToEvaluateFrameType {
	
	public typealias WillSetBottomCenterMaker = LayoutEditor
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, parameter: ViewFrameProperty) -> CGRect {
		let middleRight = self.middleRight.evaluated(from: parameter)
		let bottomCenter = bottomCenter.evaluated(from: parameter)
		return self.makeFrame(middleRight: middleRight, bottomCenter: bottomCenter)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreMiddleRightLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreMiddleRightLayoutMaker: LayoutMakerCanStoreLeftType {
	
	public typealias WillSetLeftMaker = DidStoreMiddleRightLeftLayoutMaker
	
	public func storeLeft(_ left: LayoutElement.Line) -> DidStoreMiddleRightLeftLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 left: left)
		
	}
	
}

// MARK: Center
extension DidStoreMiddleRightLayoutMaker: LayoutMakerCanStoreCenterType {
	
	public typealias WillSetCenterMaker = DidStoreMiddleRightCenterLayoutMaker
	
	public func storeCenter(_ center: LayoutElement.Line) -> DidStoreMiddleRightCenterLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 center: center)
		
	}
	
}

// MARK: Top
extension DidStoreMiddleRightLayoutMaker: LayoutMakerCanStoreTopType {
	
	public typealias WillSetTopMaker = DidStoreMiddleRightTopLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreMiddleRightTopLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 top: top)
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleRightLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreMiddleRightBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreMiddleRightBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleRightLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreMiddleRightWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreMiddleRightWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreMiddleRightLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreMiddleRightHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreMiddleRightHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 height: height)
		
	}
	
}
