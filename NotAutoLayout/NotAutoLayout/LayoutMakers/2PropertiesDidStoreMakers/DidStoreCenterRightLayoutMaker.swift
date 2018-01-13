//
//  DidStoreCenterRightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterRightLayoutProperty {
	
	let center: LayoutElement.Horizontal
	
	let right: LayoutElement.Horizontal
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreCenterRightLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreCenterRightTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreCenterRightTopLayoutProperty {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 right: self.right,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreCenterRightLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreCenterRightMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreCenterRightMiddleLayoutProperty {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 right: self.right,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreCenterRightLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreCenterRightBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreCenterRightBottomLayoutProperty {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 right: self.right,
					 bottom: bottom)
		
	}
	
}
