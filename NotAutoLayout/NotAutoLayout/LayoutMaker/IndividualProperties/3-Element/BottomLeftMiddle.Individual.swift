//
//  BottomLeftMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomLeftMiddle<ParentView: UIView> {
		
		let bottomLeft: LayoutElement.Point<ParentView>
		
		let middle: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.BottomLeftMiddle: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomLeftMiddle {
	
	private func makeFrame(bottomLeft: CGPoint, middle: CGFloat, width: CGFloat) -> CGRect {
		
		let height = (bottomLeft.y - middle).doubled
		let x = bottomLeft.x
		let y = bottomLeft.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.BottomLeftMiddle: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let height = (bottomLeft.y - middle).doubled
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomLeft: bottomLeft, middle: middle, width: width)
		
	}
	
}
