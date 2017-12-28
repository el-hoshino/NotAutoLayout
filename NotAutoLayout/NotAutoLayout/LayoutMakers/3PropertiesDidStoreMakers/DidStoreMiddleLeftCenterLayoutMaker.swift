//
//  DidStoreMiddleLeftCenterLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleLeftCenterLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleLeft: LayoutElement.Point
	
	let center: LayoutElement.Line
	
}

// MARK: - Make Frame
extension DidStoreMiddleLeftCenterLayoutMaker {
	
	private func makeFrame(middleLeft: CGPoint, center: CGFloat, top: CGFloat) -> CGRect {
		
		let height = (middleLeft.y - top).doubled
		
		return self.makeFrame(middleLeft: middleLeft, center: center, height: height)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, center: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middleLeft.y).doubled
		
		return self.makeFrame(middleLeft: middleLeft, center: center, height: height)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, center: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleLeft.x
		let y = middleLeft.y - height.halved
		let width = (center - middleLeft.x).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreMiddleLeftCenterLayoutMaker: LayoutMakerCanStoreTopToEvaluateFrameType {
	
	public typealias WillSetTopMaker = LayoutEditor
	
	public func evaluateFrame(top: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let top = top.evaluated(from: property)
		
		return self.makeFrame(middleLeft: middleLeft, center: center, top: top)
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleLeftCenterLayoutMaker: LayoutMakerCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomMaker = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		
		return self.makeFrame(middleLeft: middleLeft, center: center, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreMiddleLeftCenterLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let width = (center - middleLeft.x).doubled
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleLeft: middleLeft, center: center, height: height)
		
	}
	
}
