//
//  TopLeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopLeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topLeft: LayoutElement.Point
	
}

// MARK: - Make Frame
extension TopLeftDidSetLayoutMaker {
	
	private func makeFrame(topLeft: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - topLeft.x) * 2
		let height = (middleCenter.y - topLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = middleRight.x - topLeft.x
		let height = (middleRight.y - topLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - topLeft.x) * 2
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
extension TopLeftDidSetLayoutMaker: LayoutMakerCanStoreMiddleCenterToEvaluateFrameType {
	
	public typealias WillSetMiddleCenterMaker = LayoutEditor
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: parameter)
		let middleCenter = middleCenter.evaluated(from: parameter)
		return self.makeFrame(topLeft: topLeft, middleCenter: middleCenter)
	}
	
}

// MARK: MiddleRight
extension TopLeftDidSetLayoutMaker: LayoutMakerCanStoreMiddleRightToEvaluateFrameType {
	
	public typealias WillSetMiddleRightMaker = LayoutEditor
	
	public func evaluateFrame(middleRight: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: parameter)
		let middleRight = middleRight.evaluated(from: parameter)
		return self.makeFrame(topLeft: topLeft, middleRight: middleRight)
	}
	
}

// MARK: BottomCenter
extension TopLeftDidSetLayoutMaker: LayoutMakerCanStoreBottomCenterToEvaluateFrameType {
	
	public typealias WillSetBottomCenterMaker = LayoutEditor
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: parameter)
		let bottomCenter = bottomCenter.evaluated(from: parameter)
		return self.makeFrame(topLeft: topLeft, bottomCenter: bottomCenter)
	}
	
}

// MARK: BottomRight
extension TopLeftDidSetLayoutMaker: LayoutMakerCanStoreBottomRightToEvaluateFrameType {
	
	public typealias WillSetBottomRightMaker = LayoutEditor
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: parameter)
		let bottomRight = bottomRight.evaluated(from: parameter)
		return self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
	}
	
}
// MARK: - Set A Size -
// MARK: Size
extension TopLeftDidSetLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension TopLeftDidSetLayoutMaker: LayoutMakerCanStoreCenterType {
	
	public typealias WillSetCenterMaker = TopLeftCenterDidSetLayoutMaker
	
	public func storeCenter(_ center: LayoutElement.Line) -> TopLeftCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 center: center)
		
	}
	
}

// MARK: Right
extension TopLeftDidSetLayoutMaker: LayoutMakerCanStoreRightType {
	
	public typealias WillSetRightMaker = TopLeftRightDidSetLayoutMaker
	
	public func storeRight(_ right: LayoutElement.Line) -> TopLeftRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 right: right)
		
	}
	
}

// MARK: Middle
extension TopLeftDidSetLayoutMaker: LayoutMakerCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = TopLeftMiddleDidSetLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> TopLeftMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension TopLeftDidSetLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = TopLeftBottomDidSetLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> TopLeftBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension TopLeftDidSetLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = TopLeftWidthDidSetLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> TopLeftWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 width: width)
		
	}
	
}

// MARK: Height
extension TopLeftDidSetLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = TopLeftHeightDidSetLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> TopLeftHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 height: height)
		
	}
	
}
