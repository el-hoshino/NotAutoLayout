//
//  Center.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct Center<ParentView: UIView> {
		
		let center: LayoutElement.Horizontal<ParentView>
		
	}
	
}

extension IndividualProperty.Center: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Set A Line -
// MARK: Right
extension IndividualProperty.Center: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = IndividualProperty.CenterRight<ParentView>
	
	public func storeRight(_ right: LayoutElement.Horizontal<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Center<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.CenterRight<ParentView>> {
		
		let centerRight = IndividualProperty.CenterRight(center: self.center,
															right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerRight)
		
		return maker
		
	}
	
}

// MARK: Top
extension IndividualProperty.Center: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = IndividualProperty.CenterTop<ParentView>
	
	public func storeTop(_ top: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Center<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.CenterTop<ParentView>> {
		
		let centerTop = IndividualProperty.CenterTop(center: self.center,
														top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.Center: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.CenterMiddle<ParentView>
	
	public func storeMiddle(_ middle: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Center<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.CenterMiddle<ParentView>> {
		
		let centerMiddle = IndividualProperty.CenterMiddle(center: self.center,
															  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.Center: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.CenterBottom<ParentView>
	
	public func storeBottom(_ bottom: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Center<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.CenterBottom<ParentView>> {
		
		let centerBottom = IndividualProperty.CenterBottom(center: self.center,
															  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerBottom)
		
		return maker
		
	}
	
}
