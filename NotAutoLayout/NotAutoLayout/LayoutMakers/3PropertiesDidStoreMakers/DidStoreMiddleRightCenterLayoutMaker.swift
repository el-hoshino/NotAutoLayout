//
//  DidStoreMiddleRightCenterLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleRightCenterLayoutProperty {
	
	let middleRight: LayoutElement.Point
	
	let center: LayoutElement.Horizontal
	
}

// MARK: - Make Frame
extension DidStoreMiddleRightCenterLayoutProperty {
	
	private func makeFrame(middleRight: CGPoint, center: CGFloat, top: CGFloat) -> CGRect {
		
		let height = (middleRight.y - top).doubled
		
		return self.makeFrame(middleRight: middleRight, center: center, height: height)
		
	}
	
	private func makeFrame(middleRight: CGPoint, center: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middleRight.y).doubled
		
		return self.makeFrame(middleRight: middleRight, center: center, height: height)
		
	}
	
	private func makeFrame(middleRight: CGPoint, center: CGFloat, height: CGFloat) -> CGRect {
		
		let width = (middleRight.x - center).doubled
		let x = middleRight.x - width
		let y = middleRight.y - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreMiddleRightCenterLayoutProperty: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public typealias WillSetTopProperty = LayoutEditor
	
	public func evaluateFrame(top: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let top = top.evaluated(from: property)
		
		return self.makeFrame(middleRight: middleRight, center: center, top: top)
		
	}
	
}

// MARK: Bottom
extension DidStoreMiddleRightCenterLayoutProperty: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomProperty = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let bottom = bottom.evaluated(from: property)
		
		return self.makeFrame(middleRight: middleRight, center: center, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreMiddleRightCenterLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightProperty = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let width = (middleRight.x - center).doubled
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleRight: middleRight, center: center, height: height)
		
	}
	
}
