//
//  LeftTopBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftTopBottom<ParentView: UIView> {
		
		let left: LayoutElement.Horizontal<ParentView>
		
		let top: LayoutElement.Vertical<ParentView>
		
		let bottom: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.LeftTopBottom: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.LeftTopBottom {
	
	private func makeFrame(left: CGFloat, top: CGFloat, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let height = bottom - top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.LeftTopBottom: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = bottom - top
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(left: left, top: top, bottom: bottom, width: width)
		
	}
	
}
