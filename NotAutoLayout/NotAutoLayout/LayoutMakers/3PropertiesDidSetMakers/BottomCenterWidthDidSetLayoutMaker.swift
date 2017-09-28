//
//  BottomCenterWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct BottomCenterWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomCenter: CGRect.Point
	
	let width: CGRect.Float
	
}

extension BottomCenterWidthDidSetLayoutMaker {
	
	private func makeFrame(bottomCenter: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let frame = CGRect(x: bottomCenter.x - width.half,
		                   y: bottomCenter.y - height,
		                   width: width,
		                   height: height)
		
		return frame
		
	}
	
}

extension BottomCenterWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LayoutEditor {
		
		return self.setHeight(by: { _ in height })
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let bottomCenter = self.bottomCenter.closureValue(parameter)
			let width = self.width.closureValue(parameter)
			let height = height(parameter)
			let frame = self.makeFrame(bottomCenter: bottomCenter, width: width, height: height)
			
			return frame
			
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> LayoutEditor {
		
		let layout = Layout.makeCustom { (fitting, boundSize) -> CGRect in
			
			let bottomCenter = self.bottomCenter.closureValue(boundSize)
			let width = self.width.closureValue(boundSize)
			let height = fitting(CGSize(width: width, height: fittingHeight)).height
			let frame = self.makeFrame(bottomCenter: bottomCenter, width: width, height: height)
			
			return frame
			
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
