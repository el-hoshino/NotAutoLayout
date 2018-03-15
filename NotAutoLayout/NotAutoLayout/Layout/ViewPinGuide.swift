//
//  ViewPinGuide.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/03/15.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension ViewPinGuides {
	
	public struct HorizontalGuide {
		
		let uiLayoutDirection: UIUserInterfaceLayoutDirection
		let span: Span
		
		static let empty: ViewPinGuides.HorizontalGuide = .init(uiLayoutDirection: .leftToRight,
																span: .zero)
		
	}
	
	public struct VerticalGuide {
		
		let span: Span
		
		static let empty: ViewPinGuides.VerticalGuide = .init(span: .zero)
		
	}
	
	public struct PointGuide {
		
		let uiLayoutDirection: UIUserInterfaceLayoutDirection
		let rect: Rect
		
		static let empty: ViewPinGuides.PointGuide = .init(uiLayoutDirection: .leftToRight,
														   rect: .zero)
		
	}
	
}

// MARK: - HorizontalGuide
extension ViewPinGuides.HorizontalGuide: HorizontalPinGuideRepresentable {
	
	public var pinGuide: ViewPinGuides.HorizontalGuide {
		return self
	}
	
}

extension ViewPinGuides.HorizontalGuide {
	
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

extension ViewPinGuides.HorizontalGuide {
	
	public var leading: CGFloat {
		switch self.uiLayoutDirection {
		case .leftToRight:
			return self.left
			
		case .rightToLeft:
			return self.right
		}
	}
	
	public var trailing: CGFloat {
		switch self.uiLayoutDirection {
		case .leftToRight:
			return self.right
			
		case .rightToLeft:
			return self.left
		}
	}
	
}

// MARK: - VerticalGuide
extension ViewPinGuides.VerticalGuide: VerticalPinGuideRepresentable {
	
	public var pinGuide: ViewPinGuides.VerticalGuide {
		return self
	}
	
}

extension ViewPinGuides.VerticalGuide {
	
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
extension ViewPinGuides.PointGuide: PointPinGuideRepresentable {
	
	public var pinGuide: ViewPinGuides.PointGuide {
		return self
	}
	
}

extension ViewPinGuides.PointGuide {
	
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
		switch self.uiLayoutDirection {
		case .leftToRight:
			return self.topLeft
			
		case .rightToLeft:
			return self.topRight
		}
	}
	
	public var topTrailing: CGPoint {
		switch self.uiLayoutDirection {
		case .leftToRight:
			return self.topRight
			
		case .rightToLeft:
			return self.topLeft
		}
	}
	
	public var midddleLeading: CGPoint {
		switch self.uiLayoutDirection {
		case .leftToRight:
			return self.middleLeft
			
		case .rightToLeft:
			return self.middleRight
		}
	}
	
	public var middleTrailing: CGPoint {
		switch self.uiLayoutDirection {
		case .leftToRight:
			return self.middleRight
			
		case .rightToLeft:
			return self.middleLeft
		}
	}
	
	public var bottomLeading: CGPoint {
		switch self.uiLayoutDirection {
		case .leftToRight:
			return self.bottomLeft
			
		case .rightToLeft:
			return self.bottomRight
		}
	}
	
	public var bottomTrailing: CGPoint {
		switch self.uiLayoutDirection {
		case .leftToRight:
			return self.bottomRight
			
		case .rightToLeft:
			return self.bottomLeft
		}
	}
	
}
