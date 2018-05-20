//
//  Left.Individual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct Left {
		
		let left: LayoutElement.Horizontal
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension IndividualProperty.Left: LayoutPropertyCanStoreCenterType {
	
	public func storeCenter(_ center: LayoutElement.Horizontal) -> IndividualProperty.LeftCenter {
		
		let leftCenter = IndividualProperty.LeftCenter(left: self.left,
													   center: center)
		
		return leftCenter
		
	}
	
}

// MARK: Right
extension IndividualProperty.Left: LayoutPropertyCanStoreRightType {
	
	public func storeRight(_ right: LayoutElement.Horizontal) -> IndividualProperty.LeftRight {
		
		let leftRight = IndividualProperty.LeftRight(left: self.left,
													 right: right)
		
		return leftRight
		
	}
	
}

// MARK: Top
extension IndividualProperty.Left: LayoutPropertyCanStoreTopType {
	
	public func storeTop(_ top: LayoutElement.Vertical) -> IndividualProperty.LeftTop {
		
		let leftTop = IndividualProperty.LeftTop(left: self.left,
												 top: top)
		
		return leftTop
		
	}
	
}

// MARK: Middle
extension IndividualProperty.Left: LayoutPropertyCanStoreMiddleType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> IndividualProperty.LeftMiddle {
		
		let leftMiddle = IndividualProperty.LeftMiddle(left: self.left,
													   middle: middle)
		
		return leftMiddle
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.Left: LayoutPropertyCanStoreBottomType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> IndividualProperty.LeftBottom {
		
		let leftBottom = IndividualProperty.LeftBottom(left: self.left,
													   bottom: bottom)
		
		return leftBottom
		
	}
	
}
