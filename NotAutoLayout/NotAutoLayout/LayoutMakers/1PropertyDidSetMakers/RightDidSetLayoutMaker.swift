//
//  RightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct RightDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let right: LayoutElement.Float
	
}

// MARK: - Set A Line -
// MARK: Top
extension RightDidSetLayoutMaker: LayoutMakerCanSetTopType {
	
	public typealias WillSetTopMaker = RightTopDidSetLayoutMaker
	
	public func setTop(_ top: LayoutElement.Float) -> RightTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 top: top)
		
	}
	
}

// MARK: Middle
extension RightDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = RightMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Float) -> RightMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension RightDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = RightBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Float) -> RightBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: self.right,
					 bottom: bottom)
		
	}
	
}
