//
//  CenterRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterRight {
		
		let center: LayoutElement.Horizontal
		
		let right: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.CenterRight: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreCenterRightTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.CenterRight>) -> LayoutMaker<DidStoreCenterRightTopLayoutProperty> {
		
		let centerRightTop = DidStoreCenterRightTopLayoutProperty(center: self.center,
																  right: self.right,
																  top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerRightTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.CenterRight: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreCenterRightMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.CenterRight>) -> LayoutMaker<DidStoreCenterRightMiddleLayoutProperty> {
		
		let centerRightMiddle = DidStoreCenterRightMiddleLayoutProperty(center: self.center,
																		right: self.right,
																		middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerRightMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.CenterRight: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreCenterRightBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.CenterRight>) -> LayoutMaker<DidStoreCenterRightBottomLayoutProperty> {
		
		let centerRightBottom = DidStoreCenterRightBottomLayoutProperty(center: self.center,
																		right: self.right,
																		bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerRightBottom)
		
		return maker
		
	}
	
}
