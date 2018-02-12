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
	
	open var layoutInfo: [ConditionEnum.RawValue: LayoutInfo] = [:]
	open var orderInfo: [ConditionEnum.RawValue : OrderInfo] = [:]
	open var zIndexInfo: [ConditionEnum.RawValue : ZIndexInfo] = [:]
		
	open func getDefaultCondition() -> ConditionEnum {
		return DefaultCondition.default
	}
	
	open func getCondition(underCurrentBoundSize boundSize: CGSize) -> ConditionEnum? {
		return nil
	}
	
	open override func layoutSubviews() {
		super.layoutSubviews()
		self.nal.layoutSubviews()
	}
	
}
