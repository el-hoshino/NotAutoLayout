//
//  Right.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.Right: LayoutPropertyCanStoreTopType {
	
	public func storeTop(_ top: LayoutElement.Vertical) -> IndividualProperty.RightTop {
		
		let rightTop = IndividualProperty.RightTop(right: self.right,
												   top: top)
		
		return rightTop
		
	}
	
}

// MARK: Middle
extension IndividualProperty.Right: LayoutPropertyCanStoreMiddleType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> IndividualProperty.RightMiddle {
		
		let rightMiddle = IndividualProperty.RightMiddle(right: self.right,
														 middle: middle)
		
		return rightMiddle
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.Right: LayoutPropertyCanStoreBottomType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> IndividualProperty.RightBottom {
		
		let rightBottom = IndividualProperty.RightBottom(right: self.right,
														 bottom: bottom)
		
		return rightBottom
		
	}
	
}
