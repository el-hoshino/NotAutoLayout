//
//  LayoutPropertyCanStoreWidthType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreWidthType: LayoutMakerPropertyType {
	
	associatedtype WillSetWidthMaker
	
	func storeWidth(_ width: LayoutElement.Length) -> WillSetWidthMaker
	
}

extension LayoutPropertyCanStoreWidthType {
	
	public func setWidth(to width: CGFloat) -> WillSetWidthMaker {
		
		let width = LayoutElement.Length.constant(width)
		
		let maker = self.storeWidth(width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> WillSetWidthMaker {
		
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

public protocol LayoutPropertyCanStoreWidthToEvaluateFrameType: LayoutPropertyCanStoreWidthType where WillSetWidthMaker == LayoutEditor {
	
	func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutPropertyCanStoreWidthToEvaluateFrameType {

	public func storeWidth(_ width: LayoutElement.Length) -> WillSetWidthMaker {
		
		let layout = Layout(frame: { (property, fitting) -> CGRect in
			return self.evaluateFrame(width: width, property: property, fittingCalculation: fitting)
		})
		
		let editor = LayoutEditor(layout)

		return editor

	}

}
