//
//  TopRightCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopRightCenter<ParentView: UIView> {
		
		let topRight: LayoutElement.Point<ParentView>
		
		let center: LayoutElement.Horizontal<ParentView>
		
	}
	
}

extension IndividualProperty.TopRightCenter: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.TopRightCenter {
	
	private func makeFrame(topRight: CGPoint, center: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (middle - topRight.y).doubled
		
		return self.makeFrame(topRight: topRight, center: center, height: height)
		
	}
	
	private func makeFrame(topRight: CGPoint, center: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = bottom - topRight.y
		
		return self.makeFrame(topRight: topRight, center: center, height: height)
		
	}
	
	private func makeFrame(topRight: CGPoint, center: CGFloat, height: CGFloat) -> CGRect {
		
		let width = (topRight.x - center).doubled
		let x = topRight.x - width
		let y = topRight.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.TopRightCenter: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, center: center, middle: middle)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopRightCenter: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, center: center, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.TopRightCenter: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let width = (topRight.x - center).doubled
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topRight: topRight, center: center, height: height)
		
	}
	
}
