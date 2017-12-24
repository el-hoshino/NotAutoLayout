//
//  DidStoreLeftTopLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftTopLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let top: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreLeftTopLayoutMaker {
	
	private func makeFrame(left: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreLeftTopLayoutMaker: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(left: left, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreLeftTopLayoutMaker: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreLeftTopMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreLeftTopMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 top: self.top,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreLeftTopLayoutMaker: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreLeftTopBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreLeftTopBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 top: self.top,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreLeftTopLayoutMaker: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreLeftTopWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreLeftTopWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 top: self.top,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreLeftTopLayoutMaker: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreLeftTopHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreLeftTopHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 top: self.top,
					 height: height)
		
	}
	
}
