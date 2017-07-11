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
	
	private var needsToAddSetteeToParent: Bool
	
	init(parent: ParentView, settee: UIView) {
		self.parentView = parent
		self.setteeView = settee
		self.layouts = [:]
		self.orders = [:]
		self.zIndices = [:]
		self.needsToAddSetteeToParent = false
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
		
		if self.needsToAddSetteeToParent {
			self.parentView.addSubview(self.setteeView)
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
	
	public func setOrder(_ order: @escaping () -> Int, forCondition condition: ConditionEnum) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.orders[condition.rawValue] = order
		return wizard
		
	}
	
	public func setOrder(_ order: Int, forCondition condition: ConditionEnum) -> SubviewSetupWizard {
		
		let order = { order }
		return self.setOrder(order, forCondition: condition)
		
	}
	
	public func setDefaultOrder(_ order: @escaping () -> Int) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setOrder(order, forCondition: condition)
		
	}
	
	public func setDefaultOrder(_ order: Int) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setOrder(order, forCondition: condition)
		
	}
	
}

extension SubviewSetupWizard where ParentView: UIView & LayoutControllable {
	
	public func setZIndex(_ zIndex: @escaping () -> Int, forCondition condition: ConditionEnum) -> SubviewSetupWizard {
		
		var wizard = self
		wizard.zIndices[condition.rawValue] = zIndex
		return wizard
		
	}
	
	public func setZIndex(_ zIndex: Int, forCondition condition: ConditionEnum) -> SubviewSetupWizard {
		
		let zIndex = { zIndex }
		return self.setZIndex(zIndex, forCondition: condition)
		
	}
	
	public func setDefaultZIndex(_ zIndex: @escaping () -> Int) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setZIndex(zIndex, forCondition: condition)
		
	}
	
	public func setDefaultZIndex(_ zIndex: Int) -> SubviewSetupWizard {
		
		let condition = self.parentView.getDefaultCondition()
		return self.setZIndex(zIndex, forCondition: condition)
		
	}
	
}

extension SubviewSetupWizard where ParentView: UIView & LayoutControllable {
	
	public func add() -> SubviewSetupWizard {
		
		var wizard = self
		wizard.needsToAddSetteeToParent = true
		return wizard
		
	}
	
}
