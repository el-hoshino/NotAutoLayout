//
//  ViewPinGuides.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/12/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

// MARK: - Declarations -
public struct ViewPinGuides {
	
	public struct Horizontal {
		
		private(set) weak var parentView: UIView?
		private(set) var referenceViewGetter: () -> UIView?
		
		init(parentView: UIView?, referenceView: UIView?) {
			self.parentView = parentView
			self.referenceViewGetter = { [weak referenceView] in referenceView }
		}
		
		init(parentView: UIView?, referenceViewGetter: @escaping () -> UIView?) {
			self.parentView = parentView
			self.referenceViewGetter = referenceViewGetter
		}
		
	}
	
	public struct Vertical {
		
		private(set) weak var parentView: UIView?
		private(set) var referenceViewGetter: () -> UIView?
		
		init(parentView: UIView?, referenceView: UIView?) {
			self.parentView = parentView
			self.referenceViewGetter = { [weak referenceView] in referenceView }
		}
		
		init(parentView: UIView?, referenceViewGetter: @escaping () -> UIView?) {
			self.parentView = parentView
			self.referenceViewGetter = referenceViewGetter
		}
		
	}
	
	public struct Point {
		
		private(set) weak var parentView: UIView?
		private(set) var referenceViewGetter: () -> UIView?
		
		init(parentView: UIView?, referenceView: UIView?) {
			self.parentView = parentView
			self.referenceViewGetter = { [weak referenceView] in referenceView }
		}
		
		init(parentView: UIView?, referenceViewGetter: @escaping () -> UIView?) {
			self.parentView = parentView
			self.referenceViewGetter = referenceViewGetter
		}
		
	}
	
}

// MARK: - Implementations -
// MARK: - Horizontal
extension ViewPinGuides.Horizontal {
	
	var referenceView: UIView? {
		return self.referenceViewGetter()
	}
	
}

extension ViewPinGuides.Horizontal {
	
	private func makeGuide(directionGetter: @escaping () -> UIUserInterfaceLayoutDirection?, rect: Rect?) -> Guide {
		
		guard let rect = rect else {
			return .empty
		}
		
		let guide = Guide(directionGetter: directionGetter, span: rect.horizontalSpan)
		
		return guide
		
	}
	
}

extension ViewPinGuides.Horizontal {
	
	public var frameGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection },
							  rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: false))
	}
	
	public var identityFrameGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection },
							  rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: true))
	}
	
	public var layoutMarginsGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection },
							  rect: self.referenceView?.layoutMarginsFrame(in: self.parentView))
	}
	
	public var readableGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection },
							  rect: self.referenceView?.readableFrame(in: self.parentView))
	}
	
	public var safeAreaGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection },
							  rect: self.referenceView?.safeAreaFrame(in: self.parentView))
	}
	
}

extension ViewPinGuides.Horizontal: HorizontalPinGuideRepresentable {
	
	private var pinGuide: ViewPinGuides.Horizontal.Guide {
		return self.frameGuide
	}
	
	public var direction: UIUserInterfaceLayoutDirection {
		return self.pinGuide.direction
	}
	
	public var left: Float {
		return self.pinGuide.left
	}
	
	public var center: Float {
		return self.pinGuide.center
	}
	
	public var right: Float {
		return self.pinGuide.right
	}
	
	public func horizontal(at coordinatePosition: Float) -> Float {
		return self.pinGuide.horizontal(at: coordinatePosition)
	}
	
	public var leading: Float {
		return self.pinGuide.leading
	}
	
	public var trailing: Float {
		return self.pinGuide.trailing
	}
	
}

// MARK: - Vertical
extension ViewPinGuides.Vertical {
	
	var referenceView: UIView? {
		return self.referenceViewGetter()
	}
	
}

extension ViewPinGuides.Vertical {
	
	private func makeGuide(rect: Rect?) -> Guide {
		
		guard let rect = rect else {
			return .empty
		}
		
		let guide = Guide.init(span: rect.verticalSpan)
		
		return guide
		
	}
	
}

extension ViewPinGuides.Vertical {
	
