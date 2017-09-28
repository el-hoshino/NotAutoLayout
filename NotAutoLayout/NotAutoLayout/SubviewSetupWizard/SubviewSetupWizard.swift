//
//  SubviewSetupWizard.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/17.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct SubviewSetupWizard<ParentView> {
	
	private let parentView: ParentView
	private let setteeView: UIView
	
	typealias ConditionLayout = [ConditionEnum.RawValue: () -> Layout]
	typealias ConditionOrder = [ConditionEnum.RawValue: () -> Int]
	typealias ConditionZIndex = [ConditionEnum.RawValue: () -> Int]
	
	private var layouts: ConditionLayout
	private var orders: ConditionOrder
	private var zIndices: ConditionZIndex
	
	private enum AddingMethod {
		case none
		case add
		case insertAt(() -> Int?)
		case insertAbove(() -> UIView?)
		case insertBelow(() -> UIView?)
	}
	
	private var addingMethod: AddingMethod
	
	init(parent: ParentView, settee: UIView) {
		self.parentView = parent
		self.setteeView = settee
		self.layouts = [:]
		self.orders = [:]
		self.zIndices = [:]
		self.addingMethod = .none
	}
	
}

extension SubviewSetupWizard where ParentView: UIView & LayoutInfoStorable {
	
	private func setupLayouts() {
		
		for (condition, layout) in self.layouts {
			self.parentView.nal.appendLayout(layout, under: condition, for: self.setteeView)
		}
		
	}
	
	private func setupOrders() {
		
		for (condition, order) in self.orders {
			self.parentView.nal.appendLayoutOrder(order, under: condition, for: self.setteeView)
		}
		
	}
	
	private func setupZIndices() {
		
		for (condition, zIndex) in self.zIndices {
			self.parentView.nal.appendZIndex(zIndex, under: condition, for: self.setteeView)
		}
		
	}
	
	private func addSetteeToParent() {
		
		switch self.addingMethod {
		case .none:
			break
			
		case .add:
			self.parentView.addSubview(self.setteeView)
			
		case .insertAt(let index):
			if let index = index() {
				self.parentView.insertSubview(self.setteeView, at: index)
			} else {
				self.parentView.addSubview(self.setteeView)
			}
			
		case .insertAbove(let view):
			if let view = view() {
				self.parentView.insertSubview(self.setteeView, aboveSubview: view)
			} else {
				self.parentView.addSubview(self.setteeView)
			}
			
		case .insertBelow(let view):
			if let view = view() {
				self.parentView.insertSubview(self.setteeView, belowSubview: view)
			} else {
				self.parentView.addSubview(self.setteeView)
			}
		}
		
	}
	
	func commit() {
		
		self.setupLayouts()
		self.setupOrders()
		self.setupZIndices()
		
		self.addSetteeToParent()
		
	}
	
}

extension SubviewSetupWizard where ParentView: UIView & LayoutInfoStorable {
	
	public func setLayout(for condition: ConditionEnum, by layout: @escaping () -> Layout) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.layouts[condition.rawValue] = layout
		return wizard
		
	}
	
	public func setLayout(for condition: ConditionEnum, to layout: Layout) -> SubviewSetupWizard {
		
		let layout = { layout }
		return self.setLayout(for: condition, by: layout)
		
	}
	
	public func setDefaultLayout(by layout: @escaping () -> Layout) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setLayout(for: condition, by: layout)
		
	}
	
	public func setDefaultLayout(to layout: Layout) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setLayout(for: condition, to: layout)
		
	}
	
	public func makeDefaultLayout(_ making: (InitialLayoutMaker) -> LayoutEditor) -> SubviewSetupWizard {
		
		let maker = InitialLayoutMaker(parentView: self.parentView)
		let layout = making(maker).layout
		
		return self.setDefaultLayout(to: layout)
		
	}
	
	public func makeLayout(for condition: ConditionEnum, making: (InitialLayoutMaker) -> LayoutEditor) -> SubviewSetupWizard {
		
		let maker = InitialLayoutMaker(parentView: self.parentView)
		let layout = making(maker).layout
		
		return self.setLayout(for: condition, to: layout)
		
	}
	
}

extension SubviewSetupWizard where ParentView: UIView & LayoutInfoStorable {
	
	public func setOrder(for condition: ConditionEnum, by order: @escaping () -> Int) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.orders[condition.rawValue] = order
		return wizard
		
	}
	
	public func setOrder(for condition: ConditionEnum, to order: Int) -> SubviewSetupWizard {
		
		let order = { order }
		return self.setOrder(for: condition, by: order)
		
	}
	
	public func setDefaultOrder(by order: @escaping () -> Int) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setOrder(for: condition, by: order)
		
	}
	
	public func setDefaultOrder(to order: Int) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setOrder(for: condition, to: order)
		
	}
	
}

extension SubviewSetupWizard where ParentView: UIView & LayoutInfoStorable {
	
	public func setZIndex(for condition: ConditionEnum, by zIndex: @escaping () -> Int) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.zIndices[condition.rawValue] = zIndex
		return wizard
		
	}
	
	public func setZIndex(for condition: ConditionEnum, to zIndex: Int) -> SubviewSetupWizard {
		
		let zIndex = { zIndex }
		return self.setZIndex(for: condition, by: zIndex)
		
	}
	
	public func setDefaultZIndex(by zIndex: @escaping () -> Int) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setZIndex(for: condition, by: zIndex)
		
	}
	
	public func setDefaultZIndex(to zIndex: Int) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setZIndex(for: condition, to: zIndex)
		
	}
	
}

extension SubviewSetupWizard where ParentView: UIView & LayoutInfoStorable {
	
	public func addToParent() -> SubviewSetupWizard {
		
		var wizard = self
		wizard.addingMethod = .add
		return wizard
		
	}
	
	public func insertToParent(at index: Int) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.addingMethod = .insertAt({ index })
		return wizard
		
	}
	
	public func insertToParent(at index: @escaping () -> Int?) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.addingMethod = .insertAt(index)
		return wizard
		
	}
	
	public func insertToParent(above view: UIView) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.addingMethod = .insertAbove({ [weak view] in view })
		return wizard
		
	}
	
	public func insertToParent(above view: @escaping () -> UIView?) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.addingMethod = .insertAbove(view)
		return wizard
		
	}
	
	public func insertToParent(below view: UIView) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.addingMethod = .insertBelow({ [weak view] in view })
		return wizard
		
	}
	
	public func insertToParent(below view: @escaping () -> UIView?) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.addingMethod = .insertBelow(view)
		return wizard
		
	}
	
}
