//
//  LayoutControllable.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

/// Fundamental class-only protocol that handles the layout.
public protocol LayoutControllable: class, NotAutoLayoutCompatible {
	
	/// The property to store the layout information for subviews.
	var layoutInfo: [ConditionEnum.RawValue: LayoutInfo] { get set }
	
	/// The property to store the layout order information for subviews.
	var orderInfo: [ConditionEnum.RawValue: OrderInfo] { get set }
	
	/// The property to store the zIndex information for subviews.
	var zIndexInfo: [ConditionEnum.RawValue: ZIndexInfo] { get set }
	
	/// LayoutOptimization property that is used for some specific layout.
	var layoutOptimization: LayoutOptimization { get }
	
	
	///
	func getDefaultCondition() -> ConditionEnum
	
	///
	func getCondition(underCurrentBoundSize boundSize: CGSize) -> ConditionEnum?
	
	/// UIView's layoutSubviews() method
	func layoutSubviews()
	/// UIView's setNeedsLayout() method
	func setNeedsLayout()
	/// UIView's layoutIfNeeded() method
	func layoutIfNeeded()
	
}

// MARK: Default implement for override-able methods
extension LayoutControllable {
	
	public func getDefaultCondition() -> ConditionEnum {
		return DefaultCondition.default
	}
	
	public func getCondition(underCurrentBoundSize boundSize: CGSize) -> ConditionEnum? {
		return nil
	}
	
}

// MARK: Internal APIs: Condition
extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func getCurrentCondition() -> ConditionEnum {
		return self.body.getCondition(underCurrentBoundSize: self.boundSize) ?? self.body.getDefaultCondition()
	}
	
}

// MARK: Internal APIs: Layout
extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func getLayout(for view: UIView, from layoutInfo: LayoutInfo) -> Layout.Individual? {
		
		let layout = layoutInfo[view.nal.hash]
		return layout
		
	}
	
	func getCurrentLayoutInfo() -> LayoutInfo? {
		
		let currentCondition = self.getCurrentCondition()
		let currentLayoutInfo = self.body.layoutInfo[currentCondition.rawValue]
		return currentLayoutInfo
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func appendLayout(_ layout: Layout.Individual, under condition: ConditionEnum.RawValue, for subview: UIView) {
		
		let newInfo: LayoutInfo = [subview.nal.hash: layout]
		self.body.layoutInfo[condition, default: [:]].append(newInfo)
		
	}
	
	func appendLayout(_ layout: Layout.Individual, under condition: ConditionEnum, for subview: UIView) {
		
		let condition = condition.rawValue
		self.appendLayout(layout, under: condition, for: subview)
		
	}
	
	func setDefaultLayout(_ layout: Layout.Individual, for subview: UIView) {
		
		let condition = self.body.getDefaultCondition().rawValue
		let newInfo: LayoutInfo = [subview.nal.hash: layout]
		self.body.layoutInfo[condition, default: [:]].append(newInfo)
		
	}
	
}

// MARK: Internal APIs: Order
extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func getOrder(for view: UIView, from orderInfo: OrderInfo) -> Int? {
		
		let order = orderInfo[view.nal.hash]
		return order
		
	}
	
	func getFactOrder(for view: UIView, from orderInfo: OrderInfo) -> Int {
		
		let order = self.getOrder(for: view, from: orderInfo)
		return order ?? 0
		
	}
	
	func getCurrentOrderInfo() -> OrderInfo? {
		
		let currentCondition = self.getCurrentCondition()
		let currentOrderInfo = self.body.orderInfo[currentCondition.rawValue]
		return currentOrderInfo
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func appendLayoutOrder(_ order: Int, under condition: ConditionEnum.RawValue, for subview: UIView) {
		
		let newInfo: OrderInfo = [subview.nal.hash: order]
		self.body.orderInfo[condition, default: [:]].append(newInfo)
		
	}
	
	func appendLayoutOrder(_ order: Int, under condition: ConditionEnum, for subview: UIView) {
		
		let condition = condition.rawValue
		self.appendLayoutOrder(order, under: condition, for: subview)
		
	}
	
	func setDefaultLayoutOrder(_ order: Int, for subview: UIView) {
		
		let condition = self.body.getDefaultCondition().rawValue
		let newInfo: OrderInfo = [subview.nal.hash: order]
		self.body.orderInfo[condition, default: [:]].append(newInfo)
		
	}
	
}

// MARK: Internal APIs: ZIndex
extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func getZIndex(for view: UIView, from zIndexInfo: ZIndexInfo) -> Int? {
		
		let zIndex = zIndexInfo[view.nal.hash]
		return zIndex
		
	}
	
	func getFactZIndex(for view: UIView, from zIndexInfo: ZIndexInfo) -> Int {
		
		let zIndex = self.getZIndex(for: view, from: zIndexInfo)
		return zIndex ?? 0
		
	}
	
	func getCurrentZIndexInfo() -> ZIndexInfo? {
		
		let currentCondition = self.getCurrentCondition()
		let currentZIndexInfo = self.body.zIndexInfo[currentCondition.rawValue]
		return currentZIndexInfo
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func appendZIndex(_ index: Int, under condition: ConditionEnum.RawValue, for subview: UIView) {
		
		let newInfo: ZIndexInfo = [subview.nal.hash: index]
		self.body.zIndexInfo[condition, default: [:]].append(newInfo)
		
	}
	
	func appendZIndex(_ index: Int, under condition: ConditionEnum, for subview: UIView) {
		
		let condition = condition.rawValue
		self.appendZIndex(index, under: condition, for: subview)
		
	}
	
	func setDefaultZIndex(_ zIndex: Int, for subview: UIView) {
		
		let condition = self.body.getDefaultCondition().rawValue
		let newInfo: ZIndexInfo = [subview.nal.hash: zIndex]
		self.body.orderInfo[condition, default: [:]].append(newInfo)
		
	}
	
}
