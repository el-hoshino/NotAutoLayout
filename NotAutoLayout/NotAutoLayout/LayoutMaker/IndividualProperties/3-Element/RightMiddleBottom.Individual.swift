//
//  RightMiddleBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct RightMiddleBottom<ParentView: UIView> {
		
		let right: LayoutElement.Horizontal<ParentView>
		
		let middle: LayoutElement.Vertical<ParentView>
		
		let bottom: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.RightMiddleBottom: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.RightMiddleBottom {
	
	private func makeFrame(right: CGFloat, middle: CGFloat, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let x = right - width
		let height = (bottom - middle).doubled
		let y = bottom - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.RightMiddleBottom: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let right = self.right.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = (bottom - middle).doubled
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(right: right, middle: middle, bottom: bottom, width: width)
		
	}
	
}
