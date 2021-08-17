//
//  LayoutElement.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public struct LayoutElement {
	
}

extension LayoutElement {
	
	public enum Horizontal {
		
		case constant(Float)
		case byParent((ViewLayoutGuides) -> Float)
		case byReference(referenceGetter: () -> UIView?, (ViewPinGuides.Horizontal) -> Float)
		
	}
	
	public enum Vertical {
		
		case constant(Float)
		case byParent((ViewLayoutGuides) -> Float)
		case byReference(referenceGetter: () -> UIView?, (ViewPinGuides.Vertical) -> Float)
		
	}
	
	public enum Point {
		
		case constant(NotAutoLayout.Point)
		case byParent((ViewLayoutGuides) -> NotAutoLayout.Point)
		case byReference(referenceGetter: () -> UIView?, (ViewPinGuides.Point) -> NotAutoLayout.Point)
		
	}
	
	public enum Length {
		
		case constant(Float)
		case byParent((ViewLayoutGuides) -> Float)
		case fits(Float)
		
	}
	
	public enum Size {
		
		public enum AspectSizing {
			
			case fit(Float?, layoutGuideGetter: (ViewLayoutGuides) -> LayoutGuideRepresentable)
			case fill(Float?, layoutGuideGetter: (ViewLayoutGuides) -> LayoutGuideRepresentable)
			case safeAreaFit(Float?, safeAreaOnly: Bool)
			case safeAreaFill(Float?, safeAreaOnly: Bool)
			
			var ratio: Float? {
				switch self {
				case .fit(let ratio, _):
					return ratio
					
				case .fill(let ratio, _):
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
			
			func layougGuide(in guides: ViewLayoutGuides) -> LayoutGuideRepresentable {
				
				switch self {
				case .fit(_, layoutGuideGetter: let getter):
					return getter(guides)
					
				case .fill(_, layoutGuideGetter: let getter):
					return getter(guides)
					
				case .safeAreaFill, .safeAreaFit:
					if #available(iOS 11.0, *) {
						return guides.safeAreaGuide
					} else {
						return guides
					}
					
				}
				
			}
			
		}
		
		case constant(NotAutoLayout.Size)
		case byParent((ViewLayoutGuides) -> NotAutoLayout.Size)
		case fits(NotAutoLayout.Size)
		case aspect(AspectSizing)
		
	}
	
	public enum Rect {
		
		case constant(NotAutoLayout.Rect)
		case byParent((ViewLayoutGuides) -> NotAutoLayout.Rect)
		
	}
	
	public enum Insets {
		
		case constant(Float)
		case byParent((ViewLayoutGuides) -> Float)
		case equalsToMargin
		
	}
	
	public enum HorizontalMargin {
		
		case constant(Float)
		case byParent((ViewLayoutGuides) -> Float)
		
	}
	
	public enum VerticalMargin {
		
		case constant(Float)
		case byParent((ViewLayoutGuides) -> Float)
		
	}
	
}

extension LayoutElement.Horizontal {
	
	func evaluated(from parameters: IndividualFrameCalculationParameters) -> Float {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calculation):
			return calculation(parameters.guides)
			
		case .byReference(referenceGetter: let reference, let calculation):
			return calculation(.init(parentView: parameters.guides.parentView, referenceViewGetter: reference))
		}
		
	}
	
}

extension LayoutElement.Vertical {
	
	func evaluated(from parameters: IndividualFrameCalculationParameters) -> Float {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calculation):
			return calculation(parameters.guides)
			
		case .byReference(referenceGetter: let reference, let calculation):
			return calculation(.init(parentView: parameters.guides.parentView, referenceViewGetter: reference))
		}
		
	}
	
	func evaluated(from parameters: SequentialFrameCalculationParameters) -> Float {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calcuation):
			return calcuation(parameters.guides)
			
		case .byReference(referenceGetter: let reference, let calculation):
			return calculation(.init(parentView: parameters.guides.parentView, referenceViewGetter: reference))
		}
		
	}
	
}

extension LayoutElement.Point {
	
	func evaluated(from parameters: IndividualFrameCalculationParameters) -> Point {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calculation):
			return calculation(parameters.guides)
			
		case .byReference(referenceGetter: let reference, let calculation):
			return calculation(.init(parentView: parameters.guides.parentView, referenceViewGetter: reference))
		}
		
	}
	
}

extension LayoutElement.Length {
	
	enum Axis {
		
		case width(Float)
		case height(Float)
		
		func fittedTheOtherLength(fittingCalculation: (Size) -> Size, fittingLength: Float) -> Float {
			
			switch self {
			case .width(let width):
				let fittingSize = Size(width: width, height: fittingLength)
				let fittedSize = fittingCalculation(fittingSize)
				return fittedSize.height
				
			case .height(let height):
				let fittingSize = Size(width: fittingLength, height: height)
				let fittedSize = fittingCalculation(fittingSize)
				return fittedSize.width
			}
			
		}
		
	}
	
	func evaluated(from parameters: IndividualFrameCalculationParameters, withTheOtherAxis oppositeAxis: Axis) -> Float {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calculation):
			return calculation(parameters.guides)
			
		case .fits(let fittingValue):
			return oppositeAxis.fittedTheOtherLength(fittingCalculation: parameters.targetView.sizeThatFits, fittingLength: fittingValue)
		}
		
	}
	
}

extension LayoutElement.Size {
	
	func evaluated(from parameters: IndividualFrameCalculationParameters) -> Size {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calculation):
			return calculation(parameters.guides)
			
		case .fits(let fittingSize):
			return parameters.targetView.sizeThatFits(fittingSize)
			
		case .aspect(let aspect):
			return parameters.guides.evaluateSize(for: parameters.targetView, from: aspect)
		}
		
	}
	
	func evaluated(from parameters: SequentialFrameCalculationParameters) -> [Size] {
		
		switch self {
		case .constant(let value):
			return parameters.targetViews.map({ _ in value })
			
		case .byParent(let calculation):
			return parameters.targetViews.map({ _ in calculation(parameters.guides) })
			
		case .fits(let fittingSize):
			return parameters.targetViews.map({ $0.sizeThatFits(fittingSize) })
			
		case .aspect(let aspect):
			return parameters.targetViews.map({ parameters.guides.evaluateSize(for: $0, from: aspect) })
		}
		
	}
	
}

extension LayoutElement.Rect {
	
	func evaluated(from parameters: IndividualFrameCalculationParameters) -> Rect {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calculation):
			return calculation(parameters.guides)
		}
		
	}
	
}

extension LayoutElement.Insets {
	
	func evaluated(from parameters: SequentialFrameCalculationParameters, totalWidth: Float, viewWidths: [Float]) -> Float {
		
		switch self {
		case .constant(let value):
			return value
			
		case .byParent(let calculation):
			return calculation(parameters.guides)
			
		case .equalsToMargin:
			return (totalWidth - viewWidths.reduce(0, (+))) / Float(viewWidths.count + 1)
		}
		
	}
	
}
