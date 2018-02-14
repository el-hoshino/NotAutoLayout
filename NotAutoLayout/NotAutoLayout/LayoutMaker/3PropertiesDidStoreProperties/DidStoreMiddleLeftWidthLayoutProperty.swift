//
//  DidStoreMiddleLeftWidthLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleLeftWidthLayoutProperty {
	
	let middleLeft: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreMiddleLeftWidthLayoutProperty {
	
	private func makeFrame(middleLeft: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleLeft.x
		let y = middleLeft.y - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreMiddleLeftWidthLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
    public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
        
        let middleLeft = self.middleLeft.evaluated(from: parameters)
        let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
        let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
        return self.makeFrame(middleLeft: middleLeft, width: width, height: height)
        
    }
    
}
