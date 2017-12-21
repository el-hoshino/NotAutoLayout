//
//  DidStoreRightMiddleLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreRightMiddleLayoutMaker {
	
	public unowned let parentView: UIView
	
	let right: LayoutElement.Line
	
	let middle: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreRightMiddleLayoutMaker {
	
	private func makeFrame(right: CGFloat, middle: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let top = middle - size.height.halved
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreRightMiddleLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let right = self.right.evaluated(from: parameter)
		let middle = self.middle.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(right: right, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension DidStoreRightMiddleLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreRightMiddleBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreRightMiddleBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 middle: self.middle,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreRightMiddleLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreRightMiddleWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreRightMiddleWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 middle: self.middle,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreRightMiddleLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreRightMiddleHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreRightMiddleHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 middle: self.middle,
					 height: height)
		
	}
	
}
