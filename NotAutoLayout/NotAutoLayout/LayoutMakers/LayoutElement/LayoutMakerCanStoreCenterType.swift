//
//  LayoutMakerCanStoreCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanStoreCenterType: LayoutMakerType {
	
	associatedtype WillSetCenterMaker
	
	func storeCenter(_ center: LayoutElement.Horizontal) -> WillSetCenterMaker
	
}

extension LayoutMakerCanStoreCenterType {
	
	public func setCenter(to center: CGFloat) -> WillSetCenterMaker {
		
		let center = LayoutElement.Horizontal.constant(center)
		
		let maker = self.storeCenter(center)
		
		return maker
		
	}
	
	public func setCenter(by center: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> WillSetCenterMaker {
		
		let center = LayoutElement.Horizontal.byParent(center)
		
		let maker = self.storeCenter(center)
		
		return maker
		
	}
	
	public func pinCenter(to referenceView: UIView?, with center: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> WillSetCenterMaker {
		
		return self.pinCenter(by: { [weak referenceView] in referenceView }, with: center)
		
	}
	
	public func pinCenter(by referenceView: @escaping () -> UIView?, with center: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> WillSetCenterMaker {
		
		let center = LayoutElement.Horizontal.byReference(referenceGetter: referenceView, center)
		
		let maker = self.storeCenter(center)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanStoreCenterToEvaluateFrameType: LayoutMakerCanStoreCenterType where WillSetCenterMaker == LayoutEditor {
	
	func evaluateFrame(center: LayoutElement.Horizontal, property: ViewFrameProperty) -> CGRect
	
}

extension LayoutMakerCanStoreCenterToEvaluateFrameType {
	
	public func storeCenter(_ center: LayoutElement.Horizontal) -> WillSetCenterMaker {
		
		let layout = Layout(frame: { (property) -> CGRect in
			return self.evaluateFrame(center: center, property: property)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

@available(*, deprecated)
extension LayoutMakerCanStoreCenterType {
	
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
		
		let maker = self.storeCenter(center)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetCenterMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeCenter(center)
		
		return maker
		
	}
	
}
