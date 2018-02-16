//
//  LayoutProperty.Initial.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension LayoutProperty {
	
	public struct Initial: LayoutMakerPropertyType {
		
	}
	
}

// MARK: - Set A Frame -
extension LayoutProperty.Initial: LayoutPropertyCanStoreFrameToEvaluateFrameType {
		
    public func evaluateFrame(frame: LayoutElement.Rect, parameters: IndividualFrameCalculationParameters) -> CGRect {
        
        let frame = frame.evaluated(from: parameters)
        
        return frame
        
    }
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension LayoutProperty.Initial: LayoutPropertyCanStoreTopLeftType {
	
	public typealias WillSetTopLeftProperty = DidStoreTopLeftLayoutProperty
	
	public func storeTopLeft(_ topLeft: LayoutElement.Point, to maker: LayoutMaker<LayoutProperty.Initial>) -> LayoutMaker<DidStoreTopLeftLayoutProperty> {
		
		let topLeft = DidStoreTopLeftLayoutProperty(topLeft: topLeft)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeft)
		
		return maker
		
	}
	
}

// MARK: TopCenter
extension LayoutProperty.Initial: LayoutPropertyCanStoreTopCenterType {
	
	public typealias WillSetTopCenterProperty = DidStoreTopCenterLayoutProperty
	
	public func storeTopCenter(_ topCenter: LayoutElement.Point, to maker: LayoutMaker<LayoutProperty.Initial>) -> LayoutMaker<DidStoreTopCenterLayoutProperty> {
		
		let topCenter = DidStoreTopCenterLayoutProperty(topCenter: topCenter)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenter)
		
		return maker
		
	}
	
}

// MARK: TopRight
extension LayoutProperty.Initial: LayoutPropertyCanStoreTopRightType {
	
	public typealias WillSetTopRightProperty = DidStoreTopRightLayoutProperty
	
	public func storeTopRight(_ topRight: LayoutElement.Point, to maker: LayoutMaker<LayoutProperty.Initial>) -> LayoutMaker<DidStoreTopRightLayoutProperty> {
		
		let topRight = DidStoreTopRightLayoutProperty(topRight: topRight)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topRight)
		
		return maker
		
	}
	
}

// MARK: MiddleLeft
extension LayoutProperty.Initial: LayoutPropertyCanStoreMiddleLeftType {
	
	public typealias WillSetMiddleLeftProperty = DidStoreMiddleLeftLayoutProperty
	
	public func storeMiddleLeft(_ middleLeft: LayoutElement.Point, to maker: LayoutMaker<LayoutProperty.Initial>) -> LayoutMaker<DidStoreMiddleLeftLayoutProperty> {
		
		let middleLeft = DidStoreMiddleLeftLayoutProperty(middleLeft: middleLeft)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleLeft)
		
		return maker
		
	}
	
}

// MARK: MiddleCenter
extension LayoutProperty.Initial: LayoutPropertyCanStoreMiddleCenterType {
	
	public typealias WillSetMiddleCenterProperty = DidStoreMiddleCenterLayoutProperty
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point, to maker: LayoutMaker<LayoutProperty.Initial>) -> LayoutMaker<DidStoreMiddleCenterLayoutProperty> {
		
		let middleCenter = DidStoreMiddleCenterLayoutProperty(middleCenter: middleCenter)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenter)
		
		return maker
		
	}
	
}

// MARK: MiddleRight
extension LayoutProperty.Initial: LayoutPropertyCanStoreMiddleRightType {
	
	public typealias WillSetMiddleRightProperty = DidStoreMiddleRightLayoutProperty
	
	public func storeMiddleRight(_ middleRight: LayoutElement.Point, to maker: LayoutMaker<LayoutProperty.Initial>) -> LayoutMaker<DidStoreMiddleRightLayoutProperty> {
		
		let middleRight = DidStoreMiddleRightLayoutProperty(middleRight: middleRight)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRight)
		
		return maker
		
	}
	
}

// MARK: BottomLeft
extension LayoutProperty.Initial: LayoutPropertyCanStoreBottomLeftType {
	
	public typealias WillSetBottomLeftProperty = DidStoreBottomLeftLayoutProperty
	
	public func storeBottomLeft(_ bottomLeft: LayoutElement.Point, to maker: LayoutMaker<LayoutProperty.Initial>) -> LayoutMaker<DidStoreBottomLeftLayoutProperty> {
		
		let bottomLeft = DidStoreBottomLeftLayoutProperty(bottomLeft: bottomLeft)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeft)
		
		return maker
		
	}
	
}

// MARK: BottomCenter
extension LayoutProperty.Initial: LayoutPropertyCanStoreBottomCenterType {
	
	public typealias WillSetBottomCenterProperty = DidStoreBottomCenterLayoutProperty
	
	public func storeBottomCenter(_ bottomCenter: LayoutElement.Point, to maker: LayoutMaker<LayoutProperty.Initial>) -> LayoutMaker<DidStoreBottomCenterLayoutProperty> {
		
		let bottomCenter = DidStoreBottomCenterLayoutProperty(bottomCenter: bottomCenter)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenter)
		
		return maker
		
	}
	
}

// MARK: BottomRight
extension LayoutProperty.Initial: LayoutPropertyCanStoreBottomRightType {
	
	public typealias WillSetBottomRightProperty = DidStoreBottomRightLayoutProperty
	
	public func storeBottomRight(_ bottomRight: LayoutElement.Point, to maker: LayoutMaker<LayoutProperty.Initial>) -> LayoutMaker<DidStoreBottomRightLayoutProperty> {
		
		let bottomRight = DidStoreBottomRightLayoutProperty(bottomRight: bottomRight)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomRight)
		
		return maker
		
	}
	
}

// MARK: - Set Horizontal -
// MARK: Left
extension LayoutProperty.Initial: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = DidStoreLeftLayoutProperty
	
	public func storeLeft(_ left: LayoutElement.Horizontal, to maker: LayoutMaker<LayoutProperty.Initial>) -> LayoutMaker<DidStoreLeftLayoutProperty> {
		
		let left = DidStoreLeftLayoutProperty(left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: left)
		
		return maker
		
	}
	
}

// MARK: Center
extension LayoutProperty.Initial: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Horizontal, to maker: LayoutMaker<LayoutProperty.Initial>) -> LayoutMaker<DidStoreCenterLayoutProperty> {
		
		let center = DidStoreCenterLayoutProperty(center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: center)
		
		return maker
		
	}
	
}

// MARK: Right
extension LayoutProperty.Initial: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<LayoutProperty.Initial>) -> LayoutMaker<DidStoreRightLayoutProperty> {
		
		let right = DidStoreRightLayoutProperty(right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: right)
		
		return maker
		
	}
	
}
