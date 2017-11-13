//
//  MiddleLeftWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleLeftWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleLeft: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

extension MiddleLeftWidthDidSetLayoutMaker {
	
	private func makeFrame(middleLeft: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleLeft.x
		let y = middleLeft.y - height.half
		let size = CGSize(width: width, height: height)
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension MiddleLeftWidthDidSetLayoutMaker: LayoutMakerCanSetHeightToMakeLayoutEditorType {
    
    public typealias WillSetHeightMaker = LayoutEditor
    
    public func evaluateFrame(height: LayoutElement.Length, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
        
        let middleLeft = self.middleLeft.evaluated(from: parameter)
        let width = self.width.evaluated(from: parameter, fitting: fittingCalculation, withTheOtherAxis: .height(0))
        let height = height.evaluated(from: parameter, fitting: fittingCalculation, withTheOtherAxis: .width(width))
        return self.makeFrame(middleLeft: middleLeft, width: width, height: height)
        
    }
    
}
