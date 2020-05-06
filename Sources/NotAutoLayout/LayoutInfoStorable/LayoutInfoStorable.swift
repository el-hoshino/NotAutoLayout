//
//  LayoutInfoStorable.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

/// Fundamental class-only protocol that handles the layout.
public protocol LayoutInfoStorable: NotAutoLayoutCompatible {
	
	/// The property to store the layout information for subviews.
	var layoutInfo: [ConditionEnum.RawValue: LayoutInfo] { get set }
	
	/// The property to store the layout order information for subviews.
	var orderInfo: [ConditionEnum.RawValue: OrderInfo] { get set }
	
	/// The property to store the zIndex information for subviews.
	var zIndexInfo: [ConditionEnum.RawValue: ZIndexInfo] { get set }
	
	///
	var conditionGetter: ((_ boundSize: CGSize) -> ConditionEnum)? { get }
	
}

// MARK: - Layout condition getters
extension LayoutInfoStorable {
	
	public func getDefaultCondition() -> ConditionEnum {
		return DefaultCondition.default
	}
	
	public func getCondition(underCurrentBoundSize boundSize: CGSize) -> ConditionEnum? {
		return self.conditionGetter?(boundSize)
	}
	
}

// MARK: - Internal APIs: Layout
extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	func getLayout(for view: UIView, from layoutInfo: LayoutInfo?, or alternativeLayoutInfo: LayoutInfo? = nil) -> IndividualProperty.Layout? {
		
		let layout = layoutInfo?[view.nal.hash] ?? alternativeLayoutInfo?[view.nal.hash]
		return layout
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	func appendLayout(_ layout: @escaping () -> IndividualProperty.Layout, under condition: ConditionEnum.RawValue, for subview: UIView) {
		
		self.body.layoutInfo[condition, default: [:]].set(layout, for: subview)
		
	}
	
	func appendLayout(_ layout: IndividualProperty.Layout, under condition: ConditionEnum.RawValue, for subview: UIView) {
		
		self.body.layoutInfo[condition, default: [:]].set(layout, for: subview)
		
	}
	
	func appendLayout(_ layout: @escaping () -> IndividualProperty.Layout, under condition: ConditionEnum, for subview: UIView) {
		
		let condition = condition.rawValue
		self.appendLayout(layout, under: condition, for: subview)
		
	}
	
	func appendLayout(_ layout: IndividualProperty.Layout, under condition: ConditionEnum, for subview: UIView) {
		
		let condition = condition.rawValue
		self.appendLayout(layout, under: condition, for: subview)
		
	}
	
	func setDefaultLayout(_ layout: @escaping () -> IndividualProperty.Layout, for subview: UIView) {
		
		let condition = self.body.getDefaultCondition().rawValue
		self.appendLayout(layout, under: condition, for: subview)
		
	}
	
	func setDefaultLayout(_ layout: IndividualProperty.Layout, for subview: UIView) {
		
		let condition = self.body.getDefaultCondition().rawValue
		self.appendLayout(layout, under: condition, for: subview)
		
	}
	
}

// MARK: - Internal APIs: Order
extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	func appendLayoutOrder(_ order: @escaping () -> Int, under condition: ConditionEnum.RawValue, for subview: UIView) {
		
		self.body.orderInfo[condition, default: [:]].set(order, for: subview)
		
	}
	
	func appendLayoutOrder(_ order: Int, under condition: ConditionEnum.RawValue, for subview: UIView) {
		
		self.body.orderInfo[condition, default: [:]].set(order, for: subview)
		
	}
	
	func appendLayoutOrder(_ order: @escaping () -> Int, under condition: ConditionEnum, for subview: UIView) {
		
		let condition = condition.rawValue
		self.appendLayoutOrder(order, under: condition, for: subview)
		
	}
	
	func appendLayoutOrder(_ order: Int, under condition: ConditionEnum, for subview: UIView) {
		
		let condition = condition.rawValue
		self.appendLayoutOrder(order, under: condition, for: subview)
		
	}
	
	func setDefaultLayoutOrder(_ order: @escaping () -> Int, for subview: UIView) {
		
		let condition = self.body.getDefaultCondition().rawValue
		self.appendLayoutOrder(order, under: condition, for: subview)
		
	}
	
	func setDefaultLayoutOrder(_ order: Int, for subview: UIView) {
		
		let condition = self.body.getDefaultCondition().rawValue
		self.appendLayoutOrder(order, under: condition, for: subview)
		
	}
	
}

// MARK: - Internal APIs: ZIndex
extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	func appendZIndex(_ zIndex: @escaping () -> Int, under condition: ConditionEnum.RawValue, for subview: UIView) {
		
		self.body.zIndexInfo[condition, default: [:]].set(zIndex, for: subview)
		
	}
	
	func appendZIndex(_ zIndex: Int, under condition: ConditionEnum.RawValue, for subview: UIView) {
		
		self.body.zIndexInfo[condition, default: [:]].set(zIndex, for: subview)
		
	}
	
	func appendZIndex(_ zIndex: @escaping () -> Int, under condition: ConditionEnum, for subview: UIView) {
		
		let condition = condition.rawValue
		self.appendZIndex(zIndex, under: condition, for: subview)
		
	}
	
	func appendZIndex(_ zIndex: Int, under condition: ConditionEnum, for subview: UIView) {
		
		let condition = condition.rawValue
		self.appendZIndex(zIndex, under: condition, for: subview)
		
	}
	
	func setDefaultZIndex(_ zIndex: @escaping () -> Int, for subview: UIView) {
		
		let condition = self.body.getDefaultCondition().rawValue
		self.appendZIndex(zIndex, under: condition, for: subview)
		
	}
	
	func setDefaultZIndex(_ zIndex: Int, for subview: UIView) {
		
		let condition = self.body.getDefaultCondition().rawValue
		self.appendZIndex(zIndex, under: condition, for: subview)
		
	}
	
}

// MARK: - Internal APIs: ViewInfo Retrieving
extension NotAutoLayoutContainer where Containee: UIView {
	
	func layout(in layoutInfo: LayoutInfo) -> IndividualProperty.Layout? {
		return layoutInfo[self.hash]
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	func order(in orderInfo: OrderInfo) -> Int? {
		return orderInfo[self.hash]
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	func zIndex(in zIndexInfo: ZIndexInfo) -> Int? {
		return zIndexInfo[self.hash]
	}
	
}
