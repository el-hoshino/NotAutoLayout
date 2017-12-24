//
//  DidStoreLeftLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftLayoutProperty {
	
	let left: LayoutElement.Horizontal
	
}

public struct DidStoreLeftLayoutMaker {
	
	public unowned let parentView: UIView
		
	let left: LayoutElement.Horizontal
	
}

// MARK: - Set A Line -
// MARK: Center
extension DidStoreLeftLayoutMaker: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterMaker = DidStoreLeftCenterLayoutMaker
	
	public func storeCenter(_ center: LayoutElement.Line) -> DidStoreLeftCenterLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: center)
		
	}
	
}

// MARK: Right
extension DidStoreLeftLayoutMaker: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightMaker = DidStoreLeftRightLayoutMaker
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreLeftRightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: right)
		
	}
	
}

// MARK: Top
extension DidStoreLeftLayoutMaker: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopMaker = DidStoreLeftTopLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreLeftTopLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreLeftLayoutMaker: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreLeftMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreLeftMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreLeftLayoutMaker: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreLeftBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreLeftBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 bottom: bottom)
		
	}
	
}

