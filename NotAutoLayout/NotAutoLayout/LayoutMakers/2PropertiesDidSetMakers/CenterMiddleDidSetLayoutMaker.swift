//
//  CenterMiddleDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterMiddleDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
	let middle: LayoutElement.Line
	
}

// MARK: - Make Frame
extension CenterMiddleDidSetLayoutMaker {
	
	private func makeFrame(center: CGFloat, middle: CGFloat, size: CGSize) -> CGRect {
		
		let left = center - size.width.half
		let top = middle - size.height.half
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension CenterMiddleDidSetLayoutMaker: LayoutMakerCanStoreSizeToEvaluateFrameType {
	
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
extension CenterMiddleDidSetLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = CenterMiddleBottomDidSetLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> CenterMiddleBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 middle: self.middle,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension CenterMiddleDidSetLayoutMaker: LayoutMakerCanStoreWidthType {
	
	public typealias WillSetWidthMaker = CenterMiddleWidthDidSetLayoutMaker
	
	public func storeWidth(_ width: LayoutElement.Length) -> CenterMiddleWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 middle: self.middle,
					 width: width)
		
	}
	
}

// MARK: Height
extension CenterMiddleDidSetLayoutMaker: LayoutMakerCanStoreHeightType {
	
	public typealias WillSetHeightMaker = CenterMiddleHeightDidSetLayoutMaker
	
	public func storeHeight(_ height: LayoutElement.Length) -> CenterMiddleHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 middle: self.middle,
					 height: height)
		
	}
	
}
