//
//  DidStoreCenterRightLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterRightLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
	let right: LayoutElement.Line
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreCenterRightLayoutMaker: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopMaker = DidStoreCenterRightTopLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreCenterRightTopLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 right: self.right,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreCenterRightLayoutMaker: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreCenterRightMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreCenterRightMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 right: self.right,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreCenterRightLayoutMaker: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreCenterRightBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreCenterRightBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 right: self.right,
					 bottom: bottom)
		
	}
	
}
