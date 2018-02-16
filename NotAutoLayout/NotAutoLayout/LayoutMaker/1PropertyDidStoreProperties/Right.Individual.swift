//
//  Right.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct Right {
		
		let right: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.Right: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = IndividualProperty.RightTop
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Right>) -> LayoutMaker<IndividualProperty.RightTop> {
		
		let rightTop = IndividualProperty.RightTop(right: self.right,
													  top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.Right: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreRightMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Right>) -> LayoutMaker<DidStoreRightMiddleLayoutProperty> {
		
		let rightMiddle = DidStoreRightMiddleLayoutProperty(right: self.right,
															middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.Right: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreRightBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Right>) -> LayoutMaker<DidStoreRightBottomLayoutProperty> {
		
		let rightBottom = DidStoreRightBottomLayoutProperty(right: self.right,
															bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightBottom)
		
		return maker
		
	}
	
}
