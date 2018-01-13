//
//  DidStoreMiddleLeftRightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleLeftRightLayoutProperty {
	
	let middleLeft: LayoutElement.Point
	
	let right: LayoutElement.Horizontal
	
}

// MARK: - Make Frame
extension DidStoreMiddleLeftRightLayoutProperty {
	
	private func makeFrame(middleLeft: CGPoint, right: CGFloat, top: CGFloat) -> CGRect {
		
		let height = (middleLeft.y - top).doubled
		
		return self.makeFrame(middleLeft: middleLeft, right: right, height: height)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, right: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middleLeft.y).doubled
		
		return self.makeFrame(middleLeft: middleLeft, right: right, height: height)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, right: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleLeft.x
		let y = middleLeft.y - height.halved
		let width = right - middleLeft.x
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreMiddleLeftRightLayoutProperty: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public typealias WillSetTopProperty = LayoutEditor
	
	public func evaluateFrame(top: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let top = top.evaluated(from: property)
		
		return self.makeFrame(middleLeft: middleLeft, right: right, top: top)
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleLeftRightLayoutProperty: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomProperty = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		
		return self.makeFrame(middleLeft: middleLeft, right: right, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreMiddleLeftRightLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightProperty = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let width = right - middleLeft.x
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleLeft: middleLeft, right: right, height: height)
		
	}
	
}
