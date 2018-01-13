//
//  DidStoreCenterLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterLayoutProperty {
		
	let center: LayoutElement.Horizontal
	
}

// MARK: - Set A Line -
// MARK: Right
extension DidStoreCenterLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreCenterRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreCenterRightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 right: right)
		
	}
	
}

// MARK: Top
extension DidStoreCenterLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreCenterTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreCenterTopLayoutProperty {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreCenterLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreCenterMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreCenterMiddleLayoutProperty {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreCenterLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreCenterBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreCenterBottomLayoutProperty {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 bottom: bottom)
		
	}
	
}
