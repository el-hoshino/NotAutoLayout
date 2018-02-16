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

extension IndividualProperty.Right {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.Right: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = IndividualProperty.RightTop<ParentView>
	
	public func storeTop(_ top: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Right<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.RightTop<ParentView>> {
		
		let rightTop = IndividualProperty.RightTop(right: self.right,
													  top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.Right: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.RightMiddle<ParentView>
	
	public func storeMiddle(_ middle: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Right<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.RightMiddle<ParentView>> {
		
		let rightMiddle = IndividualProperty.RightMiddle(right: self.right,
															middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.Right: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.RightBottom<ParentView>
	
	public func storeBottom(_ bottom: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Right<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.RightBottom<ParentView>> {
		
		let rightBottom = IndividualProperty.RightBottom(right: self.right,
															bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightBottom)
		
		return maker
		
	}
	
}
