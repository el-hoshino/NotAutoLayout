//
//  DidStoreBottomCenterWidthLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomCenterWidthLayoutProperty {
	
	let bottomCenter: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreBottomCenterWidthLayoutProperty {
	
	private func makeFrame(bottomCenter: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = bottomCenter.x - width.halved
		let y = bottomCenter.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreBottomCenterWidthLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomCenter: bottomCenter, width: width, height: height)
		
	}
	
}
