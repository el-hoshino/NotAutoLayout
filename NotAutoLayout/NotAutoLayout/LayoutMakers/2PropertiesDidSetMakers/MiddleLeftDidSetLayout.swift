//
//  MiddleLeftDidSetLayout.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleLeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleLeft: LayoutElement.Point
	
}

// MARK: - Make Frame
extension MiddleLeftDidSetLayoutMaker {
	
	private func makeFrame(middleLeft: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (topCenter.x - middleLeft.x) * 2
		let height = topCenter.y - middleLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = topRight.x - middleLeft.x
		let height = (middleLeft.y - topRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - middleLeft.x) * 2
		let height = (bottomCenter.y - middleLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = bottomRight.x - middleLeft.x
		let height = (bottomRight.y - middleLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleLeft.x
		let y = middleLeft.y - size.height.half
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopCenter
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetTopCenterToMakeLayoutEditorType {
	
	public typealias WillSetTopCenterMaker = LayoutEditor
	
	public func evaluateFrame(topCenter: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let middleLeft = self.middleLeft.evaluated(from: parameter)
		let topCenter = topCenter.evaluated(from: parameter)
		return self.makeFrame(middleLeft: middleLeft, topCenter: topCenter)
	}
	
}

// MARK: TopRight
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetTopRightToMakeLayoutEditorType {
	
	public typealias WillSetTopRightMaker = LayoutEditor
	
	public func evaluateFrame(topRight: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let middleLeft = self.middleLeft.evaluated(from: parameter)
		let topRight = topRight.evaluated(from: parameter)
		return self.makeFrame(middleLeft: middleLeft, topRight: topRight)
	}
	
}

// MARK: BottomCenter
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetBottomCenterToMakeLayoutEditorType {
	
	public typealias WillSetBottomCenterMaker = LayoutEditor
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let middleLeft = self.middleLeft.evaluated(from: parameter)
		let bottomCenter = bottomCenter.evaluated(from: parameter)
		return self.makeFrame(middleLeft: middleLeft, bottomCenter: bottomCenter)
	}
	
}

// MARK: BottomRight
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetBottomRightToMakeLayoutEditorType {
	
	public typealias WillSetBottomRightMaker = LayoutEditor
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let middleLeft = self.middleLeft.evaluated(from: parameter)
		let bottomRight = bottomRight.evaluated(from: parameter)
		return self.makeFrame(middleLeft: middleLeft, bottomRight: bottomRight)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetCenterType {
	
	public typealias WillSetCenterMaker = MiddleLeftCenterDidSetLayoutMaker
	
	public func storeCenter(_ center: LayoutElement.Line) -> MiddleLeftCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 center: center)
		
	}
	
}

// MARK: Right
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetRightType {
	
	public typealias WillSetRightMaker = MiddleLeftRightDidSetLayoutMaker
	
	public func storeRight(_ right: LayoutElement.Line) -> MiddleLeftRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 right: right)
		
	}
	
}

// MARK: Top
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetTopType {
	
	public typealias WillSetTopMaker = MiddleLeftTopDidSetLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> MiddleLeftTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 top: top)
		
	}
	
}

// MARK: Bottom
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = MiddleLeftBottomDidSetLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> MiddleLeftBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = MiddleLeftWidthDidSetLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> MiddleLeftWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 width: width)
		
	}
	
}

// MARK: Height
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetHeightType {
	
	public typealias WillSetHeightMaker = MiddleLeftHeightDidSetLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> MiddleLeftHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 height: height)
		
	}
	
}
