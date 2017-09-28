//
//  CenterMiddleWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterMiddleWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: CGRect.Float
	
	let middle: CGRect.Float
	
	let width: CGRect.Float
	
}

extension CenterMiddleWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LayoutEditor {
		
		return self.setHeight(by: { _ in height })
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let height = height(parameter)
			let width = self.width.evaluated(from: parameter)
			let x = self.center.evaluated(from: parameter) - width.half
			let y = self.middle.evaluated(from: parameter) - height.half
			let frame = CGRect(x: x,
			                   y: y,
			                   width: width,
			                   height: height)
			return frame
			
		})
        
        let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
