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
	
	typealias ConditionLayout = [ConditionEnum.RawValue: Layout.Individual]
	typealias ConditionOrder = [ConditionEnum.RawValue: Int]
	typealias ConditionZIndex = [ConditionEnum.RawValue: Int]
	
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
	
	public func addToSelf() -> SubviewSetupWizard {
		
		var wizard = self
		wizard.needsToAddSetteeToParent = true
		return wizard
		
	}
	
	public func setDefaultLayout(to layout: Layout.Individual) -> SubviewSetupWizard {
		
		var wizard = self
		let defaultCondition = self.parentView.getDefaultCondition().rawValue
		wizard.layouts[defaultCondition] = layout
		return wizard
		
	}
	
}
