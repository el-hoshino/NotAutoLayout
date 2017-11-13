//
//  DidStoreCenterBottomLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterBottomLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
	let bottom: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreCenterBottomLayoutMaker {
	
	private func makeFrame(center: CGFloat, bottom: CGFloat, size: CGSize) -> CGRect {
		
		let left = center - size.width.half
		let top = bottom - size.height
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreCenterBottomLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let center = self.center.evaluated(from: parameter)
		let bottom = self.bottom.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(center: center, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreCenterBottomLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreCenterBottomWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreCenterBottomWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 bottom: self.bottom,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreCenterBottomLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreCenterBottomHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreCenterBottomHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 bottom: self.bottom,
					 height: height)
		
	}
	
}
