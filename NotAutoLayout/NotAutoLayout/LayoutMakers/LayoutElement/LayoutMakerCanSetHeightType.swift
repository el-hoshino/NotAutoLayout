//
//  LayoutMakerCanSetHeightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanSetHeightType: LayoutMakerType {
	
	associatedtype WillSetHeightMaker
	
	func setHeight(_ height: LayoutElement.Length) -> WillSetHeightMaker
	
}

extension LayoutMakerCanSetHeightType {
	
	public func setHeight(to height: CGFloat) -> WillSetHeightMaker {
		
		let height = LayoutElement.Length.constant(height)
		
		let maker = self.setHeight(height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> WillSetHeightMaker {
		
		let height = LayoutElement.Length.closure(height)
		
		let maker = self.setHeight(height)
		
		return maker
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> WillSetHeightMaker {
		
		let height = LayoutElement.Length.fits(fittingHeight)
		
		let maker = self.setHeight(height)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanSetHeightToMakeLayoutEditorType: LayoutMakerCanSetHeightType where WillSetHeightMaker == LayoutEditor {
	
	func makeFrame(height: LayoutElement.Length, parameter: LayoutControlParameter) -> CGRect
	
}

extension LayoutMakerCanSetHeightToMakeLayoutEditorType {
	
	public func setHeight(_ height: LayoutElement.Length) -> WillSetHeightMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.makeFrame(height: height, parameter: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
