//
//  DidStoreLeftRightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftRightLayoutProperty {
	
	let left: LayoutElement.Horizontal
	
	let right: LayoutElement.Horizontal
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreLeftRightLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreLeftRightTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreLeftRightTopLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: self.right,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreLeftRightLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreLeftRightMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreLeftRightMiddleLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: self.right,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreLeftRightLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreLeftRightBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreLeftRightBottomLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: self.right,
					 bottom: bottom)
		
	}
	
}

