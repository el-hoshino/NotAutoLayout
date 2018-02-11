//
//  DidStoreCenterMiddleWidthLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterMiddleWidthLayoutProperty {
	
	let center: LayoutElement.Horizontal
	
	let middle: LayoutElement.Vertical
	
	let width: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreCenterMiddleWidthLayoutProperty {
	
	private func makeFrame(center: CGFloat, middle: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = center - width.halved
		let y = middle - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreCenterMiddleWidthLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
    public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
        
        let width = self.width.evaluated(from: property, withTheOtherAxis: .height(0))
        let height = height.evaluated(from: property, withTheOtherAxis: .width(width))
        let x = self.center.evaluated(from: property) - width.halved
        let y = self.middle.evaluated(from: property) - height.halved
        return CGRect(x: x, y: y, width: width, height: height)
        
    }
    
}
