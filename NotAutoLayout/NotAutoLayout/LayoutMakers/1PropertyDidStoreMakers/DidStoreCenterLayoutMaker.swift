//
//  DidStoreCenterLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
}

// MARK: - Set A Line -
// MARK: Right
extension DidStoreCenterLayoutMaker: LayoutMakerCanStoreRightType {
	
	public typealias WillSetRightMaker = DidStoreCenterRightLayoutMaker
	
	public func storeRight(_ right: LayoutElement.Line) -> DidStoreCenterRightLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 right: right)
		
	}
	
}

// MARK: Top
extension DidStoreCenterLayoutMaker: LayoutMakerCanStoreTopType {
	
	public typealias WillSetTopMaker = DidStoreCenterTopLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreCenterTopLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreCenterLayoutMaker: LayoutMakerCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreCenterMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreCenterMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreCenterLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreCenterBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreCenterBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 bottom: bottom)
		
	}
	
}
