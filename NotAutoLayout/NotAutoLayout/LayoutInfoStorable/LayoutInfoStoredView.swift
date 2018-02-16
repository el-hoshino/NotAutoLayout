//
//  LayoutView.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/02/09.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

/// The very basic `UIView` that conforms `LayoutInfoStorable` protocol, to layout subviews.
open class LayoutInfoStoredView: UIView, LayoutInfoStorable {
	
	public typealias ParentView = LayoutInfoStoredView
	
	open var layoutInfo: [ConditionEnum.RawValue: LayoutInfo<ParentView>] = [:]
	open var orderInfo: [ConditionEnum.RawValue : OrderInfo] = [:]
	open var zIndexInfo: [ConditionEnum.RawValue : ZIndexInfo] = [:]
	
	public var conditionGetter: ((CGSize) -> ConditionEnum)? = { _ in DefaultCondition.default }
	
	open override func layoutSubviews() {
		super.layoutSubviews()
		self.nal.layoutSubviews()
	}
	
}
