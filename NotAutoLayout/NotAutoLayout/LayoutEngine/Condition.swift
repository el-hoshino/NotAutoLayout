//
//  Condition.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol ConditionEnum {
	
	typealias RawValue = Int
	var rawValue: RawValue { get }
	
}

public enum DefaultCondition: Int, ConditionEnum {
	case `default`
}
