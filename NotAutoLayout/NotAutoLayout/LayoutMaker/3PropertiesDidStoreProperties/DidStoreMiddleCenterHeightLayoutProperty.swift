//
//  DidStoreMiddleCenterHeightLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleCenterHeightLayoutProperty {
	
	let middleCenter: LayoutElement.Point
	
	let height: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreMiddleCenterHeightLayoutProperty {
	
	private func makeFrame(middleCenter: CGPoint, height: CGFloat, width: CGFloat) -> CGRect {
		
		let x = middleCenter.x - width.halved
		let y = middleCenter.y - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreMiddleCenterHeightLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleCenter: middleCenter, height: height, width: width)
		
	}
	
}
