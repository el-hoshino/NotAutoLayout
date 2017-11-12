//
//  LeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
		
	let left: LayoutElement.Line
	
}

// MARK: - Set A Line -
// MARK: Center
extension LeftDidSetLayoutMaker: LayoutMakerCanSetCenterType {
	
	public typealias WillSetCenterMaker = LeftCenterDidSetLayoutMaker
	
	public func setCenter(_ center: LayoutElement.Line) -> LeftCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: center)
		
	}
	
}

// MARK: Right
extension LeftDidSetLayoutMaker: LayoutMakerCanSetRightType {
	
	public typealias WillSetRightMaker = LeftRightDidSetLayoutMaker
	
	public func setRight(_ right: LayoutElement.Line) -> LeftRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 right: right)
		
	}
	
}

// MARK: Top
extension LeftDidSetLayoutMaker: LayoutMakerCanSetTopType {
	
	public typealias WillSetTopMaker = LeftTopDidSetLayoutMaker
	
	public func setTop(_ top: LayoutElement.Line) -> LeftTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 top: top)
		
	}
	
}

// MARK: Middle
extension LeftDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = LeftMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Line) -> LeftMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension LeftDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = LeftBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Line) -> LeftBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 bottom: bottom)
		
	}
	
}

