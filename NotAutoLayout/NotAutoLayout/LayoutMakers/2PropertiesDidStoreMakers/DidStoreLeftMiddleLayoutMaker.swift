//
//  DidStoreLeftMiddleLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftMiddleLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let middle: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreLeftMiddleLayoutMaker {
	
	private func makeFrame(left: CGFloat, middle: CGFloat, size: CGSize) -> CGRect {
		
		let top = middle - size.height.halved
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreLeftMiddleLayoutMaker: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let size = size.evaluated(from: property, fittingCalculation: fittingCalculation)
		return self.makeFrame(left: left, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension DidStoreLeftMiddleLayoutMaker: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreLeftMiddleBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreLeftMiddleBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 middle: self.middle,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreLeftMiddleLayoutMaker: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreLeftMiddleWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreLeftMiddleWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 middle: self.middle,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreLeftMiddleLayoutMaker: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreLeftMiddleHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreLeftMiddleHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 middle: self.middle,
					 height: height)
		
	}
	
}
