//
//  TopCenterBottomDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopCenterBottomDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topCenter: LayoutElement.Point
	
	let bottom: LayoutElement.Float
	
}

extension TopCenterBottomDidSetLayoutMaker {
	
	private func makeFrame(topCenter: CGPoint, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let height = bottom - topCenter.y
		let x = topCenter.x - width.half
		let y = topCenter.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension TopCenterBottomDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> LayoutEditor {
		
		return self.setWidth(by: { _ in width })
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let topCenter = self.topCenter.evaluated(from: parameter)
			let bottom = self.bottom.evaluated(from: parameter)
			let width = width(parameter)
			let frame = self.makeFrame(topCenter: topCenter, bottom: bottom, width: width)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
