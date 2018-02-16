//
//  RightTopMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct RightTopMiddle<ParentView: UIView> {
		
		let right: LayoutElement.Horizontal<ParentView>
		
		let top: LayoutElement.Vertical<ParentView>
		
		let middle: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.RightTopMiddle: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.RightTopMiddle {
	
	private func makeFrame(right: CGFloat, top: CGFloat, middle: CGFloat, width: CGFloat) -> CGRect {
		
		let x = right - width
		let y = top
		let height = (middle - top).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.RightTopMiddle: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let right = self.right.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = (middle - top).doubled
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(right: right, top: top, middle: middle, width: width)
		
	}
	
}
