//
//  ViewPinProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/12/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol ViewPinHorizontalProperty {
	var span: Span { get }
	var identitySpan: Span { get }
}

public protocol ViewPinVerticalProperty {
	var span: Span { get }
	var identitySpan: Span { get }
}

public protocol ViewPinPointProperty {
	var rect: Rect { get }
	var identityRect: Rect { get }
}

public struct ViewPinPropertyType {
	
	public struct Horizontal {
		
		fileprivate weak var parentView: UIView?
		fileprivate var referenceView: () -> UIView?
		
	}
	
	public struct Vertical {
		
		fileprivate weak var parentView: UIView?
		fileprivate var referenceView: () -> UIView?
		
	}
	
	public struct Point {
		
		fileprivate weak var parentView: UIView?
		fileprivate var referenceView: () -> UIView?
		
	}
	
}

extension ViewPinPropertyType.Horizontal: ViewPinHorizontalProperty {
	
	public var span: Span {
		let frame = self.referenceView()?.frame(in: self.parentView, ignoresTransform: false)
		return frame.map({ Span(horizontalFrom: $0) }) ?? .zero
	}
	
	public var identitySpan: Span {
		let frame = self.referenceView()?.frame(in: self.parentView, ignoresTransform: true)
		return frame.map({ Span(horizontalFrom: $0) }) ?? .zero
	}
	
}

extension ViewPinPropertyType.Vertical: ViewPinVerticalProperty {
	
	public var span: Span {
		let frame = self.referenceView()?.frame(in: self.parentView, ignoresTransform: false)
		return frame.map({ Span(verticalFrom: $0) }) ?? .zero
	}
	
	public var identitySpan: Span {
		let frame = self.referenceView()?.frame(in: self.parentView, ignoresTransform: true)
		return frame.map({ Span(verticalFrom: $0) }) ?? .zero
	}
	
}

extension ViewPinPropertyType.Point: ViewPinPointProperty {
	
	public var rect: Rect {
		let frame = self.referenceView()?.frame(in: self.parentView, ignoresTransform: false)
		return frame.map({ Rect(from: $0) }) ?? .zero
	}
	
	public var identityRect: Rect {
		let frame = self.referenceView()?.frame(in: self.parentView, ignoresTransform: true)
		return frame.map({ Rect(from: $0) }) ?? .zero
	}
	
}

public struct ViewPinProperty<Property> {
	
	private var property: Property
	
}

extension ViewPinProperty {
	
	static func horizontal(parentView: UIView?, referenceView: UIView?) -> ViewPinProperty<ViewPinPropertyType.Horizontal> {
		
		return horizontal(parentView: parentView, referenceView: { [weak referenceView] in referenceView })
		
	}
	
	static func horizontal(parentView: UIView?, referenceView: @escaping () -> UIView?) -> ViewPinProperty<ViewPinPropertyType.Horizontal> {
		
		let property = ViewPinPropertyType.Horizontal(parentView: parentView, referenceView: referenceView)
		let pinProperty = ViewPinProperty<ViewPinPropertyType.Horizontal>(property: property)
		
		return pinProperty
		
	}
	
}

extension ViewPinProperty {
	
	static func vertical(parentView: UIView?, referenceView: UIView?) -> ViewPinProperty<ViewPinPropertyType.Vertical> {
		
		return vertical(parentView: parentView, referenceView: { [weak referenceView] in referenceView })
		
	}
	
	static func vertical(parentView: UIView?, referenceView: @escaping () -> UIView?) -> ViewPinProperty<ViewPinPropertyType.Vertical> {
		
		let property = ViewPinPropertyType.Vertical(parentView: parentView, referenceView: referenceView)
		let pinProperty = ViewPinProperty<ViewPinPropertyType.Vertical>(property: property)
		
		return pinProperty
		
	}
	
}

extension ViewPinProperty {
	
	static func point(parentView: UIView?, referenceView: UIView?) -> ViewPinProperty<ViewPinPropertyType.Point> {
		
		return point(parentView: parentView, referenceView: { [weak referenceView] in referenceView })
		
	}
	
	static func point(parentView: UIView?, referenceView: @escaping () -> UIView?) -> ViewPinProperty<ViewPinPropertyType.Point> {
		
		let property = ViewPinPropertyType.Point(parentView: parentView, referenceView: referenceView)
		let pinProperty = ViewPinProperty<ViewPinPropertyType.Point>(property: property)
		
		return pinProperty
		
	}
	
}

