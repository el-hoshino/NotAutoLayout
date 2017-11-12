//
//  LayoutElement.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LayoutElement {
	
}

extension LayoutElement {
	
	public enum Line {
		
		case constant(CGFloat)
		case closure((LayoutControlParameter) -> CGFloat)
		
	}
	
	public enum Point {
		
		case constant(CGPoint)
		case closure((LayoutControlParameter) -> CGPoint)
		
	}
	
	public enum Length {
		
		case constant(CGFloat)
		case closure((LayoutControlParameter) -> CGFloat)
		case fits(CGFloat)
		
	}
	
	public enum Size {
		
		case constant(CGSize)
		case closure((LayoutControlParameter) -> CGSize)
		case fits(CGSize)
		
	}
	
	public enum Rect {
		
		case constant(CGRect)
		case closure((LayoutControlParameter) -> CGRect)
		
	}
	
}

extension LayoutElement.Line {
	
	func evaluated(from parameter: LayoutControlParameter) -> CGFloat {
		
		switch self {
		case .constant(let value):
			return value
			
		case .closure(let calculation):
			return calculation(parameter)
		}
		
	}
	
}

extension LayoutElement.Point {
	
	func evaluated(from parameter: LayoutControlParameter) -> CGPoint {
		
		switch self {
		case .constant(let value):
			return value
			
		case .closure(let calculation):
			return calculation(parameter)
		}
		
	}
	
}

extension LayoutElement.Length {
	
	enum Axis {
		
		case width(CGFloat)
		case height(CGFloat)
		
		func fittedTheOtherLength(fittingCalculation: (CGSize) -> CGSize, fittingLength: CGFloat) -> CGFloat {
			
			switch self {
			case .width(let width):
				let fittingSize = CGSize(width: width, height: fittingLength)
				let fittedSize = fittingCalculation(fittingSize)
				return fittedSize.height
				
			case .height(let height):
				let fittingSize = CGSize(width: fittingLength, height: height)
				let fittedSize = fittingCalculation(fittingSize)
				return fittedSize.width
			}
			
		}
		
	}
	
	func evaluated(from parameter: LayoutControlParameter, theOtherAxis: Axis, fittingCalculation: (CGSize) -> CGSize) -> CGFloat {
		
		switch self {
		case .constant(let value):
			return value
			
		case .closure(let calculation):
			return calculation(parameter)
			
		case .fits(let fitting):
			return theOtherAxis.fittedTheOtherLength(fittingCalculation: fittingCalculation, fittingLength: fitting)
		}
		
	}
	
}

extension LayoutElement.Size {
	
	func evaluated(from parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGSize {
		
		switch self {
		case .constant(let value):
			return value
			
		case .closure(let calculation):
			return calculation(parameter)
			
		case .fits(let fitting):
			return fittingCalculation(fitting)
		}
		
	}
	
}

extension LayoutElement.Rect {
	
	func evaluated(from parameter: LayoutControlParameter) -> CGRect {
		
		switch self {
		case .constant(let value):
			return value
			
		case .closure(let calculation):
			return calculation(parameter)
		}
		
	}
	
}
