//
//  DidStoreCenterTopLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterTopLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
	let top: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreCenterTopLayoutMaker {
	
	private func makeFrame(center: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let left = center - size.width.half
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreCenterTopLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let center = self.center.evaluated(from: parameter)
		let top = self.top.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(center: center, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreCenterTopLayoutMaker: LayoutMakerCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreCenterTopMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreCenterTopMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 top: self.top,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreCenterTopLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreCenterTopBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreCenterTopBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 top: self.top,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreCenterTopLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreCenterTopWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreCenterTopWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 top: self.top,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreCenterTopLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreCenterTopHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreCenterTopHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 top: self.top,
					 height: height)
		
	}
	
}
