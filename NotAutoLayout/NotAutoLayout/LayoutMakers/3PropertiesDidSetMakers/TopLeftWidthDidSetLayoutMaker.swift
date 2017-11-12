//
//  TopLeftWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopLeftWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topLeft: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

extension TopLeftWidthDidSetLayoutMaker {
	
	private func makeFrame(topLeft: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let frame = CGRect(x: topLeft.x,
		                   y: topLeft.y,
		                   width: width,
		                   height: height)
		
		return frame
		
	}
	
}

extension TopLeftWidthDidSetLayoutMaker: LayoutMakerCanSetHeightToMakeLayoutEditorType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func makeFrame(height: LayoutElement.Length, parameter: LayoutControlParameter) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameter)
		let width = self.width.evaluated(from: parameter, theOtherAxis: .height(0))
		let height = height.evaluated(from: parameter, theOtherAxis: .width(width))
		return self.makeFrame(topLeft: topLeft, width: width, height: height)
		
	}
	
}
