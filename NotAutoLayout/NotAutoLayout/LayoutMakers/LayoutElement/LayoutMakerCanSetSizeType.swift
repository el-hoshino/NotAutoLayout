//
//  LayoutMakerCanSetSizeType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/13.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanSetSizeType: LayoutMakerType {
	
	associatedtype WillSetSizeMaker
	
	func setSize(_ size: LayoutElement.Size) -> WillSetSizeMaker
	
}

extension LayoutMakerCanSetSizeType {
	
	public func setSize(to size: CGSize) -> WillSetSizeMaker {
		
		let size = LayoutElement.Size.constant(size)
		
		let maker = self.setSize(size)
		
		return maker
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> WillSetSizeMaker {
		
		let size = LayoutElement.Size.closure(size)
		
		let maker = self.setSize(size)
		
		return maker
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> WillSetSizeMaker {
		
		let size = LayoutElement.Size.fits(fittingSize)
		
		let maker = self.setSize(size)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanSetSizeToMakeLayoutEditorType: LayoutMakerCanSetSizeType where WillSetSizeMaker == LayoutEditor {
	
	func makeFrame(size: LayoutElement.Size, parameter: LayoutControlParameter) -> CGRect
	
}

extension LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public func setSize(_ size: LayoutElement.Size) -> WillSetSizeMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.makeFrame(size: size, parameter: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
