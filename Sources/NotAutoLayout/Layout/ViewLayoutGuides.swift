//
//  ViewLayoutGuides.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/13.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public struct ViewLayoutGuides {
	
	private(set) weak var parentView: UIView?
	
	init(parentView: UIView) {
		
		self.parentView = parentView
		
	}
	
}

extension ViewLayoutGuides {
	
	private func makeGuide(direction: UIUserInterfaceLayoutDirection?, rect: Rect?) -> Guide {
		
		guard let direction = direction, let rect = rect else {
			return .empty
		}
		
		let guide = Guide(direction: direction, rect: rect)
		
		return guide
		
	}
	
}

extension ViewLayoutGuides: LayoutGuideRepresentable {
	
	private var layoutGuide: Guide {
		return self.boundsGuide
	}
	
	public var direction: UIUserInterfaceLayoutDirection {
		return self.layoutGuide.direction
	}
	
	public var left: Float {
		return self.layoutGuide.left
	}
	
	public var center: Float {
		return self.layoutGuide.center
	}
	
	public var right: Float {
		return self.layoutGuide.right
	}
	
	public var width: Float {
		return self.layoutGuide.width
	}
	
	public func horizontal(at coordinatePosition: Float) -> Float {
		return self.layoutGuide.horizontal(at: coordinatePosition)
	}
	
	public var top: Float {
		return self.layoutGuide.top
	}
	
	public var middle: Float {
		return self.layoutGuide.middle
	}
	
	public var bottom: Float {
		return self.layoutGuide.bottom
	}
	
	public var height: Float {
		return self.layoutGuide.height
	}
	
	public func vertical(at coordinatePosition: Float) -> Float {
		return self.layoutGuide.vertical(at: coordinatePosition)
	}
	
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
	
	public var size: Size {
		return self.layoutGuide.size
	}
	
	public func point(at coordinatePoint: Point) -> Point {
		return self.layoutGuide.point(at: coordinatePoint)
	}
	
	public var frame: Rect {
		return self.layoutGuide.frame
	}
	
	public func frame(inside insets: Insets) -> Rect {
		return self.layoutGuide.frame(inside: insets)
	}
	
	public var leading: Float {
		return self.layoutGuide.leading
	}
	
	public var trailing: Float {
		return self.layoutGuide.trailing
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
	
}

extension ViewLayoutGuides {
	
	public var boundsGuide: Guide {
		return self.makeGuide(direction: self.parentView?.currentDirection, rect: self.parentView?.boundsRect)
	}
	
	public var layoutMarginsGuide: Guide {
		return self.makeGuide(direction: self.parentView?.currentDirection, rect: self.parentView?.layoutMarginsRect)
	}
	
	public var readableGuide: Guide {
		return self.makeGuide(direction: self.parentView?.currentDirection, rect: self.parentView?.readableRect)
	}
	
	public var safeAreaGuide: Guide {
		return self.makeGuide(direction: self.parentView?.currentDirection, rect: self.parentView?.safeAreaRect)
	}
	
}

extension ViewLayoutGuides {
	
	public func makeGuide(from rect: Rect) -> LayoutGuideRepresentable {
		
		guard let parentView = self.parentView else {
			return self.makeGuide(direction: nil, rect: nil)
		}
		
		return self.makeGuide(direction: parentView.currentDirection, rect: rect)
		
	}
	
	public func makeGuide(from insets: Insets) -> LayoutGuideRepresentable {
		
		guard let parentView = self.parentView else {
			return self.makeGuide(direction: nil, rect: nil)
		}
		
		let bounds = parentView.boundsRect
		let rect = bounds.rect(inside: insets)
		
		return self.makeGuide(direction: parentView.currentDirection, rect: rect)
		
	}
	
	public func makeGuide(by transform: (Rect) -> Rect) -> LayoutGuideRepresentable {
		
		guard let parentView = self.parentView else {
			return self.makeGuide(direction: nil, rect: nil)
		}
		
		let bounds = parentView.boundsRect
		let rect = transform(bounds)
		
		return self.makeGuide(direction: parentView.currentDirection, rect: rect)
		
	}
	
}

extension ViewLayoutGuides {
	
	public var layoutMargins: Insets {
		return (self.parentView?.layoutMargins).map({ Insets($0) }) ?? .zero
	}
	
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
		
		let canvasSize = aspect.layougGuide(in: self).size
		
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
