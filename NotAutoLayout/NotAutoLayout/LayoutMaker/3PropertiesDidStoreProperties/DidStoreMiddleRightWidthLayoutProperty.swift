//
//  DidStoreMiddleRightWidthLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleRightWidthLayoutProperty {
	
	let middleRight: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreMiddleRightWidthLayoutProperty {
	
	private func makeFrame(middleRight: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleRight.x - width
		let y = middleRight.y - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreMiddleRightWidthLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
    public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
        
        let middleRight = self.middleRight.evaluated(from: parameters)
        let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
        let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
        return self.makeFrame(middleRight: middleRight, width: width, height: height)
        
    }
    
}
