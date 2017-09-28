//
//  CenterTopBottomDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterTopBottomDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: CGRect.Float
	
	let top: CGRect.Float
	
	let bottom: CGRect.Float
	
}

extension CenterTopBottomDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> LayoutEditor {
		
		return self.setWidth(by: { _ in width })
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let top = self.top.closureValue(parameter)
			let bottom = self.bottom.closureValue(parameter)
			let height = bottom - top
			let center = self.center.closureValue(parameter)
			let width = width(parameter)
			let x = center - width.half
			let y = top
			let frame = CGRect(x: x, y: y, width: width, height: height)
			
			return frame
			
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
