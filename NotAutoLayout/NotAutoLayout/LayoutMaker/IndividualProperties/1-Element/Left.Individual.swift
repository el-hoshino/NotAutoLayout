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
	
	public typealias WillSetTopProperty = IndividualProperty.LeftTop
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Left>) -> LayoutMaker<IndividualProperty.LeftTop> {
		
		let leftTop = IndividualProperty.LeftTop(left: self.left,
													top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.Left: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.LeftMiddle
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Left>) -> LayoutMaker<IndividualProperty.LeftMiddle> {
		
		let leftMiddle = IndividualProperty.LeftMiddle(left: self.left,
														  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.Left: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.LeftBottom
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.Left>) -> LayoutMaker<IndividualProperty.LeftBottom> {
		
		let leftBottom = IndividualProperty.LeftBottom(left: self.left,
														  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftBottom)
		
		return maker
		
	}
	
}
