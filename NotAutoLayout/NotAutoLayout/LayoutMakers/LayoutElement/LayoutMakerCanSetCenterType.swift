//
//  LayoutMakerCanSetCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanSetCenterType: LayoutMakerType {
	
	associatedtype WillSetCenterMaker
	
	func setCenter(_ center: LayoutElement.Float) -> WillSetCenterMaker
	
}

extension LayoutMakerCanSetCenterType {
	
	public func setCenter(to center: CGFloat) -> WillSetCenterMaker {
		
		let center = LayoutElement.Float.constant(center)
		
		let maker = self.setCenter(center)
		
		return maker
		
	}
	
	public func setCenter(by center: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> WillSetCenterMaker {
		
		let center = LayoutElement.Float.closure(center)
		
		let maker = self.setCenter(center)
		
		return maker
		
	}
	
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetCenterMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetCenterMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetCenterMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.setCenter(center)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetCenterMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.setCenter(center)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanSetCenterToMakeLayoutEditorType: LayoutMakerCanSetCenterType where WillSetCenterMaker == LayoutEditor {
	
	func makeFrame(center: LayoutElement.Float, evaluatedFrom parameter: LayoutControlParameter) -> CGRect
	
}

extension LayoutMakerCanSetCenterToMakeLayoutEditorType {
	
	public func setCenter(_ center: LayoutElement.Float) -> WillSetCenterMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.makeFrame(center: center, evaluatedFrom: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
