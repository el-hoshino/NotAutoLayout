//
//  Left.Individual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct Left<ParentView: UIView> {
		
		let left: LayoutElement.Horizontal<ParentView>
		
	}
	
}

extension IndividualProperty.Left: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Set A Line -
// MARK: Center
extension IndividualProperty.Left: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = IndividualProperty.LeftCenter<ParentView>
	
	public func storeCenter(_ center: LayoutElement.Horizontal<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Left<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.LeftCenter<ParentView>> {
		
		let leftCenter = IndividualProperty.LeftCenter(left: self.left,
													  center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftCenter)
		
		return maker
		
	}
	
}

// MARK: Right
extension IndividualProperty.Left: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = IndividualProperty.LeftRight<ParentView>
	
	public func storeRight(_ right: LayoutElement.Horizontal<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Left<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.LeftRight<ParentView>> {
		
		let leftRight = IndividualProperty.LeftRight(left: self.left,
														right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftRight)
		
		return maker
		
	}
	
}

// MARK: Top
extension IndividualProperty.Left: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = IndividualProperty.LeftTop<ParentView>
	
	public func storeTop(_ top: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Left<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.LeftTop<ParentView>> {
		
		let leftTop = IndividualProperty.LeftTop(left: self.left,
													top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.Left: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.LeftMiddle<ParentView>
	
	public func storeMiddle(_ middle: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Left<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.LeftMiddle<ParentView>> {
		
		let leftMiddle = IndividualProperty.LeftMiddle(left: self.left,
														  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.Left: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.LeftBottom<ParentView>
	
	public func storeBottom(_ bottom: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Left<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.LeftBottom<ParentView>> {
		
		let leftBottom = IndividualProperty.LeftBottom(left: self.left,
														  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftBottom)
		
		return maker
		
	}
	
}
