//
//  InitialLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct InitialLayoutMaker {
	
	public unowned let parentView: UIView
	
}

// MARK: - Set A Frame -
extension InitialLayoutMaker: LayoutMakerCanStoreFrameToEvaluateFrameType {
	
	public typealias WillSetFrameMaker = LayoutEditor
	
    public func evaluateFrame(frame: LayoutElement.Rect, property: ViewFrameProperty) -> CGRect {
        
        let frame = frame.evaluated(from: property)
        
        return frame
        
    }
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension InitialLayoutMaker: LayoutMakerCanStoreTopLeftType {
	
	public typealias WillSetTopLeftMaker = DidStoreTopLeftLayoutMaker
	
	public func storeTopLeft(_ topLeft: LayoutElement.Point) -> DidStoreTopLeftLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: topLeft)
		
	}
	
}

// MARK: TopCenter
extension InitialLayoutMaker: LayoutMakerCanStoreTopCenterType {
	
	public typealias WillSetTopCenterMaker = DidStoreTopCenterLayoutMaker
	
	public func storeTopCenter(_ topCenter: LayoutElement.Point) -> DidStoreTopCenterLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: topCenter)
		
	}
	
}

// MARK: TopRight
extension InitialLayoutMaker: LayoutMakerCanStoreTopRightType {
	
	public typealias WillSetTopRightMaker = DidStoreTopRightLayoutMaker
	
	public func storeTopRight(_ topRight: LayoutElement.Point) -> DidStoreTopRightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: topRight)
		
	}
	
}

// MARK: MiddleLeft
extension InitialLayoutMaker: LayoutMakerCanStoreMiddleLeftType {
	
	public typealias WillSetMiddleLeftMaker = DidStoreMiddleLeftLayoutMaker
	
	public func storeMiddleLeft(_ middleLeft: LayoutElement.Point) -> DidStoreMiddleLeftLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleCenter
extension InitialLayoutMaker: LayoutMakerCanStoreMiddleCenterType {
	
	public typealias WillSetMiddleCenterMaker = DidStoreMiddleCenterLayoutMaker
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point) -> DidStoreMiddleCenterLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: middleCenter)
		
	}
	
}

// MARK: MiddleRight
extension InitialLayoutMaker: LayoutMakerCanStoreMiddleRightType {
	
	public typealias WillSetMiddleRightMaker = DidStoreMiddleRightLayoutMaker
	
	public func storeMiddleRight(_ middleRight: LayoutElement.Point) -> DidStoreMiddleRightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: middleRight)
		
	}
	
}

// MARK: BottomLeft
extension InitialLayoutMaker: LayoutMakerCanStoreBottomLeftType {
	
	public typealias WillSetBottomLeftMaker = DidStoreBottomLeftLayoutMaker
	
	public func storeBottomLeft(_ bottomLeft: LayoutElement.Point) -> DidStoreBottomLeftLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomCenter
extension InitialLayoutMaker: LayoutMakerCanStoreBottomCenterType {
	
	public typealias WillSetBottomCenterMaker = DidStoreBottomCenterLayoutMaker
	
	public func storeBottomCenter(_ bottomCenter: LayoutElement.Point) -> DidStoreBottomCenterLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: bottomCenter)
		
	}
	
}

// MARK: BottomRight
extension InitialLayoutMaker: LayoutMakerCanStoreBottomRightType {
	
	public typealias WillSetBottomRightMaker = DidStoreBottomRightLayoutMaker
	
	public func storeBottomRight(_ bottomRight: LayoutElement.Point) -> DidStoreBottomRightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension InitialLayoutMaker: LayoutMakerCanStoreLeftType {
	
	public typealias WillSetLeftMaker = DidStoreLeftLayoutMaker
	
	public func storeLeft(_ left: LayoutElement.Line) -> DidStoreLeftLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: left)
		
	}
	
}

// MARK: Center
extension InitialLayoutMaker: LayoutMakerCanStoreCenterType {
	
	public typealias WillSetCenterMaker = DidStoreCenterLayoutMaker
	
	public func storeCenter(_ center: LayoutElement.Line) -> DidStoreCenterLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: center)
		
	}
	
}

// MARK: Right
extension InitialLayoutMaker: LayoutMakerCanStoreRightType {
	
	public typealias WillSetRightMaker = DidStoreRightLayoutMaker
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreRightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: right)
		
	}
	
}
