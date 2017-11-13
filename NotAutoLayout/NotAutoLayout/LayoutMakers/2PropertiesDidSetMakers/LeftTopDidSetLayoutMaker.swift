//
//  LeftTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftTopDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let top: LayoutElement.Line
	
}

// MARK: - Make Frame
extension LeftTopDidSetLayoutMaker {
	
	private func makeFrame(left: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension LeftTopDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let left = self.left.evaluated(from: parameter)
		let top = self.top.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(left: left, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension LeftTopDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = LeftTopMiddleDidSetLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> LeftTopMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 top: self.top,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension LeftTopDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = LeftTopBottomDidSetLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> LeftTopBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 top: self.top,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension LeftTopDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = LeftTopWidthDidSetLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> LeftTopWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 top: self.top,
					 width: width)
		
	}
	
}

// MARK: Height
extension LeftTopDidSetLayoutMaker: LayoutMakerCanSetHeightType {
	
	public typealias WillSetHeightMaker = LeftTopHeightDidSetLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> LeftTopHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 top: self.top,
					 height: height)
		
	}
	
}
