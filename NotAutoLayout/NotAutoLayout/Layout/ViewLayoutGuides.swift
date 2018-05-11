//
//  ViewLayoutGuides.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/13.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct ViewLayoutGuides {
	
	private(set) weak var parentView: UIView?
	
	init(parentView: UIView) {
		
		self.parentView = parentView
		
	}
	
}

extension ViewLayoutGuides {
	
	private func makeGuide(directionGetter: @escaping () -> UIUserInterfaceLayoutDirection?, rect: Rect?) -> Guide {
		
		guard let rect = rect else {
			return .empty
		}
		
		let guide = Guide(directionGetter: directionGetter, rect: rect)
		
		return guide
		
	}
	
}

extension ViewLayoutGuides {
	
	public var boundsGuide: Guide {
		return self.makeGuide(directionGetter: { [weak parentView] in parentView?.currentDirection }, rect: self.parentView?.boundsRect)
	}
	
	public var layoutMarginsGuide: Guide {
		return self.makeGuide(directionGetter: { [weak parentView] in parentView?.currentDirection }, rect: self.parentView?.layoutMarginsRect)
	}
	
	public var readableGuide: Guide {
		return self.makeGuide(directionGetter: { [weak parentView] in parentView?.currentDirection }, rect: self.parentView?.readableRect)
	}
	
	@available(iOS 11.0, *)
	public var safeAreaGuide: Guide {
		return self.makeGuide(directionGetter: { [weak parentView] in parentView?.currentDirection }, rect: self.parentView?.safeAreaRect)
	}
	
}

extension ViewLayoutGuides {
	
	public var layoutMargins: Insets {
		return (self.parentView?.layoutMargins).map({ Insets($0) }) ?? .zero
	}
	
	@available(iOS 11.0, *)
	public var safeAreaInsets: Insets {
		return (self.parentView?.safeAreaInsets).map({ Insets($0) }) ?? .zero
	}
	
}

extension ViewLayoutGuides {
	
	func size(for view: UIView, thatFits fittingSize: Size) -> Size {
		
		let fittedSize = view.sizeThatFits(fittingSize)
		
		return fittedSize
		
	}
	
}

extension ViewLayoutGuides {
	
	func evaluateSize(from calculation: (ViewLayoutGuides) -> Size) -> Size {
		
		return calculation(self)
		
	}
	
	func evaluateSize(for view: UIView, from aspect: LayoutElement.Size.AspectSizing) -> Size {
		
		let canvasSize = { (safeAreaOnly: Bool) -> Size in
			switch safeAreaOnly {
			case true:
				if #available(iOS 11.0, *) {
					return self.safeAreaGuide.size
				} else {
					fallthrough
				}
				
			case false:
				return self.boundsGuide.size
			}
		}(aspect.safeAreaOnly)
		
		let targetRatio = aspect.ratio ?? { (targetView: UIView?) in
			return targetView?.sizeThatFits(.zero).ratio
			}(view) ?? 1
		
		guard targetRatio.isNaN == false,
			canvasSize.ratio.isNaN == false
			else {
				return canvasSize
		}
		
		switch aspect {
		case .fit, .safeAreaFit:
			return Size.aspectFitSize(in: canvasSize, with: targetRatio)
			
		case .fill, .safeAreaFill:
			return Size.aspectFillSize(in: canvasSize, with: targetRatio)
		}
		
	}
	
}

extension ViewLayoutGuides: LayoutGuideRepresentable {
	
	private var layoutGuide: Guide {
		return self.boundsGuide
	}
	
	public var direction: UIUserInterfaceLayoutDirection {
		return self.layoutGuide.direction
	}
	
	// MARK: - Horizontal Float
	
	public var left: Float {
		return self.layoutGuide.left
	}
	
	public var center: Float {
		return self.layoutGuide.center
	}
	
	public var right: Float {
		return self.layoutGuide.right
	}
	
	public var leading: Float {
		return self.layoutGuide.leading
	}
	
	public var trailing: Float {
		return self.layoutGuide.trailing
	}
	
	public func horizontal(at coordinatePosition: Float) -> Float {
		return self.layoutGuide.horizontal(at: coordinatePosition)
	}
	
	public func directionalHorizontal(at coordinatePosition: Float) -> Float {
		return self.layoutGuide.directionalHorizontal(at: coordinatePosition)
	}
	
	// MARK: - Vertical Float
	
	public var top: Float {
		return self.layoutGuide.top
	}
	
	public var middle: Float {
		return self.layoutGuide.middle
	}
	
	public var bottom: Float {
		return self.layoutGuide.bottom
	}
	
	public func vertical(at coordinatePosition: Float) -> Float {
		return self.layoutGuide.vertical(at: coordinatePosition)
	}
	
