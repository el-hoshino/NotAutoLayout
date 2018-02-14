//
//  DidStoreMiddleSequentialProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleSequentialLayoutProperty {
	
	let middle: LayoutElement.Vertical
	
}

// MARK: - Set A Size -
extension DidStoreMiddleSequentialLayoutProperty: LayoutPropertyCanStoreSizeType {
	
	public typealias WillSetSizeProperty = DidStoreMiddleSizeSequentialLayoutProperty
	
	public func storeSize(_ size: LayoutElement.Size, to maker: LayoutMaker<DidStoreMiddleSequentialLayoutProperty>) -> LayoutMaker<DidStoreMiddleSizeSequentialLayoutProperty> {
		
		let centerSize = DidStoreMiddleSizeSequentialLayoutProperty(middle: self.middle,
																	subviewSize: size)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerSize)
		
		return maker
		
	}
	
}
