//
//  Center.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Set A Line -
// MARK: Right
extension IndividualProperty.Center: LayoutPropertyCanStoreRightType {
	
	public func storeRight(_ right: LayoutElement.Horizontal) -> IndividualProperty.CenterRight {
		
		let centerRight = IndividualProperty.CenterRight(center: self.center,
														 right: right)
		
		return centerRight
		
	}
	
}

// MARK: Top
extension IndividualProperty.Center: LayoutPropertyCanStoreTopType {
	
	public func storeTop(_ top: LayoutElement.Vertical) -> IndividualProperty.CenterTop {
		
		let centerTop = IndividualProperty.CenterTop(center: self.center,
													 top: top)
		
		return centerTop
		
	}
	
}

// MARK: Middle
extension IndividualProperty.Center: LayoutPropertyCanStoreMiddleType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> IndividualProperty.CenterMiddle {
		
		let centerMiddle = IndividualProperty.CenterMiddle(center: self.center,
														   middle: middle)
		
		return centerMiddle
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.Center: LayoutPropertyCanStoreBottomType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> IndividualProperty.CenterBottom {
		
		let centerBottom = IndividualProperty.CenterBottom(center: self.center,
														   bottom: bottom)
		
		return centerBottom
		
	}
	
}
