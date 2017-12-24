//
//  DidStoreLeftRightLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftRightLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let right: LayoutElement.Line
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreLeftRightLayoutMaker: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopMaker = DidStoreLeftRightTopLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> DidStoreLeftRightTopLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: self.right,
					 top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreLeftRightLayoutMaker: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = DidStoreLeftRightMiddleLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> DidStoreLeftRightMiddleLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: self.right,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension DidStoreLeftRightLayoutMaker: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomMaker = DidStoreLeftRightBottomLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> DidStoreLeftRightBottomLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: self.right,
					 bottom: bottom)
		
	}
	
}

