//
//  ViewPinGuides.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/12/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct ViewPinGuides {
	
}

// MARK: - HorizontalFloat
extension ViewPinGuides {
	
	@available(*, renamed: "HorizontalFloat")
	typealias Horizontal = HorizontalFloat
	public struct HorizontalFloat {
		
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

extension ViewPinGuides.HorizontalFloat {
	
	var referenceView: UIView? {
		return self.referenceViewGetter()
	}
	
}

extension ViewPinGuides.HorizontalFloat {
	
	private func makeGuide(directionGetter: @escaping () -> UIUserInterfaceLayoutDirection?, rect: Rect?) -> Guide {
		
		guard let rect = rect else {
			return .empty
		}
		
		let guide = Guide(directionGetter: directionGetter, span: rect.horizontalSpan)
		
		return guide
		
	}
	
}

extension ViewPinGuides.HorizontalFloat {
	
	public var frameGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: false))
	}
	
	public var identityFrameGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: true))
	}
	
	public var layoutMarginsGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.layoutMarginsFrame(in: self.parentView))
	}
	
	public var readableGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.readableFrame(in: self.parentView))
	}
	
	@available(iOS 11.0, *)
	public var safeAreaGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.safeAreaFrame(in: self.parentView))
	}
	
}

extension ViewPinGuides.HorizontalFloat: HorizontalFloatPinGuideRepresentable {
	
	private var pinGuide: ViewPinGuides.HorizontalFloat.Guide {
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
	
	public func directionalHorizontal(at coordinatePosition: Float) -> Float {
		return self.pinGuide.directionalHorizontal(at: coordinatePosition)
	}
	
}

// MARK: - VerticalFloat
extension ViewPinGuides {
	
	@available(*, renamed: "VerticalFloat")
	typealias Vertical = VerticalFloat
	public struct VerticalFloat {
		
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

extension ViewPinGuides.VerticalFloat {
	
	var referenceView: UIView? {
		return self.referenceViewGetter()
	}
	
}

extension ViewPinGuides.VerticalFloat {
	
	private func makeGuide(rect: Rect?) -> Guide {
		
		guard let rect = rect else {
			return .empty
		}
		
		let guide = Guide.init(span: rect.verticalSpan)
		
		return guide
		
	}
	
}

extension ViewPinGuides.VerticalFloat {
	
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
	
	@available(iOS 11.0, *)
	public var safeAreaGuide: Guide {
		return self.makeGuide(rect: self.referenceView?.safeAreaFrame(in: self.parentView))
	}
	
}

extension ViewPinGuides.VerticalFloat: VerticalFloatPinGuideRepresentable {
	
	private var pinGuide: ViewPinGuides.VerticalFloat.Guide {
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

// MARK: - HorizontalSpan
extension ViewPinGuides {
	
	public struct HorizontalSpan {
		
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

extension ViewPinGuides.HorizontalSpan {
	
	var referenceView: UIView? {
		return self.referenceViewGetter()
	}
	
}

extension ViewPinGuides.HorizontalSpan {
	
	private func makeGuide(directionGetter: @escaping () -> UIUserInterfaceLayoutDirection?, rect: Rect?) -> Guide {
		
		guard let rect = rect else {
			return .empty
		}
		
		let guide = Guide(directionGetter: directionGetter, originalSpan: rect.horizontalSpan)
		
		return guide
		
	}
	
}

extension ViewPinGuides.HorizontalSpan {
	
	public var frameGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: false))
	}
	
	public var identityFrameGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: true))
	}
	
	public var layoutMarginsGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.layoutMarginsFrame(in: self.parentView))
	}
	
	public var readableGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.readableFrame(in: self.parentView))
	}
	
	@available(iOS 11.0, *)
	public var safeAreaGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.safeAreaFrame(in: self.parentView))
	}
	
}

extension ViewPinGuides.HorizontalSpan: HorizontalSpanPinGuideRepresentable {
	
	public var pinGuide: ViewPinGuides.HorizontalSpan.Guide {
		return self.frameGuide
	}
	