	public var frameGuide: Guide {
		return self.makeGuide(rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: false))
	}
	
	public var identityFrameGuide: Guide {
		return self.makeGuide(rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: true))
	}
	
	public var layoutMarginsGuide: Guide {
		return self.makeGuide(rect: self.referenceView?.layoutMarginsFrame(in: self.parentView))
	}
	
	public var readableGuide: Guide {
		return self.makeGuide(rect: self.referenceView?.readableFrame(in: self.parentView))
	}
	
	public var safeAreaGuide: Guide {
		return self.makeGuide(rect: self.referenceView?.safeAreaFrame(in: self.parentView))
	}
	
}

extension ViewPinGuides.Vertical: VerticalPinGuideRepresentable {
	
	private var pinGuide: ViewPinGuides.Vertical.Guide {
		return self.frameGuide
	}
	
	public var top: Float {
		return self.pinGuide.top
	}
	
	public var middle: Float {
		return self.pinGuide.middle
	}
	
	public var bottom: Float {
		return self.pinGuide.bottom
	}
	
	public func vertical(at coordinatePosition: Float) -> Float {
		return self.pinGuide.vertical(at: coordinatePosition)
	}
	
}

// MARK: - Point
extension ViewPinGuides.Point {
	
	var referenceView: UIView? {
		return self.referenceViewGetter()
	}
	
}

extension ViewPinGuides.Point {
	
	private func makeGuide(directionGetter: @escaping () -> UIUserInterfaceLayoutDirection?, rect: Rect?) -> Guide {
		
		guard let rect = rect else {
			return .empty
		}
		
		let guide = Guide(directionGetter: directionGetter, rect: rect)
		
		return guide
		
	}
	
}

extension ViewPinGuides.Point {
	
	public var frameGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection },
							  rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: false))
	}
	
	public var identityFrameGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection },
							  rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: true))
	}
	
	public var layoutMarginsGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection },
							  rect: self.referenceView?.layoutMarginsFrame(in: self.parentView))
	}
	
	public var readableGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection },
							  rect: self.referenceView?.readableFrame(in: self.parentView))
	}
	
	public var safeAreaGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection },
							  rect: self.referenceView?.safeAreaFrame(in: self.parentView))
	}
	
}

extension ViewPinGuides.Point: PointPinGuideRepresentable {
	
	private var pinGuide: ViewPinGuides.Point.Guide {
		return self.frameGuide
	}
	
	public var direction: UIUserInterfaceLayoutDirection {
		return self.pinGuide.direction
	}
	
	public var topLeft: Point {
		return self.pinGuide.topLeft
	}
	
	public var topCenter: Point {
		return self.pinGuide.topCenter
	}
	
	public var topRight: Point {
		return self.pinGuide.topRight
	}
	
	public var middleLeft: Point {
		return self.pinGuide.middleLeft
	}
	
	public var middleCenter: Point {
		return self.pinGuide.middleCenter
	}
	
	public var middleRight: Point {
		return self.pinGuide.middleRight
	}
	
	public var bottomLeft: Point {
		return self.pinGuide.bottomLeft
	}
	
	public var bottomCenter: Point {
		return self.pinGuide.bottomCenter
	}
	
	public var bottomRight: Point {
		return self.pinGuide.bottomRight
	}
	
	public func point(at coordinatePoint: Point) -> Point {
		return self.pinGuide.point(at: coordinatePoint)
	}
	
	public func pointAt(x coordinateX: Float, y coordinateY: Float) -> Point {
		return self.pinGuide.pointAt(x: coordinateX, y: coordinateY)
	}
	
	public var topLeading: Point {
		return self.pinGuide.topLeading
	}
	
	public var topTrailing: Point {
		return self.pinGuide.topTrailing
	}
	
	public var midddleLeading: Point {
		return self.pinGuide.midddleLeading
	}
	
	public var middleTrailing: Point {
		return self.pinGuide.middleTrailing
	}
	
	public var bottomLeading: Point {
		return self.pinGuide.bottomLeading
	}
	
	public var bottomTrailing: Point {
		return self.pinGuide.bottomTrailing
	}
	
}
