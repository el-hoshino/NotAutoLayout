//
//  DidStoreCenterTopWidthLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterTopWidthLayoutProperty {
	
	let center: LayoutElement.Horizontal
	
	let top: LayoutElement.Vertical
	
	let width: LayoutElement.Length
	
}

// MARK: - Make Frame
extension DidStoreCenterTopWidthLayoutProperty {
	
	private func makeFrame(center: CGFloat, top: CGFloat, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = center - width.halved
		let y = top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension DidStoreCenterTopWidthLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
    public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty) -> CGRect {
        
        let center = self.center.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let width = self.width.evaluated(from: property, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: property, withTheOtherAxis: .width(width))
		
		return self.makeFrame(center: center, top: top, width: width, height: height)
		
    }

}
