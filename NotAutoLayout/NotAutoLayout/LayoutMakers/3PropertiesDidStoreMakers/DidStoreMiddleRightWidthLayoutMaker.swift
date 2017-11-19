//
//  DidStoreMiddleRightWidthLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleRightWidthLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleRight: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

extension DidStoreMiddleRightWidthLayoutMaker {
	
	private func makeFrame(middleRight: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleRight.x - width
		let y = middleRight.y - height.halved
		let size = CGSize(width: width, height: height)
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension DidStoreMiddleRightWidthLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
    
    public typealias WillSetHeightMaker = LayoutEditor
    
    public func evaluateFrame(height: LayoutElement.Length, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
        
        let middleRight = self.middleRight.evaluated(from: parameter)
        let width = self.width.evaluated(from: parameter, fitting: fittingCalculation, withTheOtherAxis: .height(0))
        let height = height.evaluated(from: parameter, fitting: fittingCalculation, withTheOtherAxis: .width(width))
        return self.makeFrame(middleRight: middleRight, width: width, height: height)
        
    }
    
}
