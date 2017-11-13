//
//  TopCenterWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopCenterWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topCenter: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

extension TopCenterWidthDidSetLayoutMaker {
	
	private func makeFrame(topCenter: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let frame = CGRect(x: topCenter.x - width.half,
		                   y: topCenter.y,
		                   width: width,
		                   height: height)
		
		return frame
		
	}
	
}

extension TopCenterWidthDidSetLayoutMaker: LayoutMakerCanSetHeightToMakeLayoutEditorType {
    
    public typealias WillSetHeightMaker = LayoutEditor
    
    public func makeFrame(height: LayoutElement.Length, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
        
        let topCenter = self.topCenter.evaluated(from: parameter)
        let width = self.width.evaluated(from: parameter, theOtherAxis: .height(0), fittingCalculation: fittingCalculation)
        let height = height.evaluated(from: parameter, theOtherAxis: .width(width), fittingCalculation: fittingCalculation)
        return self.makeFrame(topCenter: topCenter, width: width, height: height)
        
    }
    
}
