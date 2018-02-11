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
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<DidStoreCenterLayoutProperty>) -> LayoutMaker<DidStoreCenterRightLayoutProperty> {
		
		let centerRight = DidStoreCenterRightLayoutProperty(center: self.center,
															right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerRight)
		
		return maker
		
	}
	
}

// MARK: Top
extension DidStoreCenterLayoutProperty: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreCenterTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreCenterLayoutProperty>) -> LayoutMaker<DidStoreCenterTopLayoutProperty> {
		
		let centerTop = DidStoreCenterTopLayoutProperty(center: self.center,
														top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension DidStoreCenterLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreCenterMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreCenterLayoutProperty>) -> LayoutMaker<DidStoreCenterMiddleLayoutProperty> {
		
		let centerMiddle = DidStoreCenterMiddleLayoutProperty(center: self.center,
															  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension DidStoreCenterLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreCenterBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreCenterLayoutProperty>) -> LayoutMaker<DidStoreCenterBottomLayoutProperty> {
		
		let centerBottom = DidStoreCenterBottomLayoutProperty(center: self.center,
															  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerBottom)
		
		return maker
		
	}
	
}
