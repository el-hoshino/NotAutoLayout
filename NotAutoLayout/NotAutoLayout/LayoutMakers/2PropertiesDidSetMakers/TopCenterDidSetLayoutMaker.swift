//
//  TopCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopCenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension TopCenterDidSetLayoutMaker {
	
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
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetMiddleLeftToMakeLayoutEditorType {
	
	public typealias WillSetMiddleLeftMaker = LayoutEditor
	
	public func makeFrame(middleLeft: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topCenter = self.topCenter.evaluated(from: parameter)
		let middleLeft = middleLeft.evaluated(from: parameter)
		return self.makeFrame(topCenter: topCenter, middleLeft: middleLeft)
	}
	
}

// MARK: MiddleRight
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetMiddleRightToMakeLayoutEditorType {
	
	public typealias WillSetMiddleRightMaker = LayoutEditor
	
	public func makeFrame(middleRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topCenter = self.topCenter.evaluated(from: parameter)
		let middleRight = middleRight.evaluated(from: parameter)
		return self.makeFrame(topCenter: topCenter, middleRight: middleRight)
	}
	
}

// MARK: BottomLeft
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetBottomLeftToMakeLayoutEditorType {
	
	public typealias WillSetBottomLeftMaker = LayoutEditor
	
	public func makeFrame(bottomLeft: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topCenter = self.topCenter.evaluated(from: parameter)
		let bottomLeft = bottomLeft.evaluated(from: parameter)
		return self.makeFrame(topCenter: topCenter, bottomLeft: bottomLeft)
	}
	
}

// MARK: BottomRight
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetBottomRightToMakeLayoutEditorType {
	
	public typealias WillSetBottomRightMaker = LayoutEditor
	
	public func makeFrame(bottomRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topCenter = self.topCenter.evaluated(from: parameter)
		let bottomRight = bottomRight.evaluated(from: parameter)
		return self.makeFrame(topCenter: topCenter, bottomRight: bottomRight)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func makeFrame(size: LayoutElement.Size, parameter: LayoutControlParameter) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameter)
		let size = size.evaluated(from: parameter)
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetLeftType {
	
	public typealias WillSetLeftMaker = TopCenterLeftDidSetLayoutMaker
	
	public func setLeft(_ left: LayoutElement.Line) -> TopCenterLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 left: left)
		
	}
	
}

// MARK: Right
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetRightType {
	
	public typealias WillSetRightMaker = TopCenterRightDidSetLayoutMaker
	
	public func setRight(_ right: LayoutElement.Line) -> TopCenterRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 right: right)
		
	}
	
}

// MARK: Middle
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = TopCenterMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Line) -> TopCenterMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = TopCenterBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Line) -> TopCenterBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = TopCenterWidthDidSetLayoutMaker
	
	public func setWidth(_ width: LayoutElement.Length) -> TopCenterWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 width: width)
		
	}
	
}

// MARK: Height
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetHeightType {

	public typealias WillSetHeightMaker = TopCenterHeightDidSetLayoutMaker
	
	public func setHeight(_ height: LayoutElement.Length) -> TopCenterHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 height: height)
		
	}
	
}
