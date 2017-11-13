//
//  CenterRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterRightDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
	let right: LayoutElement.Line
	
}

// MARK: - Set A Line -
// MARK: Top
extension CenterRightDidSetLayoutMaker: LayoutMakerCanStoreTopType {
	
	public typealias WillSetTopMaker = CenterRightTopDidSetLayoutMaker
	
	public func storeTop(_ top: LayoutElement.Line) -> CenterRightTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 right: self.right,
					 top: top)
		
	}
	
}

// MARK: Middle
extension CenterRightDidSetLayoutMaker: LayoutMakerCanStoreMiddleType {
	
	public typealias WillSetMiddleMaker = CenterRightMiddleDidSetLayoutMaker
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> CenterRightMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 right: self.right,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension CenterRightDidSetLayoutMaker: LayoutMakerCanStoreBottomType {
	
	public typealias WillSetBottomMaker = CenterRightBottomDidSetLayoutMaker
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> CenterRightBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: self.center,
					 right: self.right,
					 bottom: bottom)
		
	}
	
}
