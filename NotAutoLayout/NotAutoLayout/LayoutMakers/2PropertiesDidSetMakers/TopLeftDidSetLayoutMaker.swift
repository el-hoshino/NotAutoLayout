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
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetMiddleCenterToMakeLayoutEditorType {
	
	public typealias WillSetMiddleCenterMaker = LayoutEditor
	
	public func makeFrame(middleCenter: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: parameter)
		let middleCenter = middleCenter.evaluated(from: parameter)
		return self.makeFrame(topLeft: topLeft, middleCenter: middleCenter)
	}
	
}

// MARK: MiddleRight
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetMiddleRightToMakeLayoutEditorType {
	
	public typealias WillSetMiddleRightMaker = LayoutEditor
	
	public func makeFrame(middleRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: parameter)
		let middleRight = middleRight.evaluated(from: parameter)
		return self.makeFrame(topLeft: topLeft, middleRight: middleRight)
	}
	
}

// MARK: BottomCenter
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetBottomCenterToMakeLayoutEditorType {
	
	public typealias WillSetBottomCenterMaker = LayoutEditor
	
	public func makeFrame(bottomCenter: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: parameter)
		let bottomCenter = bottomCenter.evaluated(from: parameter)
		return self.makeFrame(topLeft: topLeft, bottomCenter: bottomCenter)
	}
	
}

// MARK: BottomRight
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetBottomRightToMakeLayoutEditorType {
	
	public typealias WillSetBottomRightMaker = LayoutEditor
	
	public func makeFrame(bottomRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: parameter)
		let bottomRight = bottomRight.evaluated(from: parameter)
		return self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
	}
	
}
// MARK: - Set A Size -
// MARK: Size
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func makeFrame(size: LayoutElement.Size, parameter: LayoutControlParameter) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameter)
		let size = size.evaluated(from: parameter)
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetCenterType {
	
	public typealias WillSetCenterMaker = TopLeftCenterDidSetLayoutMaker
	
	public func setCenter(_ center: LayoutElement.Line) -> TopLeftCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 center: center)
		
	}
	
}

// MARK: Right
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetRightType {
	
	public typealias WillSetRightMaker = TopLeftRightDidSetLayoutMaker
	
	public func setRight(_ right: LayoutElement.Line) -> TopLeftRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 right: right)
		
	}
	
}

// MARK: Middle
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = TopLeftMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Line) -> TopLeftMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = TopLeftBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Line) -> TopLeftBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = TopLeftWidthDidSetLayoutMaker
	
	public func setWidth(_ width: LayoutElement.Length) -> TopLeftWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 width: width)
		
	}
	
}

// MARK: Height
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetHeightType {
	
	public typealias WillSetHeightMaker = TopLeftHeightDidSetLayoutMaker
	
	public func setHeight(_ height: LayoutElement.Length) -> TopLeftHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 height: height)
		
	}
	
}
