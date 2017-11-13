//
//  LeftRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftRightDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let right: LayoutElement.Line
	
}

// MARK: - Set A Line -
// MARK: Top
extension LeftRightDidSetLayoutMaker: LayoutMakerCanStoreTopType {
	
	public typealias WillSetTopMaker = LeftRightTopDidSetLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> LeftRightTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: self.right,
					 top: top)
		
	}
	
}

// MARK: Middle
extension LeftRightDidSetLayoutMaker: LayoutMakerCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = LeftRightMiddleDidSetLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> LeftRightMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: self.right,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension LeftRightDidSetLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = LeftRightBottomDidSetLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> LeftRightBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: self.right,
					 bottom: bottom)
		
	}
	
}

