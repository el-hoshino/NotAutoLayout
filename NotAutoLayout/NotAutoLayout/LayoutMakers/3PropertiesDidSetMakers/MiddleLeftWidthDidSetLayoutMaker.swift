//
//  MiddleLeftWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleLeftWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleLeft: CGRect.Point
	
	let width: CGRect.Float
	
}

extension MiddleLeftWidthDidSetLayoutMaker {
	
	private func makeFrame(middleLeft: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleLeft.x
		let y = middleLeft.y - height.half
		let size = CGSize(width: width, height: height)
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension MiddleLeftWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LayoutEditor {
		
		return self.setHeight(by: { _ in height })
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let middleLeft = self.middleLeft.evaluated(from: parameter)
			let width = self.width.evaluated(from: parameter)
			let height = height(parameter)
			let frame = self.makeFrame(middleLeft: middleLeft, width: width, height: height)
			
			return frame
			
		})
        
        let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
