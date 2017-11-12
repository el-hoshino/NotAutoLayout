//
//  TopRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopRightDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topRight: LayoutElement.Point
	
}

// MARK: - Make Frame
extension TopRightDidSetLayoutMaker {
	
	private func makeFrame(topRight: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = topRight.x - middleLeft.x
		let height = (middleLeft.y - topRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (topRight.x - middleCenter.x) * 2
		let height = (middleCenter.y - topRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = topRight.x - bottomLeft.x
		let height = bottomLeft.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (topRight.x - bottomCenter.x) * 2
		let height = bottomCenter.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
	private func makeFrame(topRight: CGPoint, size: CGSize) -> CGRect {
		
		let x = topRight.x - size.width
		let y = topRight.y
		let width = size.width
		let height = size.height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleLeft
extension TopRightDidSetLayoutMaker: LayoutMakerCanSetMiddleLeftToMakeLayoutEditorType {
	
	public typealias WillSetMiddleLeftMaker = LayoutEditor
	
	public func makeFrame(middleLeft: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topRight = self.topRight.evaluated(from: parameter)
		let middleLeft = middleLeft.evaluated(from: parameter)
		return self.makeFrame(topRight: topRight, middleLeft: middleLeft)
	}
	
}

// MARK: MiddleCenter
extension TopRightDidSetLayoutMaker: LayoutMakerCanSetMiddleCenterToMakeLayoutEditorType {
	
	public typealias WillSetMiddleCenterMaker = LayoutEditor
	
	public func makeFrame(middleCenter: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topRight = self.topRight.evaluated(from: parameter)
		let middleCenter = middleCenter.evaluated(from: parameter)
		return self.makeFrame(topRight: topRight, middleCenter: middleCenter)
	}
	
}

// MARK: BottomLeft
extension TopRightDidSetLayoutMaker: LayoutMakerCanSetBottomLeftToMakeLayoutEditorType {
	
	public typealias WillSetBottomLeftMaker = LayoutEditor
	
	public func makeFrame(bottomLeft: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topRight = self.topRight.evaluated(from: parameter)
		let bottomLeft = bottomLeft.evaluated(from: parameter)
		return self.makeFrame(topRight: topRight, bottomLeft: bottomLeft)
	}
	
}

// MARK: BottomCenter
extension TopRightDidSetLayoutMaker: LayoutMakerCanSetBottomCenterToMakeLayoutEditorType {
	
	public typealias WillSetBottomCenterMaker = LayoutEditor
	
	public func makeFrame(bottomCenter: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topRight = self.topRight.evaluated(from: parameter)
		let bottomCenter = bottomCenter.evaluated(from: parameter)
		return self.makeFrame(topRight: topRight, bottomCenter: bottomCenter)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension TopRightDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func makeFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(topRight: topRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension TopRightDidSetLayoutMaker: LayoutMakerCanSetLeftType {
	
	public typealias WillSetLeftMaker = TopRightLeftDidSetLayoutMaker
	
	public func setLeft(_ left: LayoutElement.Line) -> TopRightLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: self.topRight,
					 left: left)
		
	}
	
}

// MARK: Center
extension TopRightDidSetLayoutMaker: LayoutMakerCanSetCenterType {
	
	public typealias WillSetCenterMaker = TopRightCenterDidSetLayoutMaker
	
	public func setCenter(_ center: LayoutElement.Line) -> TopRightCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: self.topRight,
					 center: center)
		
	}
	
}

// MARK: Middle
extension TopRightDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = TopRightMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Line) -> TopRightMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: self.topRight,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension TopRightDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = TopRightBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Line) -> TopRightBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: self.topRight,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension TopRightDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = TopRightWidthDidSetLayoutMaker
	
	public func setWidth(_ width: LayoutElement.Length) -> TopRightWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: self.topRight,
					 width: width)
		
	}
	
}

// MARK: Height
extension TopRightDidSetLayoutMaker: LayoutMakerCanSetHeightType {
	
	public typealias WillSetHeightMaker = TopRightHeightDidSetLayoutMaker
	
	public func setHeight(_ height: LayoutElement.Length) -> TopRightHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: self.topRight,
					 height: height)
		
	}
	
}
