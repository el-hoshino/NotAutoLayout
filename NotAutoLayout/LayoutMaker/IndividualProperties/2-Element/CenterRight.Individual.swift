//
//  CenterRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.CenterRight: LayoutPropertyCanStoreTopType {
	
	public func storeTop(_ top: LayoutElement.Vertical) -> IndividualProperty.CenterRightTop {
		
		let centerRightTop = IndividualProperty.CenterRightTop(center: self.center,
															   right: self.right,
															   top: top)
		
		return centerRightTop
		
	}
	
}

// MARK: Middle
extension IndividualProperty.CenterRight: LayoutPropertyCanStoreMiddleType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> IndividualProperty.CenterRightMiddle {
		
		let centerRightMiddle = IndividualProperty.CenterRightMiddle(center: self.center,
																	 right: self.right,
																	 middle: middle)
		
		return centerRightMiddle
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.CenterRight: LayoutPropertyCanStoreBottomType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> IndividualProperty.CenterRightBottom {
		
		let centerRightBottom = IndividualProperty.CenterRightBottom(center: self.center,
																	 right: self.right,
																	 bottom: bottom)
		
		return centerRightBottom
		
	}
	
}
