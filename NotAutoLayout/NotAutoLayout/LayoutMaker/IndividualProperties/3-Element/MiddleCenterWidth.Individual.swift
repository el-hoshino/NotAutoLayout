//
//  MiddleCenterWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleCenterWidth<ParentView: UIView> {
		
		let middleCenter: LayoutElement.Point<ParentView>
		
		let width: LayoutElement.Length<ParentView>
		
	}
	
}

extension IndividualProperty.MiddleCenterWidth: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleCenterWidth {
	
	private func makeFrame(middleCenter: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleCenter.x - width.halved
		let y = middleCenter.y - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.MiddleCenterWidth: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleCenter: middleCenter, width: width, height: height)
		
	}
	
}
