//
//  MiddleLeftHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleLeftHeight<ParentView: UIView> {
		
		let middleLeft: LayoutElement.Point<ParentView>
		
		let height: LayoutElement.Length<ParentView>
		
	}
	
}

extension IndividualProperty.MiddleLeftHeight: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleLeftHeight {
	
	private func makeFrame(middleLeft: CGPoint, height: CGFloat, width: CGFloat) -> CGRect {
		
		let x = middleLeft.x
		let y = middleLeft.y - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleLeftHeight: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleLeft: middleLeft, height: height, width: width)
		
	}
	
}
