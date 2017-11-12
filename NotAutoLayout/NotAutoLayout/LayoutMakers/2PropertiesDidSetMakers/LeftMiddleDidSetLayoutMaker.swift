//
//  LeftMiddleDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftMiddleDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let middle: LayoutElement.Line
	
}

// MARK: - Make Frame
extension LeftMiddleDidSetLayoutMaker {
	
	private func makeFrame(left: CGFloat, middle: CGFloat, size: CGSize) -> CGRect {
		
		let top = middle - size.height.half
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension LeftMiddleDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func makeFrame(size: LayoutElement.Size, parameter: LayoutControlParameter) -> CGRect {
		
		let left = self.left.evaluated(from: parameter)
		let middle = self.middle.evaluated(from: parameter)
		let size = size.evaluated(from: parameter)
		return self.makeFrame(left: left, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension LeftMiddleDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = LeftMiddleBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Line) -> LeftMiddleBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 middle: self.middle,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension LeftMiddleDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = LeftMiddleWidthDidSetLayoutMaker
	
	public func setWidth(_ width: LayoutElement.Length) -> LeftMiddleWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 middle: self.middle,
					 width: width)
		
	}
	
}

// MARK: Height
extension LeftMiddleDidSetLayoutMaker: LayoutMakerCanSetHeightType {
	
	public typealias WillSetHeightMaker = LeftMiddleHeightDidSetLayoutMaker
	
	public func setHeight(_ height: LayoutElement.Length) -> LeftMiddleHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 middle: self.middle,
					 height: height)
		
	}
	
}
