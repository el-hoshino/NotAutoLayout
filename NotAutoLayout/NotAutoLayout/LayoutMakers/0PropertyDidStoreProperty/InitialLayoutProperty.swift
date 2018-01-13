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
	
	public func storeTopLeft(_ topLeft: LayoutElement.Point) -> WillSetTopLeftProperty {
		
		return .init(topLeft: topLeft)
		
	}
	
}

// MARK: TopCenter
extension InitialLayoutProperty: LayoutPropertyCanStoreTopCenterType {
	
	public typealias WillSetTopCenterProperty = DidStoreTopCenterLayoutProperty
	
	public func storeTopCenter(_ topCenter: LayoutElement.Point) -> DidStoreTopCenterLayoutProperty {
		
		return .init(parentView: self.parentView,
					 topCenter: topCenter)
		
	}
	
}

// MARK: TopRight
extension InitialLayoutProperty: LayoutPropertyCanStoreTopRightType {
	
	public typealias WillSetTopRightProperty = DidStoreTopRightLayoutProperty
	
	public func storeTopRight(_ topRight: LayoutElement.Point) -> DidStoreTopRightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 topRight: topRight)
		
	}
	
}

// MARK: MiddleLeft
extension InitialLayoutProperty: LayoutPropertyCanStoreMiddleLeftType {
	
	public typealias WillSetMiddleLeftProperty = DidStoreMiddleLeftLayoutProperty
	
	public func storeMiddleLeft(_ middleLeft: LayoutElement.Point) -> DidStoreMiddleLeftLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleCenter
extension InitialLayoutProperty: LayoutPropertyCanStoreMiddleCenterType {
	
	public typealias WillSetMiddleCenterProperty = DidStoreMiddleCenterLayoutProperty
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point) -> DidStoreMiddleCenterLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleCenter: middleCenter)
		
	}
	
}

// MARK: MiddleRight
extension InitialLayoutProperty: LayoutPropertyCanStoreMiddleRightType {
	
	public typealias WillSetMiddleRightProperty = DidStoreMiddleRightLayoutProperty
	
	public func storeMiddleRight(_ middleRight: LayoutElement.Point) -> DidStoreMiddleRightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 middleRight: middleRight)
		
	}
	
}

// MARK: BottomLeft
extension InitialLayoutProperty: LayoutPropertyCanStoreBottomLeftType {
	
	public typealias WillSetBottomLeftProperty = DidStoreBottomLeftLayoutProperty
	
	public func storeBottomLeft(_ bottomLeft: LayoutElement.Point) -> DidStoreBottomLeftLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomCenter
extension InitialLayoutProperty: LayoutPropertyCanStoreBottomCenterType {
	
	public typealias WillSetBottomCenterProperty = DidStoreBottomCenterLayoutProperty
	
	public func storeBottomCenter(_ bottomCenter: LayoutElement.Point) -> DidStoreBottomCenterLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomCenter: bottomCenter)
		
	}
	
}

// MARK: BottomRight
extension InitialLayoutProperty: LayoutPropertyCanStoreBottomRightType {
	
	public typealias WillSetBottomRightProperty = DidStoreBottomRightLayoutProperty
	
	public func storeBottomRight(_ bottomRight: LayoutElement.Point) -> DidStoreBottomRightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set Horizontal -
// MARK: Left
extension InitialLayoutProperty: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = DidStoreLeftLayoutProperty
	
	public func storeLeft(_ left: LayoutElement.Horizontal) -> DidStoreLeftLayoutProperty {
		
		return .init(parentView: self.parentView,
					 left: left)
		
	}
	
}

// MARK: Center
extension InitialLayoutProperty: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = DidStoreCenterLayoutProperty
	
	public func storeCenter(_ center: LayoutElement.Horizontal) -> DidStoreCenterLayoutProperty {
		
		return .init(parentView: self.parentView,
					 center: center)
		
	}
	
}

// MARK: Right
extension InitialLayoutProperty: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = DidStoreRightLayoutProperty
	
	public func storeRight(_ right: LayoutElement.Horizontal) -> DidStoreRightLayoutProperty {
		
		return .init(parentView: self.parentView,
					 right: right)
		
	}
	
}
