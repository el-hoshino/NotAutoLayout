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
		
		public enum AspectSizing {
			
			case fit(CGFloat?)
			case fill(CGFloat?)
			
			@available(iOS 11.0, *)
			case safeAreaFit(CGFloat?, safeAreaOnly: Bool)
			
			@available(iOS 11.0, *)
			case safeAreaFill(CGFloat?, safeAreaOnly: Bool)
			
			var ratio: CGFloat? {
				switch self {
				case .fit(let ratio):
					return ratio
					
				case .fill(let ratio):
					return ratio
					
				case .safeAreaFit(let ratio, safeAreaOnly: _):
					return ratio
					
				case .safeAreaFill(let ratio, safeAreaOnly: _):
					return ratio
				}
				
			}
			
			var safeAreaOnly: Bool {
				switch self {
				case .fit, .fill:
					return false
					
				case .safeAreaFit(_, safeAreaOnly: let safeAreaOnly):
					return safeAreaOnly
					
				case .safeAreaFill(_, safeAreaOnly: let safeAreaOnly):
					return safeAreaOnly
				}
				
			}
			
			var isFit: Bool {
				switch self {
				case .fit, .safeAreaFit:
					return true
					
				case .fill, .safeAreaFill:
					return false
				}
			}
			
			var isFill: Bool {
				switch self {
				case .fit, .safeAreaFit:
					return false
					
				case .fill, .safeAreaFill:
					return true
				}
			}
			
		}
		
		case constant(CGSize)
		case closure((LayoutControlParameter) -> CGSize)
		case fits(CGSize)
		case aspect(AspectSizing)
		
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
	
	func evaluated(from parameter: LayoutControlParameter, fitting fittingCalculation: (CGSize) -> CGSize, withTheOtherAxis oppositeAxis: Axis) -> CGFloat {
		
		switch self {
		case .constant(let value):
			return value
			
		case .closure(let calculation):
			return calculation(parameter)
			
		case .fits(let fittingLength):
			return oppositeAxis.fittedTheOtherLength(fittingCalculation: fittingCalculation, fittingLength: fittingLength)
		}
		
	}
	
}

extension LayoutElement.Size {
	
	func evaluated(from parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGSize {
		
		switch self {
		case .constant(let value):
			return value
			
		case .closure(let calculation):
			return parameter.evaluateSize(from: calculation)
			
		case .fits(let fittingSize):
			return fittingCalculation(fittingSize)
			
		case .aspect(let aspect):
			return parameter.evaluateSize(from: aspect, defaultRatio: fittingCalculation(.zero).ratio)
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
