//
//  ViewLayoutGuide.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/15.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension ViewLayoutGuides {
	
	public struct Guide {
		
		let directionGetter: () -> UIUserInterfaceLayoutDirection?
		let rect: Rect
		
		static let empty: ViewLayoutGuides.Guide = .init(directionGetter: { nil },
														 rect: .zero)
		
	}
	
}

extension ViewLayoutGuides.Guide: LayoutGuideRepresentable {
	
	public var direction: UIUserInterfaceLayoutDirection {
		return self.directionGetter() ?? .leftToRight
	}
	
	// MARK: - Horizontal Float
	
	public var left: Float {
		return self.rect.left
	}
	
	public var center: Float {
		return self.rect.center
	}
	
	public var right: Float {
		return self.rect.right
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
	
	public func horizontal(at coordinatePosition: Float) -> Float {
		return self.rect.xSpan.geometry(at: coordinatePosition)
	}
	
	public func directionalHorizontal(at coordinatePosition: Float) -> Float {
		switch self.direction {
		case .leftToRight:
			return self.horizontal(at: coordinatePosition)
			
		case .rightToLeft:
			return self.horizontal(at: 1 - coordinatePosition)
		}
	}
	
	// MARK: - Vertical Float
	
	public var top: Float {
		return self.rect.top
	}
	
	public var middle: Float {
		return self.rect.middle
	}
	
	public var bottom: Float {
		return self.rect.bottom
	}
	
	public func vertical(at coordinatePosition: Float) -> Float {
		return self.rect.ySpan.geometry(at: coordinatePosition)
	}
	
	// MARK: - Horizontal Span
	
	public var fromLeftToCenter: Span {
		return self.rect.xSpan.startToHalf
	}
	
	public var fromLeftToRight: Span {
		return self.rect.xSpan
	}
	
	public var fromCenterToLeft: Span {
		return self.rect.xSpan.halfToStart
	}
	
	public var fromCenterToRight: Span {
		return self.rect.xSpan.halfToEnd
	}
	
	public var fromRightToLeft: Span {
		return self.rect.xSpan.endToStart
	}
	
	public var fromRightToCenter: Span {
		return self.rect.xSpan.endToHalf
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
	
	public var fromTrailingToLeading: Span {
		switch self.direction {
		case .leftToRight:
			return self.fromRightToLeft
			
		case .rightToLeft:
			return self.fromLeftToRight
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
	
	public func horizontal(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span {
		return self.rect.xSpan.geometry(from: coordinatePositionA, to: coordinatePositionB)
	}
	
	public func directionalHorizontal(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span {
		switch self.direction {
		case .leftToRight:
			return self.horizontal(from: coordinatePositionA, to: coordinatePositionB)
			
		case .rightToLeft:
			return self.horizontal(from: 1 - coordinatePositionB, to: 1 - coordinatePositionA)
		}
	}
	
	// MARK: - Vertical Span
	
	public var fromTopToMiddle: Span {
		return self.rect.ySpan.startToHalf
	}
	
	public var fromTopToBottom: Span {
		return self.rect.ySpan
	}
	
	public var fromMiddleToTop: Span {
		return self.rect.ySpan.halfToStart
	}
	
	public var fromMiddleToBottom: Span {
		return self.rect.ySpan.halfToEnd
	}
	
	public var fromBottomToTop: Span {
		return self.rect.ySpan.endToStart
	}
	
	public var fromBottomToMiddle: Span {
		return self.rect.ySpan.endToHalf
	}
	
	public func vertical(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span {
		return self.rect.ySpan.geometry(from: coordinatePositionA, to: coordinatePositionB)
	}
	
	// MARK: - Point
	
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
	
	public func point(at coordinatePoint: Point) -> Point {
		return self.rect.pointGeometry(at: coordinatePoint)
	}
	
	public func directionalPoint(at coordinatePoint: Point) -> Point {
		switch self.direction {
		case .leftToRight:
			return self.directionalPoint(at: coordinatePoint)
			
		case .rightToLeft:
			return self.directionalPoint(at: Point(x: 1 - coordinatePoint.x, y: coordinatePoint.y))
		}
	}
	
	// MARK: - Length
	
	public var width: Float {
		return self.rect.width
	}
	
	public var height: Float {
		return self.rect.height
	}
	
	// MARK: - Size
	
	public var size: Size {
		return self.rect.size
	}
	
	// MARK: - Rect
	
	public var frame: Rect {
		return self.rect
	}
	
	public func frame(inside insets: Insets) -> Rect {
		return self.rect.rect(inside: insets)
	}
	
}
