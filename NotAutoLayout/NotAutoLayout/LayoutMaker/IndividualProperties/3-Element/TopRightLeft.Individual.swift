//
//  TopRightLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopRightLeft<ParentView: UIView> {
		
		let topRight: LayoutElement.Point<ParentView>
		
		let left: LayoutElement.Horizontal<ParentView>
		
	}
	
}

extension IndividualProperty.TopRightLeft: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.TopRightLeft {
	
	private func makeFrame(topRight: CGPoint, left: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (middle - topRight.y).doubled
		
		return self.makeFrame(topRight: topRight, left: left, height: height)
		
	}
	
	private func makeFrame(topRight: CGPoint, left: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = bottom - topRight.y
		
		return self.makeFrame(topRight: topRight, left: left, height: height)
		
	}
	
	private func makeFrame(topRight: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = topRight.y
		let width = topRight.x - left
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.TopRightLeft: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, left: left, middle: middle)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopRightLeft: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(topRight: topRight, left: left, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.TopRightLeft: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let width = topRight.x - left
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topRight: topRight, left: left, height: height)
		
	}
	
}
