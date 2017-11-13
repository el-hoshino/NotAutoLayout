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
	
    public func evaluateFrame(frame: LayoutElement.Rect, parameter: LayoutControlParameter) -> CGRect {
        
        let frame = frame.evaluated(from: parameter)
        
        return frame
        
    }
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension InitialLayoutMaker: LayoutMakerCanStoreTopLeftType {
	
	public typealias WillSetTopLeftMaker = TopLeftDidSetLayoutMaker
	
	public func storeTopLeft(_ topLeft: LayoutElement.Point) -> TopLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: topLeft)
		
	}
	
}

// MARK: TopCenter
extension InitialLayoutMaker: LayoutMakerCanStoreTopCenterType {
	
	public typealias WillSetTopCenterMaker = TopCenterDidSetLayoutMaker
	
	public func storeTopCenter(_ topCenter: LayoutElement.Point) -> TopCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: topCenter)
		
	}
	
}

// MARK: TopRight
extension InitialLayoutMaker: LayoutMakerCanStoreTopRightType {
	
	public typealias WillSetTopRightMaker = TopRightDidSetLayoutMaker
	
	public func storeTopRight(_ topRight: LayoutElement.Point) -> TopRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: topRight)
		
	}
	
}

// MARK: MiddleLeft
extension InitialLayoutMaker: LayoutMakerCanStoreMiddleLeftType {
	
	public typealias WillSetMiddleLeftMaker = MiddleLeftDidSetLayoutMaker
	
	public func storeMiddleLeft(_ middleLeft: LayoutElement.Point) -> MiddleLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleCenter
extension InitialLayoutMaker: LayoutMakerCanStoreMiddleCenterType {
	
	public typealias WillSetMiddleCenterMaker = MiddleCenterDidSetLayoutMaker
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point) -> MiddleCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: middleCenter)
		
	}
	
}

// MARK: MiddleRight
extension InitialLayoutMaker: LayoutMakerCanStoreMiddleRightType {
	
	public typealias WillSetMiddleRightMaker = MiddleRightDidSetLayoutMaker
	
	public func storeMiddleRight(_ middleRight: LayoutElement.Point) -> MiddleRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: middleRight)
		
	}
	
}

// MARK: BottomLeft
extension InitialLayoutMaker: LayoutMakerCanStoreBottomLeftType {
	
	public typealias WillSetBottomLeftMaker = BottomLeftDidSetLayoutMaker
	
	public func storeBottomLeft(_ bottomLeft: LayoutElement.Point) -> BottomLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomCenter
extension InitialLayoutMaker: LayoutMakerCanStoreBottomCenterType {
	
	public typealias WillSetBottomCenterMaker = BottomCenterDidSetLayoutMaker
	
	public func storeBottomCenter(_ bottomCenter: LayoutElement.Point) -> BottomCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: bottomCenter)
		
	}
	
}

// MARK: BottomRight
extension InitialLayoutMaker: LayoutMakerCanStoreBottomRightType {
	
	public typealias WillSetBottomRightMaker = BottomRightDidSetLayoutMaker
	
	public func storeBottomRight(_ bottomRight: LayoutElement.Point) -> BottomRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension InitialLayoutMaker: LayoutMakerCanStoreLeftType {
	
	public typealias WillSetLeftMaker = LeftDidSetLayoutMaker
	
	public func storeLeft(_ left: LayoutElement.Line) -> LeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: left)
		
	}
	
}

// MARK: Center
extension InitialLayoutMaker: LayoutMakerCanStoreCenterType {
	
	public typealias WillSetCenterMaker = CenterDidSetLayoutMaker
	
	public func storeCenter(_ center: LayoutElement.Line) -> CenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: center)
		
	}
	
}

// MARK: Right
extension InitialLayoutMaker: LayoutMakerCanStoreRightType {
	
	public typealias WillSetRightMaker = RightDidSetLayoutMaker
	
	public func storeRight(_ right: LayoutElement.Line) -> RightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: right)
		
	}
	
}
