//
//  DidStoreTopCenterLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopCenterLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension DidStoreTopCenterLayoutMaker {
	
	private func makeFrame(topCenter: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = (topCenter.x - middleLeft.x) * 2
		let height = (middleLeft.y - topCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = (middleRight.x - topCenter.x) * 2
		let height = (middleRight.y - topCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = (topCenter.x - bottomLeft.x) * 2
		let height = bottomLeft.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - topCenter.x) * 2
		let height = bottomRight.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = topCenter.x - size.width.half
		let y = topCenter.y
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleLeft
extension DidStoreTopCenterLayoutMaker: LayoutMakerCanStoreMiddleLeftToEvaluateFrameType {
	
	public typealias WillSetMiddleLeftMaker = LayoutEditor
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let topCenter = self.topCenter.evaluated(from: parameter)
		let middleLeft = middleLeft.evaluated(from: parameter)
		return self.makeFrame(topCenter: topCenter, middleLeft: middleLeft)
	}
	
}

// MARK: MiddleRight
extension DidStoreTopCenterLayoutMaker: LayoutMakerCanStoreMiddleRightToEvaluateFrameType {
	
	public typealias WillSetMiddleRightMaker = LayoutEditor
	
	public func evaluateFrame(middleRight: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let topCenter = self.topCenter.evaluated(from: parameter)
		let middleRight = middleRight.evaluated(from: parameter)
		return self.makeFrame(topCenter: topCenter, middleRight: middleRight)
	}
	
}

// MARK: BottomLeft
extension DidStoreTopCenterLayoutMaker: LayoutMakerCanStoreBottomLeftToEvaluateFrameType {
	
	public typealias WillSetBottomLeftMaker = LayoutEditor
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let topCenter = self.topCenter.evaluated(from: parameter)
		let bottomLeft = bottomLeft.evaluated(from: parameter)
		return self.makeFrame(topCenter: topCenter, bottomLeft: bottomLeft)
	}
	
}

// MARK: BottomRight
extension DidStoreTopCenterLayoutMaker: LayoutMakerCanStoreBottomRightToEvaluateFrameType {
	
	public typealias WillSetBottomRightMaker = LayoutEditor
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let topCenter = self.topCenter.evaluated(from: parameter)
		let bottomRight = bottomRight.evaluated(from: parameter)
		return self.makeFrame(topCenter: topCenter, bottomRight: bottomRight)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreTopCenterLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension DidStoreTopCenterLayoutMaker: LayoutMakerCanStoreLeftType {
	
	public typealias WillSetLeftMaker = DidStoreTopCenterLeftLayoutMaker
	
	public func storeLeft(_ left: LayoutElement.Line) -> DidStoreTopCenterLeftLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 left: left)
		
	}
	
}

// MARK: Right
extension DidStoreTopCenterLayoutMaker: LayoutMakerCanStoreRightType {
	
	public typealias WillSetRightMaker = DidStoreTopCenterRightLayoutMaker
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreTopCenterRightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 right: right)
		
	}
	
}

// MARK: Middle
extension DidStoreTopCenterLayoutMaker: LayoutMakerCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreTopCenterMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreTopCenterMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreTopCenterLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreTopCenterBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreTopCenterBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreTopCenterLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreTopCenterWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreTopCenterWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreTopCenterLayoutMaker: LayoutMakerCanStoreHeightType {

	public typealias WillSetHeightMaker = DidStoreTopCenterHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreTopCenterHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 height: height)
		
	}
	
}
