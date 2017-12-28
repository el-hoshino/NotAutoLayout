//
//  DidStoreMiddleRightLeftLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleRightLeftLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleRight: LayoutElement.Point
	
	let left: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreMiddleRightLeftLayoutMaker {
	
	private func makeFrame(middleRight: CGPoint, left: CGFloat, top: CGFloat) -> CGRect {
		
		let height = (middleRight.y - top).doubled
		
		return self.makeFrame(middleRight: middleRight, left: left, height: height)
		
	}
	
	private func makeFrame(middleRight: CGPoint, left: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middleRight.y).doubled
		
		return self.makeFrame(middleRight: middleRight, left: left, height: height)
		
	}
	
	private func makeFrame(middleRight: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = middleRight.y - height.halved
		let width = middleRight.x - left
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreMiddleRightLeftLayoutMaker: LayoutMakerCanStoreTopToEvaluateFrameType {
	
	public typealias WillSetTopMaker = LayoutEditor
	
	public func evaluateFrame(top: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let top = top.evaluated(from: property)
		
		return self.makeFrame(middleRight: middleRight, left: left, top: top)
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleRightLeftLayoutMaker: LayoutMakerCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomMaker = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		let middleRight = self.middleRight.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		return self.makeFrame(middleRight: middleRight, left: left, bottom: bottom)
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreMiddleRightLeftLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let width = middleRight.x - left
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		return self.makeFrame(middleRight: middleRight, left: left, height: height)
		
	}
	
}
