//
//  LeftRightMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftRightMiddle<ParentView: UIView> {
		
		let left: LayoutElement.Horizontal<ParentView>
		
		let right: LayoutElement.Horizontal<ParentView>
		
		let middle: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.LeftRightMiddle: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.LeftRightMiddle {
	
	private func makeFrame(left: CGFloat, right: CGFloat, middle: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middle).doubled
		
		return self.makeFrame(left: left, right: right, middle: middle, height: height)
		
	}
	
	private func makeFrame(left: CGFloat, right: CGFloat, middle: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = middle - height.halved
		let width = right - left
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension IndividualProperty.LeftRightMiddle: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(left: left, right: right, middle: middle, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.LeftRightMiddle: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let width = right - left
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, right: right, middle: middle, height: height)
		
	}
	
}
