//
//  CenterMiddleHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterMiddleHeight<ParentView: UIView> {
		
		let center: LayoutElement.Horizontal<ParentView>
		
		let middle: LayoutElement.Vertical<ParentView>
		
		let height: LayoutElement.Length<ParentView>
		
	}
	
}

extension IndividualProperty.CenterMiddleHeight: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.CenterMiddleHeight {
	
	private func makeFrame(center: CGFloat, middle: CGFloat, height: CGFloat, width: CGFloat) -> CGRect {
		
		let x = center - width.halved
		let y = middle - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.CenterMiddleHeight: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let center = self.center.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(center: center, middle: middle, height: height, width: width)
		
	}
	
}
