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
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreRightTopLayoutProperty {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreRightLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreRightMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreRightMiddleLayoutProperty {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreRightLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreRightBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreRightBottomLayoutProperty {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 bottom: bottom)
		
	}
	
}
