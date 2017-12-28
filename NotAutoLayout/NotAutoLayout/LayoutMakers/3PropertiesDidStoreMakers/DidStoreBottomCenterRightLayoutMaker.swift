//
//  DidStoreBottomCenterRightLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomCenterRightLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomCenter: LayoutElement.Point
	
	let right: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreBottomCenterRightLayoutMaker {
	
	private func makeFrame(bottomCenter: CGPoint, right: CGFloat, top: CGFloat) -> CGRect {
		
		let height = bottomCenter.y - top
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, height: height)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, right: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (bottomCenter.y - middle).doubled
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, height: height)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, right: CGFloat, height: CGFloat) -> CGRect {
		
		let width = (right - bottomCenter.x).doubled
		let x = right - width
		let y = bottomCenter.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreBottomCenterRightLayoutMaker: LayoutMakerCanStoreTopToEvaluateFrameType {
	
	public typealias WillSetTopMaker = LayoutEditor
	
	public func evaluateFrame(top: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let top = top.evaluated(from: property)
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreBottomCenterRightLayoutMaker: LayoutMakerCanStoreMiddleToEvaluateFrameType {
	
	public typealias WillSetMiddleMaker = LayoutEditor
	
	public func evaluateFrame(middle: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let middle = middle.evaluated(from: property)
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreBottomCenterRightLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let width = (right - bottomCenter.x).doubled
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, height: height)
		
	}
	
}
