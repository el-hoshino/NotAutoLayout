//
//  BottomCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct BottomCenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomCenter: CGRect.Point
	
}

extension BottomCenterDidSetLayoutMaker {
	
	private func makeFrame(bottomCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = bottomCenter.x - size.width.half
		let y = bottomCenter.y - size.height
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension BottomCenterDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> BottomCenterWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.constant(width)
		
		let maker = BottomCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               bottomCenter: self.bottomCenter,
		                                               width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> BottomCenterWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(width)
		
		let maker = BottomCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               bottomCenter: self.bottomCenter,
		                                               width: width)
		
		return maker
		
	}
	
}

extension BottomCenterDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let bottomCenter = self.bottomCenter.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(bottomCenter: bottomCenter, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let bottomCenter = self.bottomCenter.evaluated(from: boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(bottomCenter: bottomCenter, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
