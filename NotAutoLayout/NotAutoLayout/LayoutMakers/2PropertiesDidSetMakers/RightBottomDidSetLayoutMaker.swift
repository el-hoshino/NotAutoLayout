//
//  RightBottomDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct RightBottomDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let right: CGRect.Float
	
	let bottom: CGRect.Float
	
}

// MARK: - Make Frame
extension RightBottomDidSetLayoutMaker {
	
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
extension RightBottomDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let right = self.right.evaluated(from: parameter)
			let bottom = self.bottom.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(right: right, bottom: bottom, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, parameter) -> CGRect in
			
			let right = self.right.evaluated(from: parameter)
			let bottom = self.bottom.evaluated(from: parameter)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(right: right, bottom: bottom, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension RightBottomDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> RightBottomWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.constant(width)
		
		let maker = RightBottomWidthDidSetLayoutMaker(parentView: self.parentView,
		                                              right: self.right,
		                                              bottom: self.bottom,
		                                              width: width)
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightBottomWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(width)
		
		let maker = RightBottomWidthDidSetLayoutMaker(parentView: self.parentView,
		                                              right: self.right,
		                                              bottom: self.bottom,
		                                              width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension RightBottomDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> RightBottomHeightDidSetLayoutMaker {
		
		let height = CGRect.Float.constant(height)
		
		let maker = RightBottomHeightDidSetLayoutMaker(parentView: self.parentView,
		                                               right: self.right,
		                                               bottom: self.bottom,
		                                               height: height)
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightBottomHeightDidSetLayoutMaker {
		
		let height = CGRect.Float.closure(height)
		
		let maker = RightBottomHeightDidSetLayoutMaker(parentView: self.parentView,
		                                               right: self.right,
		                                               bottom: self.bottom,
		                                               height: height)
		
		return maker
		
	}
	
}
