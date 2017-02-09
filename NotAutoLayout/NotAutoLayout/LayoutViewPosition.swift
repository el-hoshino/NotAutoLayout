//
//  LayoutViewPosition.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/02/09.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension LayoutView {
	
	public enum Position {
		
		public enum CustomValue {
			case absolute(CGFloat)
			case relative(CGFloat)
		}
		
		case absolute(CGRect)
		case relative(CGRect)
		case custom(x: CustomValue, y: CustomValue, width: CustomValue, height: CustomValue)
		
	}
	
}

extension LayoutView.Position.CustomValue {
	
	func absoluteValue(in length: CGFloat) -> CGFloat {
		
		switch self {
		case .absolute(let value):
			return value
			
		case .relative(let value):
			return value * length
		}
		
	}
	
}

extension LayoutView.Position {
	
	func absoluteRect(in size: CGSize) -> CGRect {
		
		switch self {
		case .absolute(let rect):
			return rect
			
		case .relative(let rect):
			return rect.absoluteRectApplied(to: size)
			
		case .custom(x: let x, y: let y, width: let width, height: let height):
			let x = x.absoluteValue(in: size.width)
			let y = y.absoluteValue(in: size.height)
			let width = width.absoluteValue(in: size.width)
			let height = height.absoluteValue(in: size.height)
			return CGRect(x: x, y: y, width: width, height: height)
		}
		
	}
	
}
