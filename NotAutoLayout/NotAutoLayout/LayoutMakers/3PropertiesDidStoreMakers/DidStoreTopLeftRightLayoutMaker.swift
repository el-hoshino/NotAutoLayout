//
//  DidStoreTopLeftRightLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopLeftRightLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topLeft: LayoutElement.Point
	
	let right: LayoutElement.Line
	
}

extension DidStoreTopLeftRightLayoutMaker {
	
	private func makeFrame(topLeft: CGPoint, right: CGFloat, height: CGFloat) -> CGRect {
		
		let x = topLeft.x
		let y = topLeft.y
		let width = right - x
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension DidStoreTopLeftRightLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameter)
		let right = self.right.evaluated(from: parameter)
		let width = right - topLeft.x
		let height = height.evaluated(from: parameter, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		return self.makeFrame(topLeft: topLeft, right: right, height: height)
		
	}
	
}

extension DidStoreTopLeftRightLayoutMaker: LayoutMakerCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomMaker = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Line, parameter: LayoutControlParameter) -> CGRect {
		
		let topLeft = self.topLeft.evaluated(from: parameter)
		let right = self.right.evaluated(from: parameter)
		let bottom = bottom.evaluated(from: parameter)
		let height = bottom - topLeft.y
		return self.makeFrame(topLeft: topLeft, right: right, height: height)
		
	}
	
}