extension ViewPinProperty where Property: ViewPinHorizontalProperty {
	
	var span: Span {
		return self.property.span
	}
	
	var identitySpan: Span {
		return self.property.identitySpan
	}
	
}

extension ViewPinProperty where Property: ViewPinHorizontalProperty {
	
	public func horizontalGeometry(at coordinate: CGFloat) -> CGFloat {
		return self.span.geometry(at: coordinate)
	}
	
	public func identityHorizontalGeometry(at coordinate: CGFloat) -> CGFloat {
		return self.identitySpan.geometry(at: coordinate)
	}
	
	public var left: CGFloat {
		return self.horizontalGeometry(at: 0)
	}
	
	public var center: CGFloat {
		return self.horizontalGeometry(at: 0.5)
	}
	
	public var right: CGFloat {
		return self.horizontalGeometry(at: 1)
	}
	
	public var identityLeft: CGFloat {
		return self.identityHorizontalGeometry(at: 0)
	}
	
	public var identityCenter: CGFloat {
		return self.identityHorizontalGeometry(at: 0.5)
	}
	
	public var identityRight: CGFloat {
		return self.identityHorizontalGeometry(at: 1)
	}
	
}

extension ViewPinProperty where Property: ViewPinVerticalProperty {
	
	var span: Span {
		return self.property.span
	}
	
	var identitySpan: Span {
		return self.property.identitySpan
	}
	
}

extension ViewPinProperty where Property: ViewPinVerticalProperty {
	
	public func verticalGeometry(at coordinate: CGFloat) -> CGFloat {
		return self.span.geometry(at: coordinate)
	}
	
	public func identityVerticalGeometry(at coordinate: CGFloat) -> CGFloat {
		return self.identitySpan.geometry(at: coordinate)
	}
	
	public var top: CGFloat {
		return self.verticalGeometry(at: 0)
	}
	
	public var middle: CGFloat {
		return self.verticalGeometry(at: 0.5)
	}
	
	public var bottom: CGFloat {
		return self.verticalGeometry(at: 1)
	}
	
	public var identityTop: CGFloat {
		return self.identityVerticalGeometry(at: 0)
	}
	
	public var identityMiddle: CGFloat {
		return self.identityVerticalGeometry(at: 0.5)
	}
	
	public var identityBottom: CGFloat {
		return self.identityVerticalGeometry(at: 1)
	}
	
}

extension ViewPinProperty where Property: ViewPinPointProperty {
	
	var rect: Rect {
		return self.property.rect
	}
	
	var identityRect: Rect {
		return self.property.identityRect
	}
	
}

extension ViewPinProperty where Property: ViewPinPointProperty {
	
	public func pointGeometry(at coordinate: CGPoint) -> CGPoint {
		return self.rect.pointGeometry(at: coordinate)
	}
	
	public func pointGeometry(x: CGFloat, y: CGFloat) -> CGPoint {
		return self.rect.pointGeometry(x: x, y: y)
	}
	
	public var topLeft: CGPoint {
		return self.pointGeometry(x: 0, y: 0)
	}
	
	public var topCenter: CGPoint {
		return self.pointGeometry(x: 0.5, y: 0)
	}
	
	public var topRight: CGPoint {
		return self.pointGeometry(x: 1, y: 0)
	}
	
	public var middleLeft: CGPoint {
		return self.pointGeometry(x: 0, y: 0.5)
	}
	
	public var middleCenter: CGPoint {
		return self.pointGeometry(x: 0.5, y: 0.5)
	}
	
	public var middleRight: CGPoint {
		return self.pointGeometry(x: 1, y: 0.5)
	}
	
	public var bottomLeft: CGPoint {
		return self.pointGeometry(x: 0, y: 1)
	}
	
	public var bottomCenter: CGPoint {
		return self.pointGeometry(x: 0.5, y: 1)
	}
	
	public var bottomRight: CGPoint {
		return self.pointGeometry(x: 1, y: 1)
	}
	
}

private extension UIView {
	
	func frame(in targetView: UIView?, ignoresTransform shouldIgnoreTransform: Bool) -> CGRect {
		
		let checkingFrame = self.nal.frame(thatIgnoresTransform: shouldIgnoreTransform)
		
		guard let targetView = targetView,
			let superView = self.superview
		else {
			return .zero
		}
		
		if targetView === superView {
			return checkingFrame
			
		} else {
			return superView.convert(checkingFrame, to: targetView)
		}
		
		
	}
	
}
