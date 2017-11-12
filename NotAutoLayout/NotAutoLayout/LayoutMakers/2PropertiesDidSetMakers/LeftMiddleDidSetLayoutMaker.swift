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
	
	let left: LayoutElement.Float
	
	let middle: LayoutElement.Float
	
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
extension LeftMiddleDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let left = self.left.evaluated(from: parameter)
			let middle = self.middle.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(left: left, middle: middle, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, parameter) -> CGRect in
			
			let left = self.left.evaluated(from: parameter)
			let middle = self.middle.evaluated(from: parameter)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(left: left, middle: middle, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension LeftMiddleDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = LeftMiddleBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Float) -> LeftMiddleBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 middle: self.middle,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension LeftMiddleDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> LeftMiddleWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = LeftMiddleWidthDidSetLayoutMaker(parentView: self.parentView,
		                                             left: self.left,
		                                             middle: self.middle,
		                                             width: width)
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftMiddleWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = LeftMiddleWidthDidSetLayoutMaker(parentView: self.parentView,
		                                             left: self.left,
		                                             middle: self.middle,
		                                             width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension LeftMiddleDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LeftMiddleHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = LeftMiddleHeightDidSetLayoutMaker(parentView: self.parentView,
		                                              left: self.left,
		                                              middle: self.middle,
		                                              height: height)
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftMiddleHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = LeftMiddleHeightDidSetLayoutMaker(parentView: self.parentView,
		                                              left: self.left,
		                                              middle: self.middle,
		                                              height: height)
		
		return maker
		
	}
	
}
