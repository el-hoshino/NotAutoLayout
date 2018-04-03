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
	
	public func storeTop(_ top: LayoutElement.Vertical) -> IndividualProperty.LeftCenterTop {
		
		let leftCenterTop = IndividualProperty.LeftCenterTop(left: self.left,
															 center: self.center,
															 top: top)
		
		return leftCenterTop
		
	}
	
}

// MARK: Middle
extension IndividualProperty.LeftCenter: LayoutPropertyCanStoreMiddleType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> IndividualProperty.LeftCenterMiddle {
		
		let leftCenterMiddle = IndividualProperty.LeftCenterMiddle(left: self.left,
																   center: self.center,
																   middle: middle)
		
		return leftCenterMiddle
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.LeftCenter: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.LeftCenterBottom
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.LeftCenter>) -> LayoutMaker<IndividualProperty.LeftCenterBottom> {
		
		let leftCenterBottom = IndividualProperty.LeftCenterBottom(left: self.left,
																	  center: self.center,
																	  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftCenterBottom)
		
		return maker
		
	}
	
}
