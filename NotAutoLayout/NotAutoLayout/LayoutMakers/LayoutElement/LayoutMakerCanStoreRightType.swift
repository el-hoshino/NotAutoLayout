//
//  LayoutPropertyCanStoreRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreRightType: LayoutMakerPropertyType {
	
	associatedtype WillSetRightProperty
	
	func storeRight(_ right: LayoutElement.Horizontal) -> WillSetRightProperty
	
}

extension LayoutPropertyCanStoreRightType {
	
	public func setRight(to right: CGFloat) -> WillSetRightProperty {
		
		let right = LayoutElement.Horizontal.constant(right)
		
		let maker = self.storeRight(right)
		
		return maker
		
	}
	
	public func setRight(by right: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> WillSetRightProperty {
		
		let right = LayoutElement.Horizontal.byParent(right)
		
		let maker = self.storeRight(right)
		
		return maker
		
	}
	
	public func pinRight(to referenceView: UIView?, with right: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> WillSetRightProperty {
		
		return self.pinRight(by: { [weak referenceView] in referenceView }, with: right)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, with right: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> WillSetRightProperty {
		
		let right = LayoutElement.Horizontal.byReference(referenceGetter: referenceView, right)
		
		let maker = self.storeRight(right)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreRightToEvaluateFrameType: LayoutPropertyCanStoreRightType where WillSetRightProperty == LayoutEditor {
	
	func evaluateFrame(right: LayoutElement.Horizontal, property: ViewFrameProperty) -> CGRect
	
}

extension LayoutPropertyCanStoreRightToEvaluateFrameType {
	
	public func storeRight(_ right: LayoutElement.Horizontal) -> WillSetRightProperty {
		
		let layout = Layout(frame: { (property) -> CGRect in
			return self.evaluateFrame(right: right, property: property)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

@available(*, deprecated)
extension LayoutPropertyCanStoreRightType {
	
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetRightProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetRightProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetRightProperty {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeRight(right)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetRightProperty {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeRight(right)
		
		return maker
		
	}
	
}
