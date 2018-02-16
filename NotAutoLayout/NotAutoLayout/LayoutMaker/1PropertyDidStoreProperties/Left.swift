//
//  LayoutProperty.Left.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension LayoutProperty {
	
	public struct Left: LayoutMakerPropertyType {
		
		let left: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension LayoutProperty.Left: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreLeftCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Horizontal, to maker: LayoutMaker<LayoutProperty.Left>) -> LayoutMaker<DidStoreLeftCenterLayoutProperty> {
		
		let leftCenter = DidStoreLeftCenterLayoutProperty(left: self.left,
													  center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftCenter)
		
		return maker
		
	}
	
}

// MARK: Right
extension LayoutProperty.Left: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreLeftRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<LayoutProperty.Left>) -> LayoutMaker<DidStoreLeftRightLayoutProperty> {
		
		let leftRight = DidStoreLeftRightLayoutProperty(left: self.left,
														right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftRight)
		
		return maker
		
	}
	
}

// MARK: Top
extension LayoutProperty.Left: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreLeftTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<LayoutProperty.Left>) -> LayoutMaker<DidStoreLeftTopLayoutProperty> {
		
		let leftTop = DidStoreLeftTopLayoutProperty(left: self.left,
													top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension LayoutProperty.Left: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreLeftMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<LayoutProperty.Left>) -> LayoutMaker<DidStoreLeftMiddleLayoutProperty> {
		
		let leftMiddle = DidStoreLeftMiddleLayoutProperty(left: self.left,
														  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension LayoutProperty.Left: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreLeftBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<LayoutProperty.Left>) -> LayoutMaker<DidStoreLeftBottomLayoutProperty> {
		
		let leftBottom = DidStoreLeftBottomLayoutProperty(left: self.left,
														  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftBottom)
		
		return maker
		
	}
	
}
