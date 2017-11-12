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
extension CenterTopDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let center = self.center.evaluated(from: parameter)
			let top = self.top.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(center: center, top: top, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, parameter) -> CGRect in
			
			let center = self.center.evaluated(from: parameter)
			let top = self.top.evaluated(from: parameter)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(center: center, top: top, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
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
extension CenterTopDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> CenterTopWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Line.constant(width)
		
		let maker = CenterTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                            center: self.center,
		                                            top: self.top,
		                                            width: width)
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterTopWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Line.closure(width)
		
		let maker = CenterTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                            center: self.center,
		                                            top: self.top,
		                                            width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension CenterTopDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> CenterTopHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Line.constant(height)
		
		let maker = CenterTopHeightDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             height: height)
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterTopHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Line.closure(height)
		
		let maker = CenterTopHeightDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             height: height)
		
		return maker
		
	}
	
}
