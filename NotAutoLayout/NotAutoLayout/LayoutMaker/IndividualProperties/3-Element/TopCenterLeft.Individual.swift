//
//  TopCenterLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopCenterLeft<ParentView: UIView> {
		
		let topCenter: LayoutElement.Point<ParentView>
		
		let left: LayoutElement.Horizontal<ParentView>
		
	}
	
}

extension IndividualProperty.TopCenterLeft: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.TopCenterLeft {
	
	private func makeFrame(topCenter: CGPoint, left: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (middle - topCenter.y).doubled
		
		return self.makeFrame(topCenter: topCenter, left: left, height: height)
		
	}
	
	private func makeFrame(topCenter: CGPoint, left: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = bottom - topCenter.y
		
		return self.makeFrame(topCenter: topCenter, left: left, height: height)
		
	}
	
	private func makeFrame(topCenter: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = topCenter.y
		let width = (topCenter.x - left).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.TopCenterLeft: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, left: left, middle: middle)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopCenterLeft: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, left: left, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.TopCenterLeft: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let width = (topCenter.x - left).doubled
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topCenter: topCenter, left: left, height: height)
		
	}
	
}
