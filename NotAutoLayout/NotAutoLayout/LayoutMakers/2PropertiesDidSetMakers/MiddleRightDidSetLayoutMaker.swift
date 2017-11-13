//
//  MiddleRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleRightDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleRight: LayoutElement.Point
	
}

// MARK: - Make Frame
extension MiddleRightDidSetLayoutMaker {
	
	private func makeFrame(middleRight: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = middleRight.x - topLeft.x
		let height = (middleRight.y - topLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (middleRight.x - topCenter.x) * 2
		let height = (middleRight.y - topCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = middleRight.x - bottomLeft.x
		let height = (bottomLeft.y - middleRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (middleRight.x - bottomCenter.x) * 2
		let height = (bottomCenter.y - middleRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleRight.x - size.width
		let y = middleRight.y - size.height.half
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetTopLeftToMakeLayoutEditorType {
	
	public typealias WillSetTopLeftMaker = LayoutEditor
	
	public func evaluateFrame(topLeft: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let middleRight = self.middleRight.evaluated(from: parameter)
		let topLeft = topLeft.evaluated(from: parameter)
		return self.makeFrame(middleRight: middleRight, topLeft: topLeft)
	}
	
}

// MARK: TopCenter
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetTopCenterToMakeLayoutEditorType {
	
	public typealias WillSetTopCenterMaker = LayoutEditor
	
	public func evaluateFrame(topCenter: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let middleRight = self.middleRight.evaluated(from: parameter)
		let topCenter = topCenter.evaluated(from: parameter)
		return self.makeFrame(middleRight: middleRight, topCenter: topCenter)
	}
	
}

// MARK: BottomLeft
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetBottomLeftToMakeLayoutEditorType {
	
	public typealias WillSetBottomLeftMaker = LayoutEditor
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let middleRight = self.middleRight.evaluated(from: parameter)
		let bottomLeft = bottomLeft.evaluated(from: parameter)
		return self.makeFrame(middleRight: middleRight, bottomLeft: bottomLeft)
	}
	
}

// MARK: BottomCenter
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetBottomCenterToMakeLayoutEditorType {
	
	public typealias WillSetBottomCenterMaker = LayoutEditor
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect {
		let middleRight = self.middleRight.evaluated(from: parameter)
		let bottomCenter = bottomCenter.evaluated(from: parameter)
		return self.makeFrame(middleRight: middleRight, bottomCenter: bottomCenter)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetLeftType {
	
	public typealias WillSetLeftMaker = MiddleRightLeftDidSetLayoutMaker
	
	public func storeLeft(_ left: LayoutElement.Line) -> MiddleRightLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 left: left)
		
	}
	
}

// MARK: Center
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetCenterType {
	
	public typealias WillSetCenterMaker = MiddleRightCenterDidSetLayoutMaker
	
	public func storeCenter(_ center: LayoutElement.Line) -> MiddleRightCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 center: center)
		
	}
	
}

// MARK: Top
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetTopType {
	
	public typealias WillSetTopMaker = MiddleRightTopDidSetLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> MiddleRightTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 top: top)
		
	}
	
}

// MARK: Bottom
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = MiddleRightBottomDidSetLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> MiddleRightBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = MiddleRightWidthDidSetLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> MiddleRightWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 width: width)
		
	}
	
}

// MARK: Height
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetHeightType {
	
	public typealias WillSetHeightMaker = MiddleRightHeightDidSetLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> MiddleRightHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 height: height)
		
	}
	
}
