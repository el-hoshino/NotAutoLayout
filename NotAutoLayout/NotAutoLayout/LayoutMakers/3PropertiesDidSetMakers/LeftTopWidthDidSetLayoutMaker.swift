//
//  LeftPointTopPointWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftTopWidthDidSetLayoutMaker {
		
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let top: LayoutElement.Line
	
	let width: LayoutElement.Length
	
}

extension LeftTopWidthDidSetLayoutMaker: LayoutMakerCanSetHeightToMakeLayoutEditorType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func makeFrame(height: LayoutElement.Length, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let width = self.width.evaluated(from: parameter, fitting: fittingCalculation, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameter, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		let x = self.left.evaluated(from: parameter)
		let y = self.top.evaluated(from: parameter)
		return CGRect(x: x, y: y, width: width, height: height)
		
	}
}

