//
//  LeftRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftRight<ParentView: UIView> {
		
		let left: LayoutElement.Horizontal<ParentView>
		
		let right: LayoutElement.Horizontal<ParentView>
		
	}
	
}

extension IndividualProperty.LeftRight: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.LeftRight: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = IndividualProperty.LeftRightTop<ParentView>
	
	public func storeTop(_ top: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.LeftRight<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.LeftRightTop<ParentView>> {
		
		let leftRightTop = IndividualProperty.LeftRightTop(left: self.left,
															  right: self.right,
															  top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftRightTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.LeftRight: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.LeftRightMiddle<ParentView>
	
	public func storeMiddle(_ middle: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.LeftRight<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.LeftRightMiddle<ParentView>> {
		
		let leftRightMiddle = IndividualProperty.LeftRightMiddle(left: self.left,
																	right: self.right,
																	middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftRightMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.LeftRight: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.LeftRightBottom<ParentView>
	
	public func storeBottom(_ bottom: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.LeftRight<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.LeftRightBottom<ParentView>> {
		
		let leftRightBottom = IndividualProperty.LeftRightBottom(left: self.left,
																	right: self.right,
																	bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftRightBottom)
		
		return maker
		
	}
	
}
