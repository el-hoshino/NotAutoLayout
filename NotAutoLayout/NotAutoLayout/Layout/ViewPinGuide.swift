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

extension ViewPinGuides.Horizontal.Guide: HorizontalPinGuideRepresentable {
	
	public var direction: UIUserInterfaceLayoutDirection {
		return self.directionGetter() ?? .leftToRight
	}
	
	public var left: Float {
		return self.span.start
	}
	
	public var center: Float {
		return self.span.half
	}
	
	public var right: Float {
		return self.span.end
	}
	
	public func horizontal(at coordinatePosition: Float) -> Float {
		return self.span.geometry(at: coordinatePosition)
	}
	
	public var leading: Float {
		switch self.direction {
		case .leftToRight:
			return self.left
			
		case .rightToLeft:
			return self.right
		}
	}
	
	public var trailing: Float {
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
	
	public var top: Float {
		return self.span.start
	}
	
	public var middle: Float {
		return self.span.half
	}
	
	public var bottom: Float {
		return self.span.end
	}
	
	public func vertical(at coordinatePosition: Float) -> Float {
		return self.span.geometry(at: coordinatePosition)
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

extension ViewPinGuides.Point.Guide: PointPinGuideRepresentable {
	
	public var direction: UIUserInterfaceLayoutDirection {
		return self.directionGetter() ?? .leftToRight
	}
	
	public var topLeft: Point {
		return self.rect.topLeft
	}
	
	public var topCenter: Point {
		return self.rect.topCenter
	}
	
	public var topRight: Point {
		return self.rect.topRight
	}
	
	public var middleLeft: Point {
		return self.rect.middleLeft
	}
	
	public var middleCenter: Point {
		return self.rect.middleCenter
	}
	
	public var middleRight: Point {
		return self.rect.middleRight
	}
	
	public var bottomLeft: Point {
		return self.rect.bottomLeft
	}
	
	public var bottomCenter: Point {
		return self.rect.bottomCenter
	}
	
	public var bottomRight: Point {
		return self.rect.bottomRight
	}
	
	public func point(at coordinatePoint: Point) -> Point {
		return self.rect.pointGeometry(at: coordinatePoint)
	}
	
	public func pointAt(x coordinateX: Float, y coordinateY: Float) -> Point {
		return self.rect.pointGeometryAt(x: coordinateX, y: coordinateY)
	}
	
	public var topLeading: Point {
		switch self.direction {
		case .leftToRight:
			return self.topLeft
			
		case .rightToLeft:
			return self.topRight
		}
	}
	
	public var topTrailing: Point {
		switch self.direction {
		case .leftToRight:
			return self.topRight
			
		case .rightToLeft:
			return self.topLeft
		}
	}
	
	public var midddleLeading: Point {
		switch self.direction {
		case .leftToRight:
			return self.middleLeft
			
		case .rightToLeft:
			return self.middleRight
		}
	}
	
	public var middleTrailing: Point {
		switch self.direction {
		case .leftToRight:
			return self.middleRight
			
		case .rightToLeft:
			return self.middleLeft
		}
	}
	
	public var bottomLeading: Point {
		switch self.direction {
		case .leftToRight:
			return self.bottomLeft
			
		case .rightToLeft:
			return self.bottomRight
		}
	}
	
	public var bottomTrailing: Point {
		switch self.direction {
		case .leftToRight:
			return self.bottomRight
			
		case .rightToLeft:
			return self.bottomLeft
		}
	}
	
}
