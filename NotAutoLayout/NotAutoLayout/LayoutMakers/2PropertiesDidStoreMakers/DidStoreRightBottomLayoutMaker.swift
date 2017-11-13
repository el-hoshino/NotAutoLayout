//
//  DidStoreRightBottomLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreRightBottomLayoutMaker {
	
	public unowned let parentView: UIView
	
	let right: LayoutElement.Line
	
	let bottom: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreRightBottomLayoutMaker {
	
	private func makeFrame(right: CGFloat, bottom: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let top = bottom - size.height
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreRightBottomLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let right = self.right.evaluated(from: parameter)
		let bottom = self.bottom.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(right: right, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreRightBottomLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = DidStoreRightBottomWidthLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> DidStoreRightBottomWidthLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 bottom: self.bottom,
					 width: width)
		
	}
	
}

// MARK: Height
extension DidStoreRightBottomLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = DidStoreRightBottomHeightLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> DidStoreRightBottomHeightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 bottom: self.bottom,
					 height: height)
		
	}
	
}
