//
//  LayoutMakerCanSetWidthType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanSetWidthType: LayoutMakerType {
	
	associatedtype WillSetWidthMaker
	
	func setWidth(_ width: LayoutElement.Length) -> WillSetWidthMaker
	
}

extension LayoutMakerCanSetWidthType {
	
	public func setWidth(to width: CGFloat) -> WillSetWidthMaker {
		
		let width = LayoutElement.Length.constant(width)
		
		let maker = self.setWidth(width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> WillSetWidthMaker {
		
		let width = LayoutElement.Length.closure(width)
		
		let maker = self.setWidth(width)
		
		return maker
		
	}
	
	public func fitWidth(by fittingWidth: CGFloat = 0) -> WillSetWidthMaker {
		
		let width = LayoutElement.Length.fits(fittingWidth)
		
		let maker = self.setWidth(width)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanSetWidthToMakeLayoutEditorType: LayoutMakerCanSetWidthType where WillSetWidthMaker == LayoutEditor {
	
	func makeFrame(width: LayoutElement.Length, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutMakerCanSetWidthToMakeLayoutEditorType {

	public func setWidth(_ width: LayoutElement.Length) -> WillSetWidthMaker {
		
		let layout = Layout(frame: { (parameter, fitting) -> CGRect in
			return self.makeFrame(width: width, parameter: parameter, fittingCalculation: fitting)
		})
		
		let editor = LayoutEditor(layout)

		return editor

	}

}
