//
//  RightMiddleDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct RightMiddleDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let right: LayoutElement.Line
	
	let middle: LayoutElement.Line
	
}

// MARK: - Make Frame
extension RightMiddleDidSetLayoutMaker {
	
	private func makeFrame(right: CGFloat, middle: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let top = middle - size.height.half
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension RightMiddleDidSetLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let right = self.right.evaluated(from: parameter)
		let middle = self.middle.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(right: right, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension RightMiddleDidSetLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = RightMiddleBottomDidSetLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> RightMiddleBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 middle: self.middle,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension RightMiddleDidSetLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = RightMiddleWidthDidSetLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> RightMiddleWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 middle: self.middle,
					 width: width)
		
	}
	
}

// MARK: Height
extension RightMiddleDidSetLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = RightMiddleHeightDidSetLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> RightMiddleHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 middle: self.middle,
					 height: height)
		
	}
	
}
