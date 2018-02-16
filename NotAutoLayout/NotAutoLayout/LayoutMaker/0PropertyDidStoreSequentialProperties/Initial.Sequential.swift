//
//  Initial.Sequential.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension SequentialProperty {
	
	public struct Initial: LayoutMakerPropertyType {
		
	}
	
}

// MARK: - Set A Point -
extension SequentialProperty.Initial: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreMiddleSequentialLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<SequentialProperty.Initial>) -> LayoutMaker<DidStoreMiddleSequentialLayoutProperty> {
		
		let middle = DidStoreMiddleSequentialLayoutProperty(middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middle)
		
		return maker
		
	}
	
}
