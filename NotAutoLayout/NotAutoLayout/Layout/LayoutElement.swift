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
	
	public enum Horizontal {
		
		case constant(CGFloat)
		case byParent((ViewFrameProperty) -> CGFloat)
		case byReference(referenceGetter: () -> UIView?, (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat)
		
	}
	
	public enum Vertical {
		
		case constant(CGFloat)
		case byParent((ViewFrameProperty) -> CGFloat)
		case byReference(referenceGetter: () -> UIView?, (ViewPinProperty<ViewPinPropertyType.Vertical>) -> CGFloat)
		
	}
	
	public enum Point {
		
		case constant(CGPoint)
		case byParent((ViewFrameProperty) -> CGPoint)
		case byReference(referenceGetter: () -> UIView?,(ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint)
		
	}
	
	public enum Length {
		
		case constant(CGFloat)
		case byParent((ViewFrameProperty) -> CGFloat)
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
		case byParent((ViewFrameProperty) -> CGSize)
		case fits(CGSize)
		case aspect(AspectSizing)
		
	}
	
	public enum Rect {
		
		case constant(CGRect)
		case byParent((ViewFrameProperty) -> CGRect)
		
	}
	
}

extension LayoutElement.Horizontal {
	
	func evaluated(from parameters: CalculationParameters) -> CGFloat {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calculation):
			return calculation(parameters.property)
			
		case .byReference(referenceGetter: let reference, let calculation):
			return calculation(.horizontal(parentView: parameters.property.parentView, referenceView: reference))
		}
		
	}
	
}

extension LayoutElement.Vertical {
	
	func evaluated(from parameters: CalculationParameters) -> CGFloat {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calculation):
			return calculation(parameters.property)
			
		case .byReference(referenceGetter: let reference, let calculation):
			return calculation(.vertical(parentView: parameters.property.parentView, referenceView: reference))
		}
		
	}
	
}

extension LayoutElement.Point {
	
	func evaluated(from parameters: CalculationParameters) -> CGPoint {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calculation):
			return calculation(parameters.property)
			
		case .byReference(referenceGetter: let reference, let calculation):
			return calculation(.point(parentView: parameters.property.parentView, referenceView: reference))
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
	
	func evaluated(from parameters: CalculationParameters, withTheOtherAxis oppositeAxis: Axis) -> CGFloat {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calculation):
			return calculation(parameters.property)
			
		case .fits(let fittingValue):
			return oppositeAxis.fittedTheOtherLength(fittingCalculation: parameters.targetView.sizeThatFits, fittingLength: fittingValue)
		}
		
	}
	
}

extension LayoutElement.Size {
	
	func evaluated(from parameters: CalculationParameters) -> CGSize {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calculation):
			return calculation(parameters.property)
			
		case .fits(let fittingSize):
			return parameters.targetView.sizeThatFits(fittingSize)
			
		case .aspect(let aspect):
			return parameters.property.evaluateSize(for: parameters.targetView, from: aspect)
		}
		
	}
	
}

extension LayoutElement.Rect {
	
	func evaluated(from parameters: CalculationParameters) -> CGRect {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calculation):
			return calculation(parameters.property)
		}
		
	}
	
}
