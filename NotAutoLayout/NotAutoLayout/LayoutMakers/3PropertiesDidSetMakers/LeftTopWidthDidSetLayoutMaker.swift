//
//  LeftPointTopPointWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftTopWidthDidSetLayoutMaker {
		
	public unowned let parentView: UIView
	
	let left: CGRect.Float
	
	let top: CGRect.Float
	
	let width: CGRect.Float
	
}

extension LeftTopWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LayoutEditor {
		
		return self.setHeight(by: { _ in height })
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let width = self.width.closureValue(parameter)
			let height = height(parameter)
			let x = self.left.closureValue(parameter)
			let y = self.top.closureValue(parameter)
			let frame = CGRect(x: x, y: y, width: width, height: height)
			return frame
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
}
