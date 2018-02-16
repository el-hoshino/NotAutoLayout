//
//  TopRightWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopRightWidth<ParentView: UIView> {
		
		let topRight: LayoutElement.Point<ParentView>
		
		let width: LayoutElement.Length<ParentView>
		
	}
	
}

extension IndividualProperty.TopRightWidth: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.TopRightWidth {
	
	private func makeFrame(topRight: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = topRight.x - width
		let y = topRight.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopRightWidth: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topRight: topRight, width: width, height: height)
		
	}
	
}
