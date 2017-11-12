//
//  BottomCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct BottomCenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension BottomCenterDidSetLayoutMaker {
	
	private func makeFrame(bottomCenter: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - topLeft.x) * 2
		let height = bottomCenter.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = (topRight.x - bottomCenter.x) * 2
		let height = bottomCenter.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - middleLeft.x) * 2
		let height = (bottomCenter.y - middleLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = (middleRight.x - bottomCenter.x) * 2
		let height = (bottomCenter.y - middleRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = bottomCenter.x - size.width.half
		let y = bottomCenter.y - size.height
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft

// MARK: TopRight

// MARK: MiddleLeft

// MARK: MiddleRight

// MARK: - Set A Size -
// MARK: Size
extension BottomCenterDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func makeFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension BottomCenterDidSetLayoutMaker: LayoutMakerCanSetLeftType {
	
	public typealias WillSetLeftMaker = BottomCenterLeftDidSetLayoutMaker
	
	public func setLeft(_ left: LayoutElement.Line) -> BottomCenterLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 left: left)
		
	}
	
}

// MARK: Right
extension BottomCenterDidSetLayoutMaker: LayoutMakerCanSetRightType {
	
	public typealias WillSetRightMaker = BottomCenterRightDidSetLayoutMaker
	
	public func setRight(_ right: LayoutElement.Line) -> BottomCenterRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 right: right)
		
	}
	
}

// MARK: Top
extension BottomCenterDidSetLayoutMaker: LayoutMakerCanSetTopType {
	
	public typealias WillSetTopMaker = BottomCenterTopDidSetLayoutMaker
	
	public func setTop(_ top: LayoutElement.Line) -> BottomCenterTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 top: top)
		
	}
	
}

// MARK: Middle
extension BottomCenterDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = BottomCenterMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Line) -> BottomCenterMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension BottomCenterDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = BottomCenterWidthDidSetLayoutMaker
	
	public func setWidth(_ width: LayoutElement.Length) -> BottomCenterWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 width: width)
		
	}
	
}

// MARK: Height
extension BottomCenterDidSetLayoutMaker: LayoutMakerCanSetHeightType {
	
	public typealias WillSetHeightMaker = BottomCenterHeightDidSetLayoutMaker
	
	public func setHeight(_ height: LayoutElement.Length) -> BottomCenterHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 height: height)
		
	}
	
}
