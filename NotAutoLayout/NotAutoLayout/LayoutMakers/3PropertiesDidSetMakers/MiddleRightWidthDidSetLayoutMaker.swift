//
//  MiddleRightWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleRightWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleRight: LayoutElement.Point
	
	let width: LayoutElement.Line
	
}

extension MiddleRightWidthDidSetLayoutMaker {
	
	private func makeFrame(middleRight: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleRight.x - width
		let y = middleRight.y - height.half
		let size = CGSize(width: width, height: height)
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension MiddleRightWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LayoutEditor {
		
		return self.setHeight(by: { _ in height })
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let middleRight = self.middleRight.evaluated(from: parameter)
			let width = self.width.evaluated(from: parameter)
			let height = height(parameter)
			let frame = self.makeFrame(middleRight: middleRight, width: width, height: height)
			
			return frame
			
		})
        
        let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
