//
//  DidStoreLeftLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftLayoutProperty {
	
	let left: LayoutElement.Horizontal
	
}

// MARK: - Set A Line -
// MARK: Center
extension DidStoreLeftLayoutProperty: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreLeftCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Line) -> DidStoreLeftCenterLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: center)
		
	}
	
}

// MARK: Right
extension DidStoreLeftLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreLeftRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreLeftRightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: right)
		
	}
	
}

// MARK: Top
extension DidStoreLeftLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreLeftTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreLeftTopLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreLeftLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreLeftMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreLeftMiddleLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreLeftLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreLeftBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreLeftBottomLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 bottom: bottom)
		
	}
	
}

