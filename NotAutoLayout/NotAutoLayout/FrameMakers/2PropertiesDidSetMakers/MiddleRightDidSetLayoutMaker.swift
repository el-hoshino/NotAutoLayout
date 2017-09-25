//
//  MiddleRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleRightDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleRight: CGRect.Point
	
}

extension MiddleRightDidSetLayoutMaker {
	
	private func makeFrame(middleRight: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleRight.x - size.width
		let y = middleRight.y - size.height.half
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension MiddleRightDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> MiddleRightWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.constant(width)
		
		let maker = MiddleRightWidthDidSetLayoutMaker(parentView: self.parentView,
		                                              middleRight: self.middleRight,
		                                              width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleRightWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(width)
		
		let maker = MiddleRightWidthDidSetLayoutMaker(parentView: self.parentView,
		                                              middleRight: self.middleRight,
		                                              width: width)
		
		return maker
		
	}
	
}

extension MiddleRightDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> Layout {
		
		if let middleRight = self.middleRight.constantValue {
			let frame = self.makeFrame(middleRight: middleRight, size: size)
			let layout = Layout.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.makeCustom { (boundSize) -> CGRect in
				let middleRight = self.middleRight.closureValue(boundSize)
				let frame = self.makeFrame(middleRight: middleRight, size: size)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> Layout {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let middleRight = self.middleRight.closureValue(parameter)
			let size = size(parameter)
			let frame = self.makeFrame(middleRight: middleRight, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> Layout {
		
		let layout = Layout.makeCustom { (fitting, boundSize) -> CGRect in
			
			let middleRight = self.middleRight.closureValue(boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(middleRight: middleRight, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
