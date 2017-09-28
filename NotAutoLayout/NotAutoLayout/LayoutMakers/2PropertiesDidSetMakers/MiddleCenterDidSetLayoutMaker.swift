//
//  MiddleCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleCenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleCenter: CGRect.Point
	
}

extension MiddleCenterDidSetLayoutMaker {
	
	private func makeFrame(middleCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleCenter.x - size.width.half
		let y = middleCenter.y - size.height.half
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension MiddleCenterDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> MiddleCenterWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.constant(width)
		
		let maker = MiddleCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               middleCenter: self.middleCenter,
		                                               width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleCenterWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(width)
		
		let maker = MiddleCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               middleCenter: self.middleCenter,
		                                               width: width)
		
		return maker
		
	}
	
}

extension MiddleCenterDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let middleCenter = self.middleCenter.closureValue(parameter)
			let size = size(parameter)
			let frame = self.makeFrame(middleCenter: middleCenter, size: size)
			
			return frame
			
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout.makeCustom { (fitting, boundSize) -> CGRect in
			
			let middleCenter = self.middleCenter.closureValue(boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(middleCenter: middleCenter, size: size)
			
			return frame
			
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
