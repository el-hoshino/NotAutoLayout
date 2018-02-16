//
//  Center.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct Center {
		
		let center: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Set A Line -
// MARK: Right
extension IndividualProperty.Center: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = IndividualProperty.CenterRight
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<IndividualProperty.Center>) -> LayoutMaker<IndividualProperty.CenterRight> {
		
		let centerRight = IndividualProperty.CenterRight(center: self.center,
															right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerRight)
		
		return maker
		
	}
	
}

// MARK: Top
extension IndividualProperty.Center: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreCenterTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Center>) -> LayoutMaker<DidStoreCenterTopLayoutProperty> {
		
		let centerTop = DidStoreCenterTopLayoutProperty(center: self.center,
														top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.Center: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreCenterMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Center>) -> LayoutMaker<DidStoreCenterMiddleLayoutProperty> {
		
		let centerMiddle = DidStoreCenterMiddleLayoutProperty(center: self.center,
															  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.Center: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreCenterBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Center>) -> LayoutMaker<DidStoreCenterBottomLayoutProperty> {
		
		let centerBottom = DidStoreCenterBottomLayoutProperty(center: self.center,
															  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerBottom)
		
		return maker
		
	}
	
}
