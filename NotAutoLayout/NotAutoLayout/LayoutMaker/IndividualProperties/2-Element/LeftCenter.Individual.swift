//
//  LeftCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftCenter {
		
		let left: LayoutElement.Horizontal
		
		let center: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.LeftCenter: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = IndividualProperty.LeftCenterTop
	
	public func storeTop <ParentView> (_ top: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.LeftCenter>) -> LayoutMaker<ParentView, IndividualProperty.LeftCenterTop> {
		
		let leftCenterTop = IndividualProperty.LeftCenterTop(left: self.left,
																center: self.center,
																top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftCenterTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.LeftCenter: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.LeftCenterMiddle
	
	public func storeMiddle <ParentView> (_ middle: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.LeftCenter>) -> LayoutMaker<ParentView, IndividualProperty.LeftCenterMiddle> {
		
		let leftCenterMiddle = IndividualProperty.LeftCenterMiddle(left: self.left,
																	  center: self.center,
																	  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftCenterMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.LeftCenter: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.LeftCenterBottom
	
	public func storeBottom <ParentView> (_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.LeftCenter>) -> LayoutMaker<ParentView, IndividualProperty.LeftCenterBottom> {
		
		let leftCenterBottom = IndividualProperty.LeftCenterBottom(left: self.left,
																	  center: self.center,
																	  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftCenterBottom)
		
		return maker
		
	}
	
}
