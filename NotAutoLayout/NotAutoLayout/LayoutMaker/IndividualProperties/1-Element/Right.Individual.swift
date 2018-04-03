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
	
	public func storeTop(_ top: LayoutElement.Vertical) -> IndividualProperty.RightTop {
		
		let rightTop = IndividualProperty.RightTop(right: self.right,
												   top: top)
		
		return rightTop
		
	}
	
}

// MARK: Middle
extension IndividualProperty.Right: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.RightMiddle
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Right>) -> LayoutMaker<IndividualProperty.RightMiddle> {
		
		let rightMiddle = IndividualProperty.RightMiddle(right: self.right,
															middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.Right: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.RightBottom
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Right>) -> LayoutMaker<IndividualProperty.RightBottom> {
		
		let rightBottom = IndividualProperty.RightBottom(right: self.right,
															bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightBottom)
		
		return maker
		
	}
	
}
