//
//  DidStoreMiddleCenterWidthLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleCenterWidthLayoutProperty {
	
	let middleCenter: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreMiddleCenterWidthLayoutProperty {
	
	private func makeFrame(middleCenter: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleCenter.x - width.halved
		let y = middleCenter.y - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreMiddleCenterWidthLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleCenter: middleCenter, width: width, height: height)
		
	}
	
}
