//
//  TopLeftRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopLeftRightDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topLeft: LayoutElement.Point
	
	let right: LayoutElement.Line
	
}

extension TopLeftRightDidSetLayoutMaker {
	
	private func makeFrame(topLeft: CGPoint, right: CGFloat, height: CGFloat) -> CGRect {
		
		let x = topLeft.x
		let y = topLeft.y
		let width = right - x
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension TopLeftRightDidSetLayoutMaker: LayoutMakerCanSetHeightToMakeLayoutEditorType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func makeFrame(height: LayoutElement.Length, parameter: LayoutControlParameter) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameter)
		let right = self.right.evaluated(from: parameter)
		let width = right - topLeft.x
		let height = height.evaluated(from: parameter, theOtherAxis: .width(width))
		return self.makeFrame(topLeft: topLeft, right: right, height: height)
		
	}
	
}
