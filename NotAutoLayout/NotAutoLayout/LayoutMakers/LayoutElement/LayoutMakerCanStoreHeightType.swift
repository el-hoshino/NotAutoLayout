//
//  LayoutPropertyCanStoreHeightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreHeightType: LayoutMakerPropertyType {
	
	associatedtype WillSetHeightProperty
	
	func storeHeight(_ height: LayoutElement.Length) -> WillSetHeightProperty
	
}

extension LayoutPropertyCanStoreHeightType {
	
	public func setHeight(to height: CGFloat) -> WillSetHeightProperty {
		
		let height = LayoutElement.Length.constant(height)
		
		let maker = self.storeHeight(height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> WillSetHeightProperty {
		
		let height = LayoutElement.Length.closure(height)
		
		let maker = self.storeHeight(height)
		
		return maker
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> WillSetHeightProperty {
		
		let height = LayoutElement.Length.fits(fittingHeight)
		
		let maker = self.storeHeight(height)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreHeightToEvaluateFrameType: LayoutPropertyCanStoreHeightType where WillSetHeightProperty == LayoutEditor {
	
	func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func storeHeight(_ height: LayoutElement.Length) -> WillSetHeightProperty {
		
		let layout = Layout(frame: { (property, fitting) -> CGRect in
			return self.evaluateFrame(height: height, property: property, fittingCalculation: fitting)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
