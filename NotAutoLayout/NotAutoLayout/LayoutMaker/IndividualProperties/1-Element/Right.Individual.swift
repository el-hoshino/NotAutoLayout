//
//  Right.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct Right<ParentView: UIView> {
		
		let right: LayoutElement.Horizontal<ParentView>
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.Right: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = IndividualProperty.RightTop
	
	public func storeTop <ParentView> (_ top: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.Right>) -> LayoutMaker<ParentView, IndividualProperty.RightTop> {
		
		let rightTop = IndividualProperty.RightTop(right: self.right,
													  top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.Right: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.RightMiddle
	
	public func storeMiddle <ParentView> (_ middle: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.Right>) -> LayoutMaker<ParentView, IndividualProperty.RightMiddle> {
		
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
	
	public func storeBottom <ParentView> (_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.Right>) -> LayoutMaker<ParentView, IndividualProperty.RightBottom> {
		
		let rightBottom = IndividualProperty.RightBottom(right: self.right,
															bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightBottom)
		
		return maker
		
	}
	
}
