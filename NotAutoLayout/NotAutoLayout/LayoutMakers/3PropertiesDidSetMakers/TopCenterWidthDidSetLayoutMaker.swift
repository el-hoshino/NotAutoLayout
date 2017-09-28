//
//  TopCenterWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopCenterWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topCenter: CGRect.Point
	
	let width: CGRect.Float
	
}

extension TopCenterWidthDidSetLayoutMaker {
	
	private func makeFrame(topCenter: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let frame = CGRect(x: topCenter.x - width.half,
		                   y: topCenter.y,
		                   width: width,
		                   height: height)
		
		return frame
		
	}
	
}

extension TopCenterWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LayoutEditor {
		
		return self.setHeight(by: { _ in height })
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let topCenter = self.topCenter.closureValue(parameter)
			let width = self.width.closureValue(parameter)
			let height = height(parameter)
			let frame = self.makeFrame(topCenter: topCenter, width: width, height: height)
			
			return frame
			
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> LayoutEditor {
		
		let layout = Layout.makeCustom { (fitting, boundSize) -> CGRect in
			
			let topCenter = self.topCenter.closureValue(boundSize)
			let width = self.width.closureValue(boundSize)
			let height = fitting(CGSize(width: width, height: fittingHeight)).height
			let frame = self.makeFrame(topCenter: topCenter, width: width, height: height)
			
			return frame
			
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
