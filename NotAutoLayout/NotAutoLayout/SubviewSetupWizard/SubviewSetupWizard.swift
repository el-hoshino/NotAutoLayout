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
	
	typealias ConditionLayout = [ConditionEnum.RawValue: () -> Layout.Individual]
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

extension SubviewSetupWizard where ParentView: UIView & LayoutControllable {
	
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
	
	public func commit() -> Finished {
		
		self.setupLayouts()
		self.setupOrders()
		self.setupZIndices()
		
		self.addSetteeToParent()
		
		return .success
		
	}
	
}

extension SubviewSetupWizard where ParentView: UIView & LayoutControllable {
	
	public func setLayout(_ layout: @escaping () -> Layout.Individual, forCondition condition: ConditionEnum) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.layouts[condition.rawValue] = layout
		return wizard
		
	}
	
	public func setLayout(_ layout: Layout.Individual, forCondition condition: ConditionEnum) -> SubviewSetupWizard {
		
		let layout = { layout }
		return self.setLayout(layout, forCondition: condition)
		
	}
	
	public func setDefaultLayout(to layout: @escaping () -> Layout.Individual) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setLayout(layout, forCondition: condition)
		
	}
	
	public func setDefaultLayout(to layout: Layout.Individual) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setLayout(layout, forCondition: condition)
		
	}
	
	public func makeDefaultLayout(_ making: (InitialLayoutMaker) -> Layout.Individual) -> SubviewSetupWizard {
		
		let maker = InitialLayoutMaker(parentView: self.parentView)
		let layout = making(maker)
		
		return self.setDefaultLayout(to: layout)
		
	}
	
	public func makeLayout(forCondition condition: ConditionEnum, making: (InitialLayoutMaker) -> Layout.Individual) -> SubviewSetupWizard {
		
		let maker = InitialLayoutMaker(parentView: self.parentView)
		let layout = making(maker)
		
		return self.setLayout(layout, forCondition: condition)
		
	}
	
}

extension SubviewSetupWizard where ParentView: UIView & LayoutControllable {
	
	public func setOrder(to order: @escaping () -> Int, forCondition condition: ConditionEnum) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.orders[condition.rawValue] = order
		return wizard
		
	}
	
	public func setOrder(to order: Int, forCondition condition: ConditionEnum) -> SubviewSetupWizard {
		
		let order = { order }
		return self.setOrder(to: order, forCondition: condition)
		
	}
	
	public func setDefaultOrder(to order: @escaping () -> Int) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setOrder(to: order, forCondition: condition)
		
	}
	
	public func setDefaultOrder(to order: Int) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setOrder(to: order, forCondition: condition)
		
	}
	
}

extension SubviewSetupWizard where ParentView: UIView & LayoutControllable {
	
	public func setZIndex(to zIndex: @escaping () -> Int, forCondition condition: ConditionEnum) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.zIndices[condition.rawValue] = zIndex
		return wizard
		
	}
	
	public func setZIndex(to zIndex: Int, forCondition condition: ConditionEnum) -> SubviewSetupWizard {
		
		let zIndex = { zIndex }
		return self.setZIndex(to: zIndex, forCondition: condition)
		
	}
	
	public func setDefaultZIndex(to zIndex: @escaping () -> Int) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setZIndex(to: zIndex, forCondition: condition)
		
	}
	
	public func setDefaultZIndex(to zIndex: Int) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setZIndex(to: zIndex, forCondition: condition)
		
	}
	
}

extension SubviewSetupWizard where ParentView: UIView & LayoutControllable {
	
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
