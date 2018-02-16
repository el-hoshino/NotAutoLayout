//
//  CenterRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterRight<ParentView: UIView> {
		
		let center: LayoutElement.Horizontal<ParentView>
		
		let right: LayoutElement.Horizontal<ParentView>
		
	}
	
}

extension IndividualProperty.CenterRight: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.CenterRight: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = IndividualProperty.CenterRightTop<ParentView>
	
	public func storeTop(_ top: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.CenterRight<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.CenterRightTop<ParentView>> {
		
		let centerRightTop = IndividualProperty.CenterRightTop(center: self.center,
																  right: self.right,
																  top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerRightTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.CenterRight: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.CenterRightMiddle<ParentView>
	
	public func storeMiddle(_ middle: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.CenterRight<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.CenterRightMiddle<ParentView>> {
		
		let centerRightMiddle = IndividualProperty.CenterRightMiddle(center: self.center,
																		right: self.right,
																		middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerRightMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.CenterRight: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.CenterRightBottom<ParentView>
	
	public func storeBottom(_ bottom: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.CenterRight<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.CenterRightBottom<ParentView>> {
		
		let centerRightBottom = IndividualProperty.CenterRightBottom(center: self.center,
																		right: self.right,
																		bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerRightBottom)
		
		return maker
		
	}
	
}