	// MARK: - Horizontal Span
	
	public var fromLeftToCenter: Span {
		return self.layoutGuide.fromLeftToCenter
	}
	
	public var fromLeftToRight: Span {
		return self.layoutGuide.fromLeftToRight
	}
	
	public var fromCenterToLeft: Span {
		return self.layoutGuide.fromCenterToLeft
	}
	
	public var fromCenterToRight: Span {
		return self.layoutGuide.fromCenterToRight
	}
	
	public var fromRightToLeft: Span {
		return self.layoutGuide.fromRightToLeft
	}
	
	public var fromRightToCenter: Span {
		return self.layoutGuide.fromRightToCenter
	}
	
	public var fromLeadingToCenter: Span {
		return self.layoutGuide.fromLeftToCenter
	}
	
	public var fromLeadingToTrailing: Span {
		return self.layoutGuide.fromLeadingToTrailing
	}
	
	public var fromCenterToLeading: Span {
		return self.layoutGuide.fromCenterToLeading
	}
	
	public var fromCenterToTrailing: Span {
		return self.layoutGuide.fromCenterToTrailing
	}
	
	public var fromTrailingToLeading: Span {
		return self.layoutGuide.fromTrailingToLeading
	}
	
	public var fromTrailingToCenter: Span {
		return self.layoutGuide.fromTrailingToCenter
	}
	
	public func horizontal(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span {
		return self.layoutGuide.horizontal(from: coordinatePositionA, to: coordinatePositionB)
	}
	
	public func directionalHorizontal(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span {
		return self.layoutGuide.directionalHorizontal(from: coordinatePositionA, to: coordinatePositionB)
	}
	
	// MARK: - Vertical Span
	
	public var fromTopToMiddle: Span {
		return self.layoutGuide.fromTopToMiddle
	}
	
	public var fromTopToBottom: Span {
		return self.layoutGuide.fromTopToBottom
	}
	
	public var fromMiddleToTop: Span {
		return self.layoutGuide.fromMiddleToTop
	}
	
	public var fromMiddleToBottom: Span {
		return self.layoutGuide.fromMiddleToBottom
	}
	
	public var fromBottomToTop: Span {
		return self.layoutGuide.fromBottomToTop
	}
	
	public var fromBottomToMiddle: Span {
		return self.layoutGuide.fromBottomToMiddle
	}
	
	public func vertical(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span {
		return self.layoutGuide.vertical(from: coordinatePositionA, to: coordinatePositionB)
	}
	
	// MARK: - Point
	
	public var topLeft: Point {
		return self.layoutGuide.topLeft
	}
	
	public var topCenter: Point {
		return self.layoutGuide.topCenter
	}
	
	public var topRight: Point {
		return self.layoutGuide.topRight
	}
	
	public var middleLeft: Point {
		return self.layoutGuide.middleLeft
	}
	
	public var middleCenter: Point {
		return self.layoutGuide.middleCenter
	}
	
	public var middleRight: Point {
		return self.layoutGuide.middleRight
	}
	
	public var bottomLeft: Point {
		return self.layoutGuide.bottomLeft
	}
	
	public var bottomCenter: Point {
		return self.layoutGuide.bottomCenter
	}
	
	public var bottomRight: Point {
		return self.layoutGuide.bottomRight
	}
	
	public var topLeading: Point {
		return self.layoutGuide.topLeading
	}
	
	public var topTrailing: Point {
		return self.layoutGuide.topTrailing
	}
	
	public var midddleLeading: Point {
		return self.layoutGuide.midddleLeading
	}
	
	public var middleTrailing: Point {
		return self.layoutGuide.middleTrailing
	}
	
	public var bottomLeading: Point {
		return self.layoutGuide.bottomLeading
	}
	
	public var bottomTrailing: Point {
		return self.layoutGuide.bottomTrailing
	}
	
	public func point(at coordinatePoint: Point) -> Point {
		return self.layoutGuide.point(at: coordinatePoint)
	}
	
	public func directionalPoint(at coordinatePoint: Point) -> Point {
		return self.layoutGuide.directionalPoint(at: coordinatePoint)
	}
	
	// MARK: - Length
	
	public var width: Float {
		return self.layoutGuide.width
	}
	
	public var height: Float {
		return self.layoutGuide.height
	}
	
	// MARK: - Size
	
	public var size: Size {
		return self.layoutGuide.size
	}
	
	// MARK: - Rect
	
	public var frame: Rect {
		return self.layoutGuide.frame
	}
	
	public func frame(inside insets: Insets) -> Rect {
		return self.layoutGuide.frame(inside: insets)
	}
	
}
