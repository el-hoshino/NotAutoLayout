//
//  IndividualProperty.LeftRight.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftRight {
		
		let left: LayoutElement.Horizontal
		
		let right: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.LeftRight: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = DidStoreLeftRightTopLayoutProperty
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.LeftRight>) -> LayoutMaker<DidStoreLeftRightTopLayoutProperty> {
		
		let leftRightTop = DidStoreLeftRightTopLayoutProperty(left: self.left,
															  right: self.right,
															  top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftRightTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.LeftRight: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreLeftRightMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.LeftRight>) -> LayoutMaker<DidStoreLeftRightMiddleLayoutProperty> {
		
		let leftRightMiddle = DidStoreLeftRightMiddleLayoutProperty(left: self.left,
																	right: self.right,
																	middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftRightMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.LeftRight: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreLeftRightBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.LeftRight>) -> LayoutMaker<DidStoreLeftRightBottomLayoutProperty> {
		
		let leftRightBottom = DidStoreLeftRightBottomLayoutProperty(left: self.left,
																	right: self.right,
																	bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftRightBottom)
		
		return maker
		
	}
	
}
