//
//  DidStoreTopLeftWidthLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopLeftWidthLayoutProperty {
	
	let topLeft: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreTopLeftWidthLayoutProperty {
	
	private func makeFrame(topLeft: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = topLeft.x
		let y = topLeft.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreTopLeftWidthLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(topLeft: topLeft, width: width, height: height)
		
	}
	
}
