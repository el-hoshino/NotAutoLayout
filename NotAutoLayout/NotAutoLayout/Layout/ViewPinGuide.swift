//
//  ViewPinGuide.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/03/15.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

// MARK: - HorizontalGuide
extension ViewPinGuides.Horizontal {
	
	public struct Guide {
		
		let directionGetter: () -> UIUserInterfaceLayoutDirection?
		let span: Span
		
		static let empty: ViewPinGuides.Horizontal.Guide = .init(directionGetter: { nil },
																 span: .zero)
		
	}
	
}

extension ViewPinGuides.Horizontal.Guide {
	
	var direction: UIUserInterfaceLayoutDirection {
		return self.directionGetter() ?? .leftToRight
	}
	
}

extension ViewPinGuides.Horizontal.Guide: HorizontalPinGuideRepresentable {
	
	public var pinGuide: ViewPinGuides.Horizontal.Guide {
		return self
	}
	
}

extension ViewPinGuides.Horizontal.Guide {
	
	public var left: CGFloat {
		return self.span.start
	}
	
	public var center: CGFloat {
		return self.span.half
	}
	
	public var right: CGFloat {
		return self.span.end
	}
	
	public func horizontal(at relativePosition: CGFloat) -> CGFloat {
		return self.span.geometry(at: relativePosition)
	}
	
}

extension ViewPinGuides.Horizontal.Guide {
	
	public var leading: CGFloat {
		switch self.direction {
		case .leftToRight:
			return self.left
			
		case .rightToLeft:
			return self.right
		}
	}
	
	public var trailing: CGFloat {
		switch self.direction {
		case .leftToRight:
			return self.right
			
		case .rightToLeft:
			return self.left
		}
	}
	
}

// MARK: - VerticalGuide
extension ViewPinGuides.Vertical {
	
	public struct Guide {
		
		let span: Span
		
		static let empty: ViewPinGuides.Vertical.Guide = .init(span: .zero)
		
	}
	
}

extension ViewPinGuides.Vertical.Guide: VerticalPinGuideRepresentable {
	
	public var pinGuide: ViewPinGuides.Vertical.Guide {
		return self
	}
	
}

extension ViewPinGuides.Vertical.Guide {
	
	public var top: CGFloat {
		return self.span.start
	}
	
	public var middle: CGFloat {
		return self.span.half
	}
	
	public var bottom: CGFloat {
		return self.span.end
	}
	
	public func vertical(at relativePosition: CGFloat) -> CGFloat {
		return self.span.geometry(at: relativePosition)
	}
	
}

// MARK: - PointGuide
extension ViewPinGuides.Point {
	
	public struct Guide {
		
		let directionGetter: () -> UIUserInterfaceLayoutDirection?
		let rect: Rect
		
		static let empty: ViewPinGuides.Point.Guide = .init(directionGetter: { nil },
														   rect: .zero)
		
	}
	
}

extension ViewPinGuides.Point.Guide {
	
	var direction: UIUserInterfaceLayoutDirection {
		return self.directionGetter() ?? .leftToRight
	}
	
}

extension ViewPinGuides.Point.Guide: PointPinGuideRepresentable {
	
	public var pinGuide: ViewPinGuides.Point.Guide {
		return self
	}
	
}

extension ViewPinGuides.Point.Guide {
	
	public var topLeft: CGPoint {
		return self.rect.topLeft
	}
	
	public var topCenter: CGPoint {
		return self.rect.topCenter
	}
	
	public var topRight: CGPoint {
		return self.rect.topRight
	}
	
	public var middleLeft: CGPoint {
		return self.rect.middleLeft
	}
	
	public var middleCenter: CGPoint {
		return self.rect.middleCenter
	}
	
	public var middleRight: CGPoint {
		return self.rect.middleRight
	}
	
	public var bottomLeft: CGPoint {
		return self.rect.bottomLeft
	}
	
	public var bottomCenter: CGPoint {
		return self.rect.bottomCenter
	}
	
	public var bottomRight: CGPoint {
		return self.rect.bottomRight
	}
	
	public func point(at relativePosition: CGPoint) -> CGPoint {
		return self.rect.pointGeometry(at: relativePosition)
	}
	
	public func pointAt(x: CGFloat, y: CGFloat) -> CGPoint {
		return self.rect.pointGeometry(x:x, y:y)
	}
	
	public var topLeading: CGPoint {
		switch self.direction {
		case .leftToRight:
			return self.topLeft
			
		case .rightToLeft:
			return self.topRight
		}
	}
	
	public var topTrailing: CGPoint {
		switch self.direction {
		case .leftToRight:
			return self.topRight
			
		case .rightToLeft:
			return self.topLeft
		}
	}
	
	public var midddleLeading: CGPoint {
		switch self.direction {
		case .leftToRight:
			return self.middleLeft
			
		case .rightToLeft:
			return self.middleRight
		}
	}
	
	public var middleTrailing: CGPoint {
		switch self.direction {
		case .leftToRight:
			return self.middleRight
			
		case .rightToLeft:
			return self.middleLeft
		}
	}
	
	public var bottomLeading: CGPoint {
		switch self.direction {
		case .leftToRight:
			return self.bottomLeft
			
		case .rightToLeft:
			return self.bottomRight
		}
	}
	
	public var bottomTrailing: CGPoint {
		switch self.direction {
		case .leftToRight:
			return self.bottomRight
			
		case .rightToLeft:
			return self.bottomLeft
		}
	}
	
}
