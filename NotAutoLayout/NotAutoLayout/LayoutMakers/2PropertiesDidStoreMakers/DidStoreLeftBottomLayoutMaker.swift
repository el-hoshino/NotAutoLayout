//
//  DidStoreLeftBottomLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftBottomLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let bottom: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreLeftBottomLayoutMaker {
	
	private func makeFrame(left: CGFloat, bottom: CGFloat, size: CGSize) -> CGRect {
		
		let top = bottom - size.height
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreLeftBottomLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let left = self.left.evaluated(from: parameter)
		let bottom = self.bottom.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(left: left, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreLeftBottomLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreLeftBottomWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreLeftBottomWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 bottom: self.bottom,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreLeftBottomLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreLeftBottomHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreLeftBottomHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 bottom: self.bottom,
					 height: height)
		
	}
	
}
