//
//  BottomLeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct BottomLeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomLeft: LayoutElement.Point
	
}

// MARK: - Make Frame
extension BottomLeftDidSetLayoutMaker {
	
	private func makeFrame(bottomLeft: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (topCenter.x - bottomLeft.x) * 2
		let height = bottomLeft.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = topRight.x - bottomLeft.x
		let height = bottomLeft.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - bottomLeft.x) * 2
		let height = (bottomLeft.y - middleCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = middleRight.x - bottomLeft.x
		let height = (bottomLeft.y - middleRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, size: CGSize) -> CGRect {
		
		let x = bottomLeft.x
		let y = bottomLeft.y - size.height
		let width = size.width
		let height = size.height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopCenter
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetTopCenterToMakeLayoutEditorType {
	
	public typealias WillSetTopCenterMaker = LayoutEditor
	
	public func evaluateFrame(topCenter: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: parameter)
		let topCenter = topCenter.evaluated(from: parameter)
		return self.makeFrame(bottomLeft: bottomLeft, topCenter: topCenter)
	}
	
}

// MARK: TopRight
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetTopRightToMakeLayoutEditorType {
	
	public typealias WillSetTopRightMaker = LayoutEditor
	
	public func evaluateFrame(topRight: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: parameter)
		let topRight = topRight.evaluated(from: parameter)
		return self.makeFrame(bottomLeft: bottomLeft, topRight: topRight)
	}
	
}

// MARK: MiddleCenter
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetMiddleCenterToMakeLayoutEditorType {
	
	public typealias WillSetMiddleCenterMaker = LayoutEditor
	
	public func evaluateFrame(middleCenter: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: parameter)
		let middleCenter = middleCenter.evaluated(from: parameter)
		return self.makeFrame(bottomLeft: bottomLeft, middleCenter: middleCenter)
	}
	
}

// MARK: MiddleRight
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetMiddleRightToMakeLayoutEditorType {
	
	public typealias WillSetMiddleRightMaker = LayoutEditor
	
	public func evaluateFrame(middleRight: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: parameter)
		let middleRight = middleRight.evaluated(from: parameter)
		return self.makeFrame(bottomLeft: bottomLeft, middleRight: middleRight)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetCenterType {
	
	public typealias WillSetCenterMaker = BottomLeftCenterDidSetLayoutMaker
	
	public func storeCenter(_ center: LayoutElement.Line) -> BottomLeftCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 center: center)
		
	}
	
}

// MARK: Right
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetRightType {
	
	public typealias WillSetRightMaker = BottomLeftRightDidSetLayoutMaker
	
	public func storeRight(_ right: LayoutElement.Line) -> BottomLeftRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 right: right)
		
	}
	
}

// MARK: Top
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetTopType {
	
	public typealias WillSetTopMaker = BottomLeftTopDidSetLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> BottomLeftTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 top: top)
		
	}
	
}

// MARK: Middle
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = BottomLeftMiddleDidSetLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> BottomLeftMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = BottomLeftWidthDidSetLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> BottomLeftWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 width: width)
		
	}
	
}

// MARK: Height
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetHeightType {
	
	public typealias WillSetHeightMaker = BottomLeftHeightDidSetLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> BottomLeftHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 height: height)
		
	}
	
}
