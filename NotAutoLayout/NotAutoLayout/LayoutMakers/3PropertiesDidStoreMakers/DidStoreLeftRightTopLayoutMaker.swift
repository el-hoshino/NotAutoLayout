//
//  DidStoreLeftRightTopLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftRightTopLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let right: LayoutElement.Line
	
	let top: LayoutElement.Line
	
}

extension DidStoreLeftRightTopLayoutMaker {
	
	private func makeFrame(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let width = right - x
		let height = bottom - y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(left: CGFloat, right: CGFloat, top: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let width = right - x
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension DidStoreLeftRightTopLayoutMaker: LayoutMakerCanStoreBottomToEvaluateFrameType {
	
	public typealias WillSetBottomMaker = LayoutEditor
	
	public func evaluateFrame(bottom: LayoutElement.Line, parameter: LayoutControlParameter) -> CGRect {
		let left = self.left.evaluated(from: parameter)
		let right = self.right.evaluated(from: parameter)
		let top = self.top.evaluated(from: parameter)
		let bottom = bottom.evaluated(from: parameter)
		return self.makeFrame(left: left, right: right, top: top, bottom: bottom)
	}
	
}

extension DidStoreLeftRightTopLayoutMaker: LayoutMakerCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let left = self.left.evaluated(from: parameter)
		let right = self.right.evaluated(from: parameter)
		let top = self.top.evaluated(from: parameter)
		let width = right - left
		let height = height.evaluated(from: parameter, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		return self.makeFrame(left: left, right: right, top: top, height: height)
		
	}
	
}
