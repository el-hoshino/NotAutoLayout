//
//  BottomRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct BottomRightDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomRight: LayoutElement.Point
	
}

// MARK: - Make Frame
extension BottomRightDidSetLayoutMaker {
	
	private func makeFrame(bottomRight: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = bottomRight.x - topLeft.x
		let height = bottomRight.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - topCenter.x) * 2
		let height = bottomRight.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = bottomRight.x - middleLeft.x
		let height = (bottomRight.y - middleLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
	private func makeFrame(bottomRight: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - middleCenter.x) * 2
		let height = (bottomRight.y - middleCenter.y) * 2
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
extension BottomRightDidSetLayoutMaker: LayoutMakerCanSetTopLeftToMakeLayoutEditorType {
	
	public typealias WillSetTopLeftMaker = LayoutEditor
	
	public func makeFrame(topLeft: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let topLeft = topLeft.evaluated(from: parameter)
		return self.makeFrame(bottomRight: bottomRight, topLeft: topLeft)
	}
	
}

// MARK: TopCenter
extension BottomRightDidSetLayoutMaker: LayoutMakerCanSetTopCenterToMakeLayoutEditorType {
	
	public typealias WillSetTopCenterMaker = LayoutEditor
	
	public func makeFrame(topCenter: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let topCenter = topCenter.evaluated(from: parameter)
		return self.makeFrame(bottomRight: bottomRight, topCenter: topCenter)
	}
	
}

// MARK: MiddleLeft
extension BottomRightDidSetLayoutMaker: LayoutMakerCanSetMiddleLeftToMakeLayoutEditorType {
	
	public typealias WillSetMiddleLeftMaker = LayoutEditor
	
	public func makeFrame(middleLeft: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let middleLeft = middleLeft.evaluated(from: parameter)
		return self.makeFrame(bottomRight: bottomRight, middleLeft: middleLeft)
	}
	
}

// MARK: MiddleCenter
extension BottomRightDidSetLayoutMaker: LayoutMakerCanSetMiddleCenterToMakeLayoutEditorType {
	
	public typealias WillSetMiddleCenterMaker = LayoutEditor
	
	public func makeFrame(middleCenter: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let middleCenter = middleCenter.evaluated(from: parameter)
		return self.makeFrame(bottomRight: bottomRight, middleCenter: middleCenter)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension BottomRightDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func makeFrame(size: LayoutElement.Size, parameter: LayoutControlParameter) -> CGRect {
		
		let bottomRight = self.bottomRight.evaluated(from: parameter)
		let size = size.evaluated(from: parameter)
		return self.makeFrame(bottomRight: bottomRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension BottomRightDidSetLayoutMaker: LayoutMakerCanSetLeftType {
	
	public typealias WillSetLeftMaker = BottomRightLeftDidSetLayoutMaker
	
	public func setLeft(_ left: LayoutElement.Line) -> BottomRightLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 left: left)
		
	}
	
}

// MARK: Center
extension BottomRightDidSetLayoutMaker: LayoutMakerCanSetCenterType {
	
	public typealias WillSetCenterMaker = BottomRightCenterDidSetLayoutMaker
	
	public func setCenter(_ center: LayoutElement.Line) -> BottomRightCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 center: center)
		
	}
	
}

// MARK: Top
extension BottomRightDidSetLayoutMaker: LayoutMakerCanSetTopType {
	
	public typealias WillSetTopMaker = BottomRightTopDidSetLayoutMaker
	
	public func setTop(_ top: LayoutElement.Line) -> BottomRightTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 top: top)
		
	}
	
}

// MARK: Middle
extension BottomRightDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = BottomRightMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Line) -> BottomRightMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension BottomRightDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = BottomRightWidthDidSetLayoutMaker
	
	public func setWidth(_ width: LayoutElement.Length) -> BottomRightWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 width: width)
		
	}
	
}

// MARK: Height
extension BottomRightDidSetLayoutMaker: LayoutMakerCanSetHeightType {
	
	public typealias WillSetHeightMaker = BottomRightHeightDidSetLayoutMaker
	
	public func setHeight(_ height: LayoutElement.Length) -> BottomRightHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: self.bottomRight,
					 height: height)
		
	}
	
}
