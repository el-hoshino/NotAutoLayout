//
//  DidStoreTopCenterWidthLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopCenterWidthLayoutProperty {
	
	let topCenter: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreTopCenterWidthLayoutProperty {
	
	private func makeFrame(topCenter: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = topCenter.x - width.halved
		let y = topCenter.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreTopCenterWidthLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
    public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
        
        let topCenter = self.topCenter.evaluated(from: parameters)
        let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
        let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
        return self.makeFrame(topCenter: topCenter, width: width, height: height)
        
    }
    
}
