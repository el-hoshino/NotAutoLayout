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
	
	let left: LayoutElement.Float
	
	let bottom: LayoutElement.Float
	
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
extension LeftBottomDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let left = self.left.evaluated(from: parameter)
			let bottom = self.bottom.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(left: left, bottom: bottom, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, parameter) -> CGRect in
			
			let left = self.left.evaluated(from: parameter)
			let bottom = self.bottom.evaluated(from: parameter)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(left: left, bottom: bottom, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension LeftBottomDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> LeftBottomWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = LeftBottomWidthDidSetLayoutMaker(parentView: self.parentView,
		                                             left: self.left,
		                                             bottom: self.bottom,
		                                             width: width)
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftBottomWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = LeftBottomWidthDidSetLayoutMaker(parentView: self.parentView,
		                                             left: self.left,
		                                             bottom: self.bottom,
		                                             width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension LeftBottomDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LeftBottomHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = LeftBottomHeightDidSetLayoutMaker(parentView: self.parentView,
		                                              left: self.left,
		                                              bottom: self.bottom,
		                                              height: height)
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftBottomHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = LeftBottomHeightDidSetLayoutMaker(parentView: self.parentView,
		                                              left: self.left,
		                                              bottom: self.bottom,
		                                              height: height)
		
		return maker
		
	}
	
}
