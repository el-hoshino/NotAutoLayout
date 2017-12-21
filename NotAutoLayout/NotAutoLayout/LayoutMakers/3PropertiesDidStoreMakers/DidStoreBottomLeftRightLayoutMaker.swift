//
//  DidStoreBottomLeftRightLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomLeftRightLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomLeft: LayoutElement.Point
	
	let right: LayoutElement.Line
	
}

extension DidStoreBottomLeftRightLayoutMaker {
	
	private func makeFrame(bottomLeft: CGPoint, right: CGFloat, top: CGFloat) -> CGRect {
		
		let x = bottomLeft.x
		let y = top
		let width = right - x
		let height = bottomLeft.y - y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension DidStoreBottomLeftRightLayoutMaker: LayoutMakerCanStoreTopToEvaluateFrameType {
	
	public typealias WillSetTopMaker = LayoutEditor
	
	public func evaluateFrame(top: LayoutElement.Line, property: ViewFrameProperty) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let right = self.right.evaluated(from: property)
		let top = top.evaluated(from: property)
		return self.makeFrame(bottomLeft: bottomLeft, right: right, top: top)
	}
	
}
