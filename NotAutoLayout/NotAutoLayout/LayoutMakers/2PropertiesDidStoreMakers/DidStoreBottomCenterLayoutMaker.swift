//
//  DidStoreBottomCenterLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomCenterLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreBottomCenterLayoutMaker {
	
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
extension DidStoreBottomCenterLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreBottomCenterLayoutMaker: LayoutMakerCanStoreLeftType {
	
	public typealias WillSetLeftMaker = DidStoreBottomCenterLeftLayoutMaker
	
	public func storeLeft(_ left: LayoutElement.Line) -> DidStoreBottomCenterLeftLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 left: left)
		
	}
	
}

// MARK: Right
extension DidStoreBottomCenterLayoutMaker: LayoutMakerCanStoreRightType {
	
	public typealias WillSetRightMaker = DidStoreBottomCenterRightLayoutMaker
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreBottomCenterRightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 right: right)
		
	}
	
}

// MARK: Top
extension DidStoreBottomCenterLayoutMaker: LayoutMakerCanStoreTopType {
	
	public typealias WillSetTopMaker = DidStoreBottomCenterTopLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreBottomCenterTopLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreBottomCenterLayoutMaker: LayoutMakerCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreBottomCenterMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreBottomCenterMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreBottomCenterLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreBottomCenterWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreBottomCenterWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreBottomCenterLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreBottomCenterHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreBottomCenterHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 height: height)
		
	}
	
}
