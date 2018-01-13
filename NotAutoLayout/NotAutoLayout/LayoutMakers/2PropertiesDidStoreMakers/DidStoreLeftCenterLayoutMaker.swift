//
//  DidStoreLeftCenterLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftCenterLayoutProperty {
		
	let left: LayoutElement.Horizontal
	
	let center: LayoutElement.Horizontal
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreLeftCenterLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreLeftCenterTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreLeftCenterTopLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: self.center,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreLeftCenterLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreLeftCenterMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreLeftCenterMiddleLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: self.center,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreLeftCenterLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreLeftCenterBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreLeftCenterBottomLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: self.center,
					 bottom: bottom)
		
	}
	
}

