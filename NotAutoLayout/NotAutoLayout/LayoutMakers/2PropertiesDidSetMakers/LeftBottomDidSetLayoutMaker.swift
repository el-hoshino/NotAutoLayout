//
//  LeftBottomDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftBottomDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let bottom: LayoutElement.Line
	
}

// MARK: - Make Frame
extension LeftBottomDidSetLayoutMaker {
	
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
extension LeftBottomDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func makeFrame(size: LayoutElement.Size, parameter: LayoutControlParameter) -> CGRect {
		
		let left = self.left.evaluated(from: parameter)
		let bottom = self.bottom.evaluated(from: parameter)
		let size = size.evaluated(from: parameter)
		return self.makeFrame(left: left, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension LeftBottomDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = LeftBottomWidthDidSetLayoutMaker
	
	public func setWidth(_ width: LayoutElement.Length) -> LeftBottomWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 bottom: self.bottom,
					 width: width)
		
	}
	
}

// MARK: Height
extension LeftBottomDidSetLayoutMaker: LayoutMakerCanSetHeightType {
	
	public typealias WillSetHeightMaker = LeftBottomHeightDidSetLayoutMaker
	
	public func setHeight(_ height: LayoutElement.Length) -> LeftBottomHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 bottom: self.bottom,
					 height: height)
		
	}
	
}
