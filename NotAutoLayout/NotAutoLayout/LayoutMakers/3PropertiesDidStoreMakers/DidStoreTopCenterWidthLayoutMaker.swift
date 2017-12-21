//
//  DidStoreTopCenterWidthLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopCenterWidthLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topCenter: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

extension DidStoreTopCenterWidthLayoutMaker {
	
	private func makeFrame(topCenter: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let frame = CGRect(x: topCenter.x - width.halved,
		                   y: topCenter.y,
		                   width: width,
		                   height: height)
		
		return frame
		
	}
	
}

extension DidStoreTopCenterWidthLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
    
    public typealias WillSetHeightMaker = LayoutEditor
    
    public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
        
        let topCenter = self.topCenter.evaluated(from: property)
        let width = self.width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(0))
        let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
        return self.makeFrame(topCenter: topCenter, width: width, height: height)
        
    }
    
}
