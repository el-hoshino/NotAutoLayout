//
//  InitialSequentialProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public struct InitialSequentialLayoutProperty: LayoutMakerPropertyType {
	
}

// MARK: - Set A Point -
extension InitialSequentialLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreMiddleSequentialLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<InitialSequentialLayoutProperty>) -> LayoutMaker<DidStoreMiddleSequentialLayoutProperty> {
		
		let middle = DidStoreMiddleSequentialLayoutProperty(middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middle)
		
		return maker
		
	}
	
}
