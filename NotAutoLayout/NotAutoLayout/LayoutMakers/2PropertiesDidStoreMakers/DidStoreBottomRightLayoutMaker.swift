//
//  DidStoreBottomRightLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomRightLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomRight: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreBottomRightLayoutMaker {
	
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
extension DidStoreBottomRightLayoutMaker: LayoutMakerCanStoreTopLeftToEvaluateFrameType {
	
	public typealias WillSetTopLeftMaker = LayoutEditor
	
	public func evaluateFrame(topLeft: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let topLeft = topLeft.evaluated(from: parameter)
		return self.makeFrame(bottomRight: bottomRight, topLeft: topLeft)
	}
	
}

// MARK: TopCenter
extension DidStoreBottomRightLayoutMaker: LayoutMakerCanStoreTopCenterToEvaluateFrameType {
	
	public typealias WillSetTopCenterMaker = LayoutEditor
	
	public func evaluateFrame(topCenter: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let topCenter = topCenter.evaluated(from: parameter)
		return self.makeFrame(bottomRight: bottomRight, topCenter: topCenter)
	}
	
}

// MARK: MiddleLeft
extension DidStoreBottomRightLayoutMaker: LayoutMakerCanStoreMiddleLeftToEvaluateFrameType {
	
	public typealias WillSetMiddleLeftMaker = LayoutEditor
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let middleLeft = middleLeft.evaluated(from: parameter)
		return self.makeFrame(bottomRight: bottomRight, middleLeft: middleLeft)
	}
	
}

// MARK: MiddleCenter
extension DidStoreBottomRightLayoutMaker: LayoutMakerCanStoreMiddleCenterToEvaluateFrameType {
	
	public typealias WillSetMiddleCenterMaker = LayoutEditor
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let middleCenter = middleCenter.evaluated(from: parameter)
		return self.makeFrame(bottomRight: bottomRight, middleCenter: middleCenter)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreBottomRightLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreBottomRightLayoutMaker: LayoutMakerCanStoreLeftType {
	
	public typealias WillSetLeftMaker = DidStoreBottomRightLeftLayoutMaker
	
	public func storeLeft(_ left: LayoutElement.Line) -> DidStoreBottomRightLeftLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 left: left)
		
	}
	
}

// MARK: Center
extension DidStoreBottomRightLayoutMaker: LayoutMakerCanStoreCenterType {
	
	public typealias WillSetCenterMaker = DidStoreBottomRightCenterLayoutMaker
	
	public func storeCenter(_ center: LayoutElement.Line) -> DidStoreBottomRightCenterLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 center: center)
		
	}
	
}

// MARK: Top
extension DidStoreBottomRightLayoutMaker: LayoutMakerCanStoreTopType {
	
	public typealias WillSetTopMaker = DidStoreBottomRightTopLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreBottomRightTopLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreBottomRightLayoutMaker: LayoutMakerCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreBottomRightMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreBottomRightMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomRightLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreBottomRightWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreBottomRightWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreBottomRightLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreBottomRightHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreBottomRightHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 height: height)
		
	}
	
}
