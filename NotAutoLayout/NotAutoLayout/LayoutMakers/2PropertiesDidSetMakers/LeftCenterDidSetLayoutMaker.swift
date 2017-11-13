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
	
	let left: LayoutElement.Line
	
	let center: LayoutElement.Line
	
}

// MARK: - Set A Line -
// MARK: Top
extension LeftCenterDidSetLayoutMaker: LayoutMakerCanStoreTopType {
	
	public typealias WillSetTopMaker = LeftCenterTopDidSetLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> LeftCenterTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: self.center,
					 top: top)
		
	}
	
}

// MARK: Middle
extension LeftCenterDidSetLayoutMaker: LayoutMakerCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = LeftCenterMiddleDidSetLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> LeftCenterMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: self.center,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension LeftCenterDidSetLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = LeftCenterBottomDidSetLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> LeftCenterBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: self.left,
					 center: self.center,
					 bottom: bottom)
		
	}
	
}

