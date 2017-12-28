//
//  DidStoreMiddleCenterLeftLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleCenterLeftLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleCenter: LayoutElement.Point
	
	let left: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreMiddleCenterLeftLayoutMaker {
	
	private func makeFrame(middleCenter: CGPoint, left: CGFloat, top: CGFloat) -> CGRect {
		
		let height = (middleCenter.y - top).doubled
		
		return self.makeFrame(middleCenter: middleCenter, left: left, height: height)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, left: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middleCenter.y).doubled
		
		return self.makeFrame(middleCenter: middleCenter, left: left, height: height)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = middleCenter.y - height.halved
		let width = (middleCenter.x - left).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreMiddleCenterLeftLayoutMaker: LayoutMakerCanStoreTopToEvaluateFrameType {
	
	public typealias WillSetTopMaker = LayoutEditor
	
	public func evaluateFrame(top: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let top = top.evaluated(from: property)
		
		return self.makeFrame(middleCenter: middleCenter, left: left, top: top)
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleCenterLeftLayoutMaker: LayoutMakerCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomMaker = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		
		return self.makeFrame(middleCenter: middleCenter, left: left, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreMiddleCenterLeftLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: property)
		let left = self.left.evaluated(from: property)
		let width = (middleCenter.x - left).doubled
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleCenter: middleCenter, left: left, height: height)
		
	}
	
}
