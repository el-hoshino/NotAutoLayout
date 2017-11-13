//
//  DidStoreCenterTopBottomLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterTopBottomLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
	let top: LayoutElement.Line
	
	let bottom: LayoutElement.Line
	
}

extension DidStoreCenterTopBottomLayoutMaker {
	
	private func makeFrame(center: CGFloat, top: CGFloat, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let x = center - width.half
		let y = top
		let height = bottom - top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension DidStoreCenterTopBottomLayoutMaker: LayoutMakerCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthMaker = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		let top = self.top.evaluated(from: parameter)
		let bottom = self.bottom.evaluated(from: parameter)
		let height = bottom - top
		let center = self.center.evaluated(from: parameter)
		let width = width.evaluated(from: parameter, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		let x = center - width.half
		let y = top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
	}
	
}
