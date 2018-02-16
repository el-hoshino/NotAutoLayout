//
//  RightBottomHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct RightBottomHeight<ParentView: UIView> {
		
		let right: LayoutElement.Horizontal<ParentView>
		
		let bottom: LayoutElement.Vertical<ParentView>
		
		let height: LayoutElement.Length<ParentView>
		
	}
	
}

extension IndividualProperty.RightBottomHeight: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.RightBottomHeight {
	
	private func makeFrame(right: CGFloat, bottom: CGFloat, height: CGFloat, width: CGFloat) -> CGRect {
		
		let x = right - width
		let y = bottom - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.RightBottomHeight: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let right = self.right.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(right: right, bottom: bottom, height: height, width: width)
		
	}
	
}
