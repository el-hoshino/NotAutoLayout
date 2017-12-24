//
//  DidStoreLeftCenterLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftCenterLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let center: LayoutElement.Line
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreLeftCenterLayoutMaker: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopMaker = DidStoreLeftCenterTopLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreLeftCenterTopLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: self.center,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreLeftCenterLayoutMaker: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreLeftCenterMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreLeftCenterMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: self.center,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreLeftCenterLayoutMaker: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreLeftCenterBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreLeftCenterBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: self.center,
					 bottom: bottom)
		
	}
	
}

