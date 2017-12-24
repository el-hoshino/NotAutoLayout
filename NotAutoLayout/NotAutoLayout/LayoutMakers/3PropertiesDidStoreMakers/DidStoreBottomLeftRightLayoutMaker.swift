//
//  DidStoreBottomLeftRightLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomLeftRightLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomLeft: LayoutElement.Point
	
	let right: LayoutElement.Horizontal
	
}

// MARK: - Make Frame
extension DidStoreBottomLeftRightLayoutMaker {
	
	private func makeFrame(bottomLeft: CGPoint, right: CGFloat, top: CGFloat) -> CGRect {
		
		let height = bottomLeft.y - top
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, height: height)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, right: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (bottomLeft.y - middle).doubled
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, height: height)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, right: CGFloat, height: CGFloat) -> CGRect {
		
		let x = bottomLeft.x
		let y = bottomLeft.y - height
		let width = right - bottomLeft.x
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreBottomLeftRightLayoutMaker: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public typealias WillSetTopMaker = LayoutEditor
	
	public func evaluateFrame(top: LayoutElement.Horizontal, property: ViewFrameProperty) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let top = top.evaluated(from: property)
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, top: top)
		
	}
	
}

// MARK: Bottom
extension DidStoreBottomLeftRightLayoutMaker: LayoutMakerCanStoreMiddleToEvaluateFrameType {
	
	public typealias WillSetMiddleMaker = LayoutEditor
	
	public func evaluateFrame(middle: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let middle = middle.evaluated(from: property)
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreBottomLeftRightLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let width = right - bottomLeft.x
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomLeft: bottomLeft, right: right, height: height)
		
	}
	
}

