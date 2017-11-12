//
//  LeftTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftTopDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let top: LayoutElement.Line
	
}

// MARK: - Make Frame
extension LeftTopDidSetLayoutMaker {
	
	private func makeFrame(left: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension LeftTopDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let left = self.left.evaluated(from: parameter)
			let top = self.top.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(left: left, top: top, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, parameter) -> CGRect in
			
			let left = self.left.evaluated(from: parameter)
			let top = self.top.evaluated(from: parameter)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(left: left, top: top, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension LeftTopDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = LeftTopMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Line) -> LeftTopMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 top: self.top,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension LeftTopDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = LeftTopBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Line) -> LeftTopBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 top: self.top,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension LeftTopDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> LeftTopWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Line.constant(width)
		
		let maker = LeftTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          left: self.left,
		                                          top: self.top,
		                                          width: width)
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftTopWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Line.closure(width)
		
		let maker = LeftTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          left: self.left,
		                                          top: self.top,
		                                          width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension LeftTopDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LeftTopHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Line.constant(height)
		
		let maker = LeftTopHeightDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           top: self.top,
		                                           height: height)
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftTopHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Line.closure(height)
		
		let maker = LeftTopHeightDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           top: self.top,
		                                           height: height)
		
		return maker
		
	}
	
}
