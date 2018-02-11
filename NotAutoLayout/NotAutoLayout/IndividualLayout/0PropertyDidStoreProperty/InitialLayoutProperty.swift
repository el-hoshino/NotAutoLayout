//
//  InitialLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct InitialLayoutProperty: LayoutMakerPropertyType {
	
}

// MARK: - Set A Frame -
extension InitialLayoutProperty: LayoutPropertyCanStoreFrameToEvaluateFrameType {
		
    public func evaluateFrame(frame: LayoutElement.Rect, property: ViewFrameProperty) -> CGRect {
        
        let frame = frame.evaluated(from: property)
        
        return frame
        
    }
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension InitialLayoutProperty: LayoutPropertyCanStoreTopLeftType {
	
	public typealias WillSetTopLeftProperty = DidStoreTopLeftLayoutProperty
	
	public func storeTopLeft(_ topLeft: LayoutElement.Point, to maker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<DidStoreTopLeftLayoutProperty> {
		
		let topLeft = DidStoreTopLeftLayoutProperty(topLeft: topLeft)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeft)
		
		return maker
		
	}
	
}

// MARK: TopCenter
extension InitialLayoutProperty: LayoutPropertyCanStoreTopCenterType {
	
	public typealias WillSetTopCenterProperty = DidStoreTopCenterLayoutProperty
	
	public func storeTopCenter(_ topCenter: LayoutElement.Point, to maker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<DidStoreTopCenterLayoutProperty> {
		
		let topCenter = DidStoreTopCenterLayoutProperty(topCenter: topCenter)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenter)
		
		return maker
		
	}
	
}

// MARK: TopRight
extension InitialLayoutProperty: LayoutPropertyCanStoreTopRightType {
	
	public typealias WillSetTopRightProperty = DidStoreTopRightLayoutProperty
	
	public func storeTopRight(_ topRight: LayoutElement.Point, to maker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<DidStoreTopRightLayoutProperty> {
		
		let topRight = DidStoreTopRightLayoutProperty(topRight: topRight)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topRight)
		
		return maker
		
	}
	
}

// MARK: MiddleLeft
extension InitialLayoutProperty: LayoutPropertyCanStoreMiddleLeftType {
	
	public typealias WillSetMiddleLeftProperty = DidStoreMiddleLeftLayoutProperty
	
	public func storeMiddleLeft(_ middleLeft: LayoutElement.Point, to maker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<DidStoreMiddleLeftLayoutProperty> {
		
		let middleLeft = DidStoreMiddleLeftLayoutProperty(middleLeft: middleLeft)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleLeft)
		
		return maker
		
	}
	
}

// MARK: MiddleCenter
extension InitialLayoutProperty: LayoutPropertyCanStoreMiddleCenterType {
	
	public typealias WillSetMiddleCenterProperty = DidStoreMiddleCenterLayoutProperty
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point, to maker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<DidStoreMiddleCenterLayoutProperty> {
		
		let middleCenter = DidStoreMiddleCenterLayoutProperty(middleCenter: middleCenter)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenter)
		
		return maker
		
	}
	
}

// MARK: MiddleRight
extension InitialLayoutProperty: LayoutPropertyCanStoreMiddleRightType {
	
	public typealias WillSetMiddleRightProperty = DidStoreMiddleRightLayoutProperty
	
	public func storeMiddleRight(_ middleRight: LayoutElement.Point, to maker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<DidStoreMiddleRightLayoutProperty> {
		
		let middleRight = DidStoreMiddleRightLayoutProperty(middleRight: middleRight)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRight)
		
		return maker
		
	}
	
}

// MARK: BottomLeft
extension InitialLayoutProperty: LayoutPropertyCanStoreBottomLeftType {
	
	public typealias WillSetBottomLeftProperty = DidStoreBottomLeftLayoutProperty
	
	public func storeBottomLeft(_ bottomLeft: LayoutElement.Point, to maker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<DidStoreBottomLeftLayoutProperty> {
		
		let bottomLeft = DidStoreBottomLeftLayoutProperty(bottomLeft: bottomLeft)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeft)
		
		return maker
		
	}
	
}

// MARK: BottomCenter
extension InitialLayoutProperty: LayoutPropertyCanStoreBottomCenterType {
	
	public typealias WillSetBottomCenterProperty = DidStoreBottomCenterLayoutProperty
	
	public func storeBottomCenter(_ bottomCenter: LayoutElement.Point, to maker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<DidStoreBottomCenterLayoutProperty> {
		
		let bottomCenter = DidStoreBottomCenterLayoutProperty(bottomCenter: bottomCenter)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenter)
		
		return maker
		
	}
	
}

// MARK: BottomRight
extension InitialLayoutProperty: LayoutPropertyCanStoreBottomRightType {
	
	public typealias WillSetBottomRightProperty = DidStoreBottomRightLayoutProperty
	
	public func storeBottomRight(_ bottomRight: LayoutElement.Point, to maker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<DidStoreBottomRightLayoutProperty> {
		
		let bottomRight = DidStoreBottomRightLayoutProperty(bottomRight: bottomRight)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomRight)
		
		return maker
		
	}
	
}

// MARK: - Set Horizontal -
// MARK: Left
extension InitialLayoutProperty: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = DidStoreLeftLayoutProperty
	
	public func storeLeft(_ left: LayoutElement.Horizontal, to maker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<DidStoreLeftLayoutProperty> {
		
		let left = DidStoreLeftLayoutProperty(left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: left)
		
		return maker
		
	}
	
}

// MARK: Center
extension InitialLayoutProperty: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Horizontal, to maker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<DidStoreCenterLayoutProperty> {
		
		let center = DidStoreCenterLayoutProperty(center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: center)
		
		return maker
		
	}
	
}

// MARK: Right
extension InitialLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<DidStoreRightLayoutProperty> {
		
		let right = DidStoreRightLayoutProperty(right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: right)
		
		return maker
		
	}
	
}
