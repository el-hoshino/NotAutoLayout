//
//  DidStoreMiddleCenterLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleCenterLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreMiddleCenterLayoutMaker {
	
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
extension DidStoreMiddleCenterLayoutMaker: LayoutMakerCanStoreTopLeftToEvaluateFrameType {
	
	public typealias WillSetTopLeftMaker = LayoutEditor
	
	public func evaluateFrame(topLeft: LayoutElement.Point, parameter: ViewFrameProperty) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let topLeft = topLeft.evaluated(from: parameter)
		return self.makeFrame(middleCenter: middleCenter, topLeft: topLeft)
		
	}
	
}

// MARK: TopRight
extension DidStoreMiddleCenterLayoutMaker: LayoutMakerCanStoreTopRightToEvaluateFrameType {
	
	public typealias WillSetTopRightMaker = LayoutEditor
	
	public func evaluateFrame(topRight: LayoutElement.Point, parameter: ViewFrameProperty) -> CGRect {
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let topRight = topRight.evaluated(from: parameter)
		return self.makeFrame(middleCenter: middleCenter, topRight: topRight)
	}
	
}

// MARK: BottomLeft
extension DidStoreMiddleCenterLayoutMaker: LayoutMakerCanStoreBottomLeftToEvaluateFrameType {
	
	public typealias WillSetBottomLeftMaker = LayoutEditor
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameter: ViewFrameProperty) -> CGRect {
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let bottomLeft = bottomLeft.evaluated(from: parameter)
		return self.makeFrame(middleCenter: middleCenter, bottomLeft: bottomLeft)
	}
	
}

// MARK: BottomRight
extension DidStoreMiddleCenterLayoutMaker: LayoutMakerCanStoreBottomRightToEvaluateFrameType {
	
	public typealias WillSetBottomRightMaker = LayoutEditor
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, parameter: ViewFrameProperty) -> CGRect {
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let bottomRight = bottomRight.evaluated(from: parameter)
		return self.makeFrame(middleCenter: middleCenter, bottomRight: bottomRight)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreMiddleCenterLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreMiddleCenterLayoutMaker: LayoutMakerCanStoreLeftType {
	
	public typealias WillSetLeftMaker = DidStoreMiddleCenterLeftLayoutMaker
	
	public func storeLeft(_ left: LayoutElement.Line) -> DidStoreMiddleCenterLeftLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 left: left)
		
	}
	
}

// MARK: Right
extension DidStoreMiddleCenterLayoutMaker: LayoutMakerCanStoreRightType {
	
	public typealias WillSetRightMaker = DidStoreMiddleCenterRightLayoutMaker
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreMiddleCenterRightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 right: right)
		
	}
	
}

// MARK: Top
extension DidStoreMiddleCenterLayoutMaker: LayoutMakerCanStoreTopType {
	
	public typealias WillSetTopMaker = DidStoreMiddleCenterTopLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreMiddleCenterTopLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 top: top)
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleCenterLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreMiddleCenterBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreMiddleCenterBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleCenterLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreMiddleCenterWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreMiddleCenterWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreMiddleCenterLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreMiddleCenterHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreMiddleCenterHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 height: height)
		
	}
	
}
