//
//  LeftCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftCenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Float
	
	let center: LayoutElement.Float
	
}

// MARK: - Set A Line -
// MARK: Top
extension LeftCenterDidSetLayoutMaker: LayoutMakerCanSetTopType {
	
	public typealias WillSetTopMaker = LeftCenterTopDidSetLayoutMaker
	
	public func setTop(_ top: LayoutElement.Float) -> LeftCenterTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: self.center,
					 top: top)
		
	}
	
}

// MARK: Middle
extension LeftCenterDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = LeftCenterMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Float) -> LeftCenterMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: self.center,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension LeftCenterDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = LeftCenterBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Float) -> LeftCenterBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: self.center,
					 bottom: bottom)
		
	}
	
}

