//
//  DidStoreCenterMiddleLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterMiddleLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
	let middle: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreCenterMiddleLayoutMaker {
	
	private func makeFrame(center: CGFloat, middle: CGFloat, size: CGSize) -> CGRect {
		
		let left = center - size.width.halved
		let top = middle - size.height.halved
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreCenterMiddleLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let center = self.center.evaluated(from: parameter)
		let middle = self.middle.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(center: center, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension DidStoreCenterMiddleLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreCenterMiddleBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreCenterMiddleBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 middle: self.middle,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreCenterMiddleLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreCenterMiddleWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreCenterMiddleWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 middle: self.middle,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreCenterMiddleLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreCenterMiddleHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreCenterMiddleHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 middle: self.middle,
					 height: height)
		
	}
	
}
