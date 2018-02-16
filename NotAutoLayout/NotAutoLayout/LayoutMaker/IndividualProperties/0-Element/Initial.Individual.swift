//
//  Initial.Individual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct Initial {
		
	}
	
}

// MARK: - Set A Frame -
extension IndividualProperty.Initial: LayoutPropertyCanStoreFrameToEvaluateFrameType {
		
    public func evaluateFrame(frame: LayoutElement.Rect, parameters: IndividualFrameCalculationParameters) -> CGRect {
        
        let frame = frame.evaluated(from: parameters)
        
        return frame
        
    }
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension IndividualProperty.Initial: LayoutPropertyCanStoreTopLeftType {
	
	public typealias WillSetTopLeftProperty = IndividualProperty.TopLeft
	
	public func storeTopLeft(_ topLeft: LayoutElement.Point, to maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.TopLeft> {
		
		let topLeft = IndividualProperty.TopLeft(topLeft: topLeft)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeft)
		
		return maker
		
	}
	
}

// MARK: TopCenter
extension IndividualProperty.Initial: LayoutPropertyCanStoreTopCenterType {
	
	public typealias WillSetTopCenterProperty = IndividualProperty.TopCenter
	
	public func storeTopCenter(_ topCenter: LayoutElement.Point, to maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.TopCenter> {
		
		let topCenter = IndividualProperty.TopCenter(topCenter: topCenter)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenter)
		
		return maker
		
	}
	
}

// MARK: TopRight
extension IndividualProperty.Initial: LayoutPropertyCanStoreTopRightType {
	
	public typealias WillSetTopRightProperty = IndividualProperty.TopRight
	
	public func storeTopRight(_ topRight: LayoutElement.Point, to maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.TopRight> {
		
		let topRight = IndividualProperty.TopRight(topRight: topRight)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topRight)
		
		return maker
		
	}
	
}

// MARK: MiddleLeft
extension IndividualProperty.Initial: LayoutPropertyCanStoreMiddleLeftType {
	
	public typealias WillSetMiddleLeftProperty = IndividualProperty.MiddleLeft
	
	public func storeMiddleLeft(_ middleLeft: LayoutElement.Point, to maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.MiddleLeft> {
		
		let middleLeft = IndividualProperty.MiddleLeft(middleLeft: middleLeft)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleLeft)
		
		return maker
		
	}
	
}

// MARK: MiddleCenter
extension IndividualProperty.Initial: LayoutPropertyCanStoreMiddleCenterType {
	
	public typealias WillSetMiddleCenterProperty = IndividualProperty.MiddleCenter
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point, to maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.MiddleCenter> {
		
		let middleCenter = IndividualProperty.MiddleCenter(middleCenter: middleCenter)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenter)
		
		return maker
		
	}
	
}

// MARK: MiddleRight
extension IndividualProperty.Initial: LayoutPropertyCanStoreMiddleRightType {
	
	public typealias WillSetMiddleRightProperty = IndividualProperty.MiddleRight
	
	public func storeMiddleRight(_ middleRight: LayoutElement.Point, to maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.MiddleRight> {
		
		let middleRight = IndividualProperty.MiddleRight(middleRight: middleRight)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRight)
		
		return maker
		
	}
	
}

// MARK: BottomLeft
extension IndividualProperty.Initial: LayoutPropertyCanStoreBottomLeftType {
	
	public typealias WillSetBottomLeftProperty = IndividualProperty.BottomLeft
	
	public func storeBottomLeft(_ bottomLeft: LayoutElement.Point, to maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.BottomLeft> {
		
		let bottomLeft = IndividualProperty.BottomLeft(bottomLeft: bottomLeft)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeft)
		
		return maker
		
	}
	
}

// MARK: BottomCenter
extension IndividualProperty.Initial: LayoutPropertyCanStoreBottomCenterType {
	
	public typealias WillSetBottomCenterProperty = IndividualProperty.BottomCenter
	
	public func storeBottomCenter(_ bottomCenter: LayoutElement.Point, to maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.BottomCenter> {
		
		let bottomCenter = IndividualProperty.BottomCenter(bottomCenter: bottomCenter)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenter)
		
		return maker
		
	}
	
}

// MARK: BottomRight
extension IndividualProperty.Initial: LayoutPropertyCanStoreBottomRightType {
	
	public typealias WillSetBottomRightProperty = IndividualProperty.BottomRight
	
	public func storeBottomRight(_ bottomRight: LayoutElement.Point, to maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.BottomRight> {
		
		let bottomRight = IndividualProperty.BottomRight(bottomRight: bottomRight)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomRight)
		
		return maker
		
	}
	
}

// MARK: - Set Horizontal -
// MARK: Left
extension IndividualProperty.Initial: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = IndividualProperty.Left
	
	public func storeLeft(_ left: LayoutElement.Horizontal, to maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.Left> {
		
		let left = IndividualProperty.Left(left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: left)
		
		return maker
		
	}
	
}

// MARK: Center
extension IndividualProperty.Initial: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = IndividualProperty.Center
	
	public func storeCenter(_ center: LayoutElement.Horizontal, to maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.Center> {
		
		let center = IndividualProperty.Center(center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: center)
		
		return maker
		
	}
	
}

// MARK: Right
extension IndividualProperty.Initial: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = IndividualProperty.Right
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.Right> {
		
		let right = IndividualProperty.Right(right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: right)
		
		return maker
		
	}
	
}
