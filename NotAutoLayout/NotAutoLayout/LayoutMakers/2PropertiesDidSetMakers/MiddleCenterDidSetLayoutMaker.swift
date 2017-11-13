//
//  MiddleCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleCenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension MiddleCenterDidSetLayoutMaker {
	
	private func makeFrame(middleCenter: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - topLeft.x) * 2
		let height = (middleCenter.y - topLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = (topRight.x - middleCenter.x) * 2
		let height = (middleCenter.y - topRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - bottomLeft.x) * 2
		let height = (bottomLeft.y - middleCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - middleCenter.x) * 2
		let height = (bottomRight.y - middleCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleCenter.x - size.width.half
		let y = middleCenter.y - size.height.half
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanStoreTopLeftToEvaluateFrameType {
	
	public typealias WillSetTopLeftMaker = LayoutEditor
	
	public func evaluateFrame(topLeft: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let topLeft = topLeft.evaluated(from: parameter)
		return self.makeFrame(middleCenter: middleCenter, topLeft: topLeft)
		
	}
	
}

// MARK: TopRight
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanStoreTopRightToEvaluateFrameType {
	
	public typealias WillSetTopRightMaker = LayoutEditor
	
	public func evaluateFrame(topRight: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let topRight = topRight.evaluated(from: parameter)
		return self.makeFrame(middleCenter: middleCenter, topRight: topRight)
	}
	
}

// MARK: BottomLeft
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanStoreBottomLeftToEvaluateFrameType {
	
	public typealias WillSetBottomLeftMaker = LayoutEditor
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let bottomLeft = bottomLeft.evaluated(from: parameter)
		return self.makeFrame(middleCenter: middleCenter, bottomLeft: bottomLeft)
	}
	
}

// MARK: BottomRight
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanStoreBottomRightToEvaluateFrameType {
	
	public typealias WillSetBottomRightMaker = LayoutEditor
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let bottomRight = bottomRight.evaluated(from: parameter)
		return self.makeFrame(middleCenter: middleCenter, bottomRight: bottomRight)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanStoreLeftType {
	
	public typealias WillSetLeftMaker = MiddleCenterLeftDidSetLayoutMaker
	
	public func storeLeft(_ left: LayoutElement.Line) -> MiddleCenterLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 left: left)
		
	}
	
}

// MARK: Right
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanStoreRightType {
	
	public typealias WillSetRightMaker = MiddleCenterRightDidSetLayoutMaker
	
	public func storeRight(_ right: LayoutElement.Line) -> MiddleCenterRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 right: right)
		
	}
	
}

// MARK: Top
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanStoreTopType {
	
	public typealias WillSetTopMaker = MiddleCenterTopDidSetLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> MiddleCenterTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 top: top)
		
	}
	
}

// MARK: Bottom
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = MiddleCenterBottomDidSetLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> MiddleCenterBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = MiddleCenterWidthDidSetLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> MiddleCenterWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 width: width)
		
	}
	
}

// MARK: Height
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = MiddleCenterHeightDidSetLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> MiddleCenterHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 height: height)
		
	}
	
}
