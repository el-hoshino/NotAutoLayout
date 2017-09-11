//
//  LayoutScrollView.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/07/14.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

open class LayoutScrollView: UIScrollView, LayoutInfoStorable {
	
	open var layoutInfo: [ConditionEnum.RawValue: LayoutInfo] = [:]
	open var orderInfo: [ConditionEnum.RawValue : OrderInfo] = [:]
	open var zIndexInfo: [ConditionEnum.RawValue : ZIndexInfo] = [:]
	
	open var layoutOptimization: LayoutOptimization = .none
	
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
