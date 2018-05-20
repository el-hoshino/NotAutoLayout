//
//  LayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LayoutMaker<Property: LayoutMakerPropertyType> {
	
	// FIXME: Due to a Swift compiler bug currently store an `unowned NSObject` property in a `struct` will cause a crash while trying to print the `struct` instance, which always happens in Playgrounds. After this bug fixed, the `parentView` should be declared as `unowned`, if this could cause a memory leak
	let parentView: UIView
	
	let didSetProperty: Property
	
}

public protocol LayoutMakerPropertyType {
	
}

extension LayoutMaker {
	
	func changintProperty <T: LayoutMakerPropertyType> (to property: T) -> LayoutMaker<T> {
		
		let maker = LayoutMaker<T>(parentView: self.parentView,
								   didSetProperty: property)
		
		return maker
		
	}
	
}