	public var direction: UIUserInterfaceLayoutDirection {
		return self.pinGuide.direction
	}
	
	public var fromLeftToCenter: Span {
		return self.pinGuide.fromLeftToCenter
	}
	
	public var fromLeftToRight: Span {
		return self.pinGuide.fromLeftToRight
	}
	
	public var fromCenterToLeft: Span {
		return self.pinGuide.fromCenterToLeft
	}
	
	public var fromCenterToRight: Span {
		return self.pinGuide.fromCenterToRight
	}
	
	public var fromRightToLeft: Span {
		return self.pinGuide.fromRightToLeft
	}
	
	public var fromRightToCenter: Span {
		return self.pinGuide.fromRightToCenter
	}
	
	public func horizontal(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span {
		return self.pinGuide.horizontal(from: coordinatePositionA, to: coordinatePositionB)
	}
	
	public var fromLeadingToCenter: Span {
		return self.pinGuide.fromLeadingToCenter
	}
	
	public var fromLeadingToTrailing: Span {
		return self.pinGuide.fromLeadingToTrailing
	}
	
	public var fromCenterToLeading: Span {
		return self.pinGuide.fromCenterToLeading
	}
	
	public var fromCenterToTrailing: Span {
		return self.pinGuide.fromCenterToTrailing
	}
	
	public var fromTrailingToLeading: Span {
		return self.pinGuide.fromTrailingToLeading
	}
	
	public var fromTrailingToCenter: Span {
		return self.pinGuide.fromTrailingToCenter
	}
	
	public func directionalHorizontal(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span {
		return self.pinGuide.directionalHorizontal(from: coordinatePositionA, to: coordinatePositionB)
	}
	
}

// MARK: - VerticalSpan
extension ViewPinGuides {
	
	public struct VerticalSpan {
		
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

extension ViewPinGuides.VerticalSpan {
	
	var referenceView: UIView? {
		return self.referenceViewGetter()
	}
	
}

extension ViewPinGuides.VerticalSpan {
	
	private func makeGuide(rect: Rect?) -> Guide {
		
		guard let rect = rect else {
			return .empty
		}
		
		let guide = Guide(originalSpan: rect.verticalSpan)
		
		return guide
		
	}
	
}

extension ViewPinGuides.VerticalSpan {
	
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
	
	@available(iOS 11.0, *)
	public var safeAreaGuide: Guide {
		return self.makeGuide(rect: self.referenceView?.safeAreaFrame(in: self.parentView))
	}
	
}

extension ViewPinGuides.VerticalSpan: VerticalSpanPinGuideRepresentable {
	
	public var pinGuide: ViewPinGuides.VerticalSpan.Guide {
		return self.frameGuide
	}
	
	public var fromTopToMiddle: Span {
		return self.pinGuide.fromTopToMiddle
	}
	
	public var fromTopToBottom: Span {
		return self.pinGuide.fromTopToBottom
	}
	
	public var fromMiddleToTop: Span {
		return self.pinGuide.fromMiddleToTop
	}
	
	public var fromMiddleToBottom: Span {
		return self.pinGuide.fromMiddleToBottom
	}
	
	public var fromBottomToTop: Span {
		return self.pinGuide.fromBottomToTop
	}
	
	public var fromBottomToMiddle: Span {
		return self.pinGuide.fromBottomToMiddle
	}
	
	public func vertical(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span {
		return self.pinGuide.vertical(from: coordinatePositionA, to: coordinatePositionB)
	}
	
}

// MARK: - Point
extension ViewPinGuides {
	
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
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: false))
	}
	
	public var identityFrameGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: true))
	}
	
	public var layoutMarginsGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.layoutMarginsFrame(in: self.parentView))
	}
	
	public var readableGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.readableFrame(in: self.parentView))
	}
	
	@available(iOS 11.0, *)
	public var safeAreaGuide: Guide {
		return self.makeGuide(directionGetter: { [weak referenceView] in referenceView?.currentDirection }, rect: self.referenceView?.safeAreaFrame(in: self.parentView))
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
