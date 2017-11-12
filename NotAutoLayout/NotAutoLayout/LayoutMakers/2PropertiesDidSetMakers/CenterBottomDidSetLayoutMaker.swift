//
//  CenterBottomDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterBottomDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
	let bottom: LayoutElement.Line
	
}

// MARK: - Make Frame
extension CenterBottomDidSetLayoutMaker {
	
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
extension CenterBottomDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func makeFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let center = self.center.evaluated(from: parameter)
		let bottom = self.bottom.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(center: center, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension CenterBottomDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = CenterBottomWidthDidSetLayoutMaker
	
	public func setWidth(_ width: LayoutElement.Length) -> CenterBottomWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 bottom: self.bottom,
					 width: width)
		
	}
	
}

// MARK: Height
extension CenterBottomDidSetLayoutMaker: LayoutMakerCanSetHeightType {
	
	public typealias WillSetHeightMaker = CenterBottomHeightDidSetLayoutMaker
	
	public func setHeight(_ height: LayoutElement.Length) -> CenterBottomHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 bottom: self.bottom,
					 height: height)
		
	}
	
}
