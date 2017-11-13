//
//  DidStoreCenterTopWidthLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterTopWidthLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
	let top: LayoutElement.Line
	
	let width: LayoutElement.Length
	
}

extension DidStoreCenterTopWidthLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {

    public typealias WillSetHeightMaker = LayoutEditor
    
    public func evaluateFrame(height: LayoutElement.Length, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
        
        let width = self.width.evaluated(from: parameter, fitting: fittingCalculation, withTheOtherAxis: .height(0))
        let height = height.evaluated(from: parameter, fitting: fittingCalculation, withTheOtherAxis: .width(width))
        let x = self.center.evaluated(from: parameter) - width.halved
        let y = self.top.evaluated(from: parameter)
        return CGRect(x: x, y: y, width: width, height: height)
        
    }

}
