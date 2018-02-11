//
//  DidStoreRightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreRightLayoutProperty {
	
	let right: LayoutElement.Horizontal
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreRightLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreRightTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreRightLayoutProperty>) -> LayoutMaker<DidStoreRightTopLayoutProperty> {
		
		let rightTop = DidStoreRightTopLayoutProperty(right: self.right,
													  top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension DidStoreRightLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreRightMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreRightLayoutProperty>) -> LayoutMaker<DidStoreRightMiddleLayoutProperty> {
		
		let rightMiddle = DidStoreRightMiddleLayoutProperty(right: self.right,
															middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension DidStoreRightLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreRightBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreRightLayoutProperty>) -> LayoutMaker<DidStoreRightBottomLayoutProperty> {
		
		let rightBottom = DidStoreRightBottomLayoutProperty(right: self.right,
															bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightBottom)
		
		return maker
		
	}
	
}
