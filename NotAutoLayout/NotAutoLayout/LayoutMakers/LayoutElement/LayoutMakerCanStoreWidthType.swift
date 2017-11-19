//
//  LayoutMakerCanStoreWidthType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanStoreWidthType: LayoutMakerType {
	
	associatedtype WillSetWidthMaker
	
	func storeWidth(_ width: LayoutElement.Length) -> WillSetWidthMaker
	
}

extension LayoutMakerCanStoreWidthType {
	
	public func setWidth(to width: CGFloat) -> WillSetWidthMaker {
		
		let width = LayoutElement.Length.constant(width)
		
		let maker = self.storeWidth(width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> WillSetWidthMaker {
		
		let width = LayoutElement.Length.closure(width)
		
		let maker = self.storeWidth(width)
		
		return maker
		
	}
	
	public func fitWidth(by fittingWidth: CGFloat = 0) -> WillSetWidthMaker {
		
		let width = LayoutElement.Length.fits(fittingWidth)
		
		let maker = self.storeWidth(width)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanStoreWidthToEvaluateFrameType: LayoutMakerCanStoreWidthType where WillSetWidthMaker == LayoutEditor {
	
	func evaluateFrame(width: LayoutElement.Length, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutMakerCanStoreWidthToEvaluateFrameType {

	public func storeWidth(_ width: LayoutElement.Length) -> WillSetWidthMaker {
		
		let layout = Layout(frame: { (parameter, fitting) -> CGRect in
			return self.evaluateFrame(width: width, parameter: parameter, fittingCalculation: fitting)
		})
		
		let editor = LayoutEditor(layout)

		return editor

	}

}
