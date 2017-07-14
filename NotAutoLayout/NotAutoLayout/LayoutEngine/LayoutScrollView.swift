//
//  LayoutScrollView.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/07/14.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

open class LayoutScrollView: UIScrollView, LayoutControllable {
	
	public var layoutInfo: [ConditionEnum.RawValue: LayoutInfo] = [:]
	public var orderInfo: [ConditionEnum.RawValue : OrderInfo] = [:]
	public var zIndexInfo: [ConditionEnum.RawValue : ZIndexInfo] = [:]
	
	public var layoutOptimization: LayoutOptimization = .none
	
	open override func layoutSubviews() {
		super.layoutSubviews()
		self.nal.layoutControl()
	}
	
}
