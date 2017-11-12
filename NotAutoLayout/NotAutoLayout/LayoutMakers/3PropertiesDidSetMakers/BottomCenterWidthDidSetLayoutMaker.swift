//
//  BottomCenterWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct BottomCenterWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomCenter: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

extension BottomCenterWidthDidSetLayoutMaker {
	
	private func makeFrame(bottomCenter: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let frame = CGRect(x: bottomCenter.x - width.half,
		                   y: bottomCenter.y - height,
		                   width: width,
		                   height: height)
		
		return frame
		
	}
	
}

extension BottomCenterWidthDidSetLayoutMaker: LayoutMakerCanSetHeightToMakeLayoutEditorType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func makeFrame(height: LayoutElement.Length, parameter: LayoutControlParameter) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameter)
		let width = self.width.evaluated(from: parameter, theOtherAxis: .height(0))
		let height = height.evaluated(from: parameter, theOtherAxis: .width(width))
		return self.makeFrame(bottomCenter: bottomCenter, width: width, height: height)
		
	}
	
}
