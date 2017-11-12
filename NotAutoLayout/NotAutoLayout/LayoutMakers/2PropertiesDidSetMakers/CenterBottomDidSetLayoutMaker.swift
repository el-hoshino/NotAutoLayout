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
extension CenterBottomDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let center = self.center.evaluated(from: parameter)
			let bottom = self.bottom.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(center: center, bottom: bottom, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, parameter) -> CGRect in
			
			let center = self.center.evaluated(from: parameter)
			let bottom = self.bottom.evaluated(from: parameter)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(center: center, bottom: bottom, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension CenterBottomDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> CenterBottomWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Line.constant(width)
		
		let maker = CenterBottomWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               center: self.center,
		                                               bottom: self.bottom,
		                                               width: width)
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterBottomWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Line.closure(width)
		
		let maker = CenterBottomWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               center: self.center,
		                                               bottom: self.bottom,
		                                               width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension CenterBottomDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> CenterBottomHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Line.constant(height)
		
		let maker = CenterBottomHeightDidSetLayoutMaker(parentView: self.parentView,
		                                                center: self.center,
		                                                bottom: self.bottom,
		                                                height: height)
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterBottomHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Line.closure(height)
		
		let maker = CenterBottomHeightDidSetLayoutMaker(parentView: self.parentView,
		                                                center: self.center,
		                                                bottom: self.bottom,
		                                                height: height)
		
		return maker
		
	}
	
}
