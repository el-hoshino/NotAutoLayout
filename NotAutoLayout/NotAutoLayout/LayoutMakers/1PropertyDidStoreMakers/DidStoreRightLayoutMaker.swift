//
//  DidStoreRightLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreRightLayoutMaker {
	
	public unowned let parentView: UIView
	
	let right: LayoutElement.Line
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreRightLayoutMaker: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopMaker = DidStoreRightTopLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreRightTopLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreRightLayoutMaker: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreRightMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreRightMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreRightLayoutMaker: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreRightBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreRightBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 bottom: bottom)
		
	}
	
}
