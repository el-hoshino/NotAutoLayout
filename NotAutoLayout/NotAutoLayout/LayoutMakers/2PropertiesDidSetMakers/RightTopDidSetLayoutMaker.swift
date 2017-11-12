//
//  RightTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct RightTopDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let right: LayoutElement.Float
	
	let top: LayoutElement.Float
	
}

// MARK: - Make Frame
extension RightTopDidSetLayoutMaker {
	
	private func makeFrame(right: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension RightTopDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let right = self.right.evaluated(from: parameter)
			let top = self.top.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(right: right, top: top, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, parameter) -> CGRect in
			
			let right = self.right.evaluated(from: parameter)
			let top = self.top.evaluated(from: parameter)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(right: right, top: top, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension RightTopDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = RightTopMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Float) -> RightTopMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension RightTopDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = RightTopBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Float) -> RightTopBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: self.top,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension RightTopDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> RightTopWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = RightTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                           right: self.right,
		                                           top: self.top,
		                                           width: width)
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightTopWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = RightTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                           right: self.right,
		                                           top: self.top,
		                                           width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension RightTopDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> RightTopHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = RightTopHeightDidSetLayoutMaker(parentView: self.parentView,
		                                            right: self.right,
		                                            top: self.top,
		                                            height: height)
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightTopHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = RightTopHeightDidSetLayoutMaker(parentView: self.parentView,
		                                            right: self.right,
		                                            top: self.top,
		                                            height: height)
		
		return maker
		
	}
	
}
