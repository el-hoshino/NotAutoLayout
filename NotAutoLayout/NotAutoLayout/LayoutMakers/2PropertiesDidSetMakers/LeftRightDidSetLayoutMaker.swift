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
	
	let left: LayoutElement.Float
	
	let right: LayoutElement.Float
	
}

// MARK: - Set A Line -
// MARK: Top
extension LeftRightDidSetLayoutMaker: LayoutMakerCanSetTopType {
	
	public typealias WillSetTopMaker = LeftRightTopDidSetLayoutMaker
	
	public func setTop(_ top: LayoutElement.Float) -> LeftRightTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: self.right,
					 top: top)
		
	}
	
}

// MARK: Middle
extension LeftRightDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = LeftRightMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Float) -> LeftRightMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: self.right,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension LeftRightDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = LeftRightBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Float) -> LeftRightBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: self.right,
					 bottom: bottom)
		
	}
	
}

