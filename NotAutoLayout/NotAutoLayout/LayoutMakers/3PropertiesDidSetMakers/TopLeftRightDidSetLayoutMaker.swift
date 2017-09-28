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
	
	let topLeft: CGRect.Point
	
	let right: CGRect.Float
	
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

extension TopLeftRightDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LayoutEditor {
		
		return self.setHeight(by: { _ in height })
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let topLeft = self.topLeft.closureValue(parameter)
			let right = self.right.closureValue(parameter)
			let height = height(parameter)
			let frame = self.makeFrame(topLeft: topLeft, right: right, height: height)
			
			return frame
			
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> LayoutEditor {
		
		let layout = Layout.makeCustom { (fitting, boundSize) -> CGRect in
			
			let topLeft = self.topLeft.closureValue(boundSize)
			let right = self.right.closureValue(boundSize)
			let x = topLeft.x
			let width = right - x
			let fittingSize = CGSize(width: width, height: fittingHeight)
			let height = fitting(fittingSize).height
			let frame = self.makeFrame(topLeft: topLeft, right: right, height: height)
			
			return frame
			
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
