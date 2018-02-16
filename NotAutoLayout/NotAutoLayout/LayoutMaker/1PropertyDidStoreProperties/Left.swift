//
//  LayoutProperty.Left.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct Left: LayoutMakerPropertyType {
		
		let left: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension IndividualProperty.Left: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = IndividualProperty.LeftCenter
	
	public func storeCenter(_ center: LayoutElement.Horizontal, to maker: LayoutMaker<IndividualProperty.Left>) -> LayoutMaker<IndividualProperty.LeftCenter> {
		
		let leftCenter = IndividualProperty.LeftCenter(left: self.left,
													  center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftCenter)
		
		return maker
		
	}
	
}

// MARK: Right
extension IndividualProperty.Left: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = IndividualProperty.LeftRight
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<IndividualProperty.Left>) -> LayoutMaker<IndividualProperty.LeftRight> {
		
		let leftRight = IndividualProperty.LeftRight(left: self.left,
														right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftRight)
		
		return maker
		
	}
	
}

// MARK: Top
extension IndividualProperty.Left: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreLeftTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Left>) -> LayoutMaker<DidStoreLeftTopLayoutProperty> {
		
		let leftTop = DidStoreLeftTopLayoutProperty(left: self.left,
													top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.Left: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreLeftMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Left>) -> LayoutMaker<DidStoreLeftMiddleLayoutProperty> {
		
		let leftMiddle = DidStoreLeftMiddleLayoutProperty(left: self.left,
														  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.Left: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreLeftBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Left>) -> LayoutMaker<DidStoreLeftBottomLayoutProperty> {
		
		let leftBottom = DidStoreLeftBottomLayoutProperty(left: self.left,
														  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftBottom)
		
		return maker
		
	}
	
}
