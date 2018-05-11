//
//  ViewPinGuide.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/03/15.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

// MARK: - HorizontalFloatGuide
extension ViewPinGuides.HorizontalFloat {
	
	public struct Guide {
		
		let directionGetter: () -> UIUserInterfaceLayoutDirection?
		let span: Span
		
		static let empty: ViewPinGuides.HorizontalFloat.Guide = .init(directionGetter: { nil },
																	  span: .zero)
		
	}
	
}

extension ViewPinGuides.HorizontalFloat.Guide: HorizontalFloatPinGuideRepresentable {
	
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
	
	public func directionalHorizontal(at coordinatePosition: Float) -> Float {
		switch self.direction {
		case .leftToRight:
			return self.horizontal(at: coordinatePosition)
			
		case .rightToLeft:
			return self.horizontal(at: 1 - coordinatePosition)
		}
	}
	
}

// MARK: - VerticalFloatGuide
extension ViewPinGuides.VerticalFloat {
	
	public struct Guide {
		
		let span: Span
		
		static let empty: ViewPinGuides.VerticalFloat.Guide = .init(span: .zero)
		
	}
	
}

extension ViewPinGuides.VerticalFloat.Guide: VerticalFloatPinGuideRepresentable {
	
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

// MARK: - HorizontalSpanGuide
extension ViewPinGuides.HorizontalSpan {
	
	public struct Guide {
		
		let directionGetter: () -> UIUserInterfaceLayoutDirection?
		let originalSpan: Span
		
		static let empty: ViewPinGuides.HorizontalSpan.Guide = .init(directionGetter: { nil },
																	 originalSpan: .zero)
		
	}
	
}

extension ViewPinGuides.HorizontalSpan.Guide: HorizontalSpanPinGuideRepresentable {
	
	public var direction: UIUserInterfaceLayoutDirection {
		return self.directionGetter() ?? .leftToRight
	}
	
	public var fromLeftToCenter: Span {
		return self.originalSpan.startToHalf
	}
	
	public var fromLeftToRight: Span {
		return self.originalSpan
	}
	
	public var fromCenterToLeft: Span {
		return self.originalSpan.halfToStart
	}
	
	public var fromCenterToRight: Span {
		return self.originalSpan.halfToEnd
	}
	
	public var fromRightToLeft: Span {
		return self.originalSpan.endToStart
	}
	
	public var fromRightToCenter: Span {
		return self.originalSpan.endToHalf
	}
	
	public func horizontal(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span {
		return self.originalSpan.geometry(from: coordinatePositionA, to: coordinatePositionB)
	}
	
	public var fromLeadingToCenter: Span {
		switch self.direction {
		case .leftToRight:
			return self.fromLeftToCenter
			
		case .rightToLeft:
			return self.fromRightToCenter
		}
	}
	
	public var fromLeadingToTrailing: Span {
		switch self.direction {
		case .leftToRight:
			return self.fromLeftToRight
			
		case .rightToLeft:
			return self.fromRightToLeft
		}
	}
	
	public var fromCenterToLeading: Span {
		switch self.direction {
		case .leftToRight:
			return self.fromCenterToLeft
			
		case .rightToLeft:
			return self.fromCenterToRight
		}
	}
	
	public var fromCenterToTrailing: Span {
		switch self.direction {
		case .leftToRight:
			return self.fromCenterToRight
			
		case .rightToLeft:
			return self.fromCenterToLeft
		}
	}
	
	public var fromTrailingToCenter: Span {
		switch self.direction {
		case .leftToRight:
			return self.fromRightToCenter
			
		case .rightToLeft:
			return self.fromLeftToCenter
		}
	}
	
	public var fromTrailingToLeading: Span {
		switch self.direction {
		case .leftToRight:
			return self.fromRightToLeft
			
		case .rightToLeft:
			return self.fromLeftToRight
		}
	}
	
	public func directionalHorizontal(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span {
		switch self.direction {
		case .leftToRight:
			return self.horizontal(from: coordinatePositionA, to: coordinatePositionB)
			
		case .rightToLeft:
			return self.horizontal(from: 1 - coordinatePositionA, to: 1 - coordinatePositionB)
		}
	}
	
}

// MARK: - VerticalSpanGuide
extension ViewPinGuides.VerticalSpan {
	
	public struct Guide {
		
		let originalSpan: Span
		
		static let empty: ViewPinGuides.VerticalSpan.Guide = .init(originalSpan: .zero)
		
	}
	
}

extension ViewPinGuides.VerticalSpan.Guide: VerticalSpanPinGuideRepresentable {
	
	public var fromTopToMiddle: Span {
		return self.originalSpan.startToHalf
	}
	
	public var fromTopToBottom: Span {
		return self.originalSpan
	}
	
	public var fromMiddleToTop: Span {
		return self.originalSpan.halfToStart
	}
	
	public var fromMiddleToBottom: Span {
		return self.originalSpan.halfToEnd
	}
	
	public var fromBottomToTop: Span {
		return self.originalSpan.endToStart
	}
	
	public var fromBottomToMiddle: Span {
		return self.originalSpan.endToHalf
	}
	
	public func vertical(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span {
		return self.originalSpan.geometry(from: coordinatePositionA, to: coordinatePositionB)
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
		return self.rect.pointGeometryAt(x: coordinateX, y: coordinateX)
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
