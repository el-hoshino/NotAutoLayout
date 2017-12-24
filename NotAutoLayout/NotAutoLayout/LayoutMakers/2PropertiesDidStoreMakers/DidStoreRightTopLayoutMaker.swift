//
//  DidStoreRightTopLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreRightTopLayoutMaker {
	
	public unowned let parentView: UIView
	
	let right: LayoutElement.Line
	
	let top: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreRightTopLayoutMaker {
	
	private func makeFrame(right: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreRightTopLayoutMaker: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let right = self.right.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(right: right, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreRightTopLayoutMaker: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreRightTopMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreRightTopMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreRightTopLayoutMaker: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreRightTopBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreRightTopBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreRightTopLayoutMaker: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreRightTopWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreRightTopWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreRightTopLayoutMaker: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreRightTopHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreRightTopHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 height: height)
		
	}
	
}
