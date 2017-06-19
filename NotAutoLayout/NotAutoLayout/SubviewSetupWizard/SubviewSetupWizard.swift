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
	private let settingView: UIView
	
	typealias ConditionLayout = [ConditionEnum.RawValue: Layout.Individual]
	typealias ConditionOrder = [ConditionEnum.RawValue: Int]
	typealias ConditionZIndex = [ConditionEnum.RawValue: Int]
	
	private var layouts: ConditionLayout
	private var orders: ConditionOrder
	private var zIndices: ConditionZIndex
	
	init(parent: ParentView, settee: UIView) {
		self.parentView = parent
		self.settingView = settee
		self.layouts = [:]
		self.orders = [:]
		self.zIndices = [:]
	}
	
}

extension SubviewSetupWizard where ParentView: UIView & LayoutControllable {
	
	private func setupLayouts() {
		
		for (condition, layout) in self.layouts {
			self.parentView.nal.appendLayout(layout, under: condition, for: self.settingView)
		}
		
	}
	
	private func setupOrders() {
		
		for (condition, order) in self.orders {
			self.parentView.nal.appendLayoutOrder(order, under: condition, for: self.settingView)
		}
		
	}
	
	private func setupZIndices() {
		
		for (condition, zIndex) in self.zIndices {
			self.parentView.nal.appendZIndex(zIndex, under: condition, for: self.settingView)
		}
		
	}
	
	public func commit() -> Finished {
		
		self.setupLayouts()
		self.setupOrders()
		self.setupZIndices()
		
		return .success
		
	}
	
}

extension SubviewSetupWizard where ParentView: UIView & LayoutControllable {
	
	public func addToSelf() -> SubviewSetupWizard {
		
		self.parentView.addSubview(self.settingView)
		return self
		
	}
	
	public func setDefaultLayout(to layout: Layout.Individual) -> SubviewSetupWizard {
		
		var wizard = self
		let defaultCondition = self.parentView.getDefaultCondition().rawValue
		wizard.layouts[defaultCondition] = layout
		return wizard
		
	}
	
}
