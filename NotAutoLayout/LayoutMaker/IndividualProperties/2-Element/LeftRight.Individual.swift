//
//  LeftRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.LeftRight: LayoutPropertyCanStoreTopType {
	
	public func storeTop(_ top: LayoutElement.Vertical) -> IndividualProperty.LeftRightTop {
		
		let leftRightTop = IndividualProperty.LeftRightTop(left: self.left,
														   right: self.right,
														   top: top)
		
		return leftRightTop
		
	}
	
}

// MARK: Middle
extension IndividualProperty.LeftRight: LayoutPropertyCanStoreMiddleType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> IndividualProperty.LeftRightMiddle {
		
		let leftRightMiddle = IndividualProperty.LeftRightMiddle(left: self.left,
																 right: self.right,
																 middle: middle)
		
		return leftRightMiddle
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.LeftRight: LayoutPropertyCanStoreBottomType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> IndividualProperty.LeftRightBottom {
		
		let leftRightBottom = IndividualProperty.LeftRightBottom(left: self.left,
																 right: self.right,
																 bottom: bottom)
		
		return leftRightBottom
		
	}
	
}
