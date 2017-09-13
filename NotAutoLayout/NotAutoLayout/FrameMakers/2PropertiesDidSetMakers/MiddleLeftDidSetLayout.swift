//
//  MiddleLeftDidSetLayout.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleLeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleLeft: CGRect.Point
	
}

extension MiddleLeftDidSetLayoutMaker {
	
	private func makeFrame(middleLeft: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleLeft.x
		let y = middleLeft.y - size.height.half
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension MiddleLeftDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> MiddleLeftWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.constant(width)
		
		let maker = MiddleLeftWidthDidSetLayoutMaker(parentView: self.parentView,
		                                             middleLeft: self.middleLeft,
		                                             width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleLeftWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(width)
		
		let maker = MiddleLeftWidthDidSetLayoutMaker(parentView: self.parentView,
		                                             middleLeft: self.middleLeft,
		                                             width: width)
		
		return maker
		
	}
	
}

extension MiddleLeftDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> Layout.Individual {
		
		if let middleLeft = self.middleLeft.constantValue {
			let frame = self.makeFrame(middleLeft: middleLeft, size: size)
			let layout = Layout.Individual.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
				let middleLeft = self.middleLeft.closureValue(boundSize)
				let frame = self.makeFrame(middleLeft: middleLeft, size: size)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (parameter) -> CGRect in
			let middleLeft = self.middleLeft.closureValue(parameter)
			let size = size(parameter)
			let frame = self.makeFrame(middleLeft: middleLeft, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (fitting, boundSize) -> CGRect in
			
			let middleLeft = self.middleLeft.closureValue(boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(middleLeft: middleLeft, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
