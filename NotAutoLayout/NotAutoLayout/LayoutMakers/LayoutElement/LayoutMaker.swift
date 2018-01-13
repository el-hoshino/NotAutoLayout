//
//  LayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LayoutMaker<Property> {
	
	unowned let parentView: UIView
	
	let didSetProperty: Property
	
}

public protocol LayoutMakerPropertyType {
	
}

public typealias DidStoreAllRequiredLayoutProperty = Layout
