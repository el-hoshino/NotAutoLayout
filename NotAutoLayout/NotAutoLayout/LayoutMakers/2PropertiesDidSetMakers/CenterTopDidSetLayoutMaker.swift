//
//  CenterTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterTopDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
	let top: LayoutElement.Line
	
}

// MARK: - Make Frame
extension CenterTopDidSetLayoutMaker {
	
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
extension CenterTopDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func makeFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let center = self.center.evaluated(from: parameter)
		let top = self.top.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(center: center, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension CenterTopDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = CenterTopMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Line) -> CenterTopMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 top: self.top,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension CenterTopDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = CenterTopBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Line) -> CenterTopBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 top: self.top,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension CenterTopDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = CenterTopWidthDidSetLayoutMaker
	
	public func setWidth(_ width: LayoutElement.Length) -> CenterTopWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 top: self.top,
					 width: width)
		
	}
	
}

// MARK: Height
extension CenterTopDidSetLayoutMaker: LayoutMakerCanSetHeightType {
	
	public typealias WillSetHeightMaker = CenterTopHeightDidSetLayoutMaker
	
	public func setHeight(_ height: LayoutElement.Length) -> CenterTopHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 top: self.top,
					 height: height)
		
	}
	
}
