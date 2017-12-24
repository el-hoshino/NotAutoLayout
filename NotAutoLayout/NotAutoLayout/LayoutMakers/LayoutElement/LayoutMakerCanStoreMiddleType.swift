//
//  LayoutPropertyCanStoreMiddleType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreMiddleType: LayoutMakerPropertyType {
	
	associatedtype WillSetMiddleMaker
	
	func storeMiddle(_ middle: LayoutElement.Vertical) -> WillSetMiddleMaker
	
}

extension LayoutPropertyCanStoreMiddleType {
	
	public func setMiddle(to middle: CGFloat) -> WillSetMiddleMaker {
		
		let middle = LayoutElement.Vertical.constant(middle)
		
		let maker = self.storeMiddle(middle)
		
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> WillSetMiddleMaker {
		
		let middle = LayoutElement.Vertical.byParent(middle)
		
		let maker = self.storeMiddle(middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, with middle: @escaping (ViewPinProperty<ViewPinPropertyType.Vertical>) -> CGFloat) -> WillSetMiddleMaker {
		
		return self.pinMiddle(by: { [weak referenceView] in referenceView }, with: middle)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, with middle: @escaping (ViewPinProperty<ViewPinPropertyType.Vertical>) -> CGFloat) -> WillSetMiddleMaker {
		
		let middle = LayoutElement.Vertical.byReference(referenceGetter: referenceView, middle)
		
		let maker = self.storeMiddle(middle)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleToEvaluateFrameType: LayoutPropertyCanStoreMiddleType where WillSetMiddleMaker == LayoutEditor {
	
	func evaluateFrame(middle: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect
	
}

extension LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> WillSetMiddleMaker {
		
		let layout = Layout(frame: { (property) -> CGRect in
			return self.evaluateFrame(middle: middle, property: property)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

@available(*, deprecated)
extension LayoutPropertyCanStoreMiddleType {
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetMiddleMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetMiddleMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeMiddle(middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeMiddle(middle)
		
		return maker
		
	}
	
}
