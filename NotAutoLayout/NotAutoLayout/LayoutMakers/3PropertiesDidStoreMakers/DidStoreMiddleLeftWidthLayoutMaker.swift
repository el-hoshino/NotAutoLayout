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
	
    public typealias WillSetHeightProperty = LayoutEditor
    
    public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
        
        let middleLeft = self.middleLeft.evaluated(from: property)
        let width = self.width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(0))
        let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
        return self.makeFrame(middleLeft: middleLeft, width: width, height: height)
        
    }
    
}
