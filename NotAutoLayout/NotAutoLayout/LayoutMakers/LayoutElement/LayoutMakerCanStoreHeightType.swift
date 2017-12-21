//
//  LayoutMakerCanStoreHeightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanStoreHeightType: LayoutMakerType {
	
	associatedtype WillSetHeightMaker
	
	func storeHeight(_ height: LayoutElement.Length) -> WillSetHeightMaker
	
}

extension LayoutMakerCanStoreHeightType {
	
	public func setHeight(to height: CGFloat) -> WillSetHeightMaker {
		
		let height = LayoutElement.Length.constant(height)
		
		let maker = self.storeHeight(height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: ViewFrameProperty) -> CGFloat) -> WillSetHeightMaker {
		
		let height = LayoutElement.Length.closure(height)
		
		let maker = self.storeHeight(height)
		
		return maker
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> WillSetHeightMaker {
		
		let height = LayoutElement.Length.fits(fittingHeight)
		
		let maker = self.storeHeight(height)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanStoreHeightToEvaluateFrameType: LayoutMakerCanStoreHeightType where WillSetHeightMaker == LayoutEditor {
	
	func evaluateFrame(height: LayoutElement.Length, parameter: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutMakerCanStoreHeightToEvaluateFrameType {
	
	public func storeHeight(_ height: LayoutElement.Length) -> WillSetHeightMaker {
		
		let layout = Layout(frame: { (parameter, fitting) -> CGRect in
			return self.evaluateFrame(height: height, parameter: parameter, fittingCalculation: fitting)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
