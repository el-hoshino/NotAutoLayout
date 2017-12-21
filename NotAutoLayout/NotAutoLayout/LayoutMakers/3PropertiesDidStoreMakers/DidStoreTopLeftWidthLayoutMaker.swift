//
//  DidStoreTopLeftWidthLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopLeftWidthLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topLeft: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

extension DidStoreTopLeftWidthLayoutMaker {
	
	private func makeFrame(topLeft: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let frame = CGRect(x: topLeft.x,
		                   y: topLeft.y,
		                   width: width,
		                   height: height)
		
		return frame
		
	}
	
}

extension DidStoreTopLeftWidthLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: property)
		let width = self.width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		return self.makeFrame(topLeft: topLeft, width: width, height: height)
		
	}
	
}
