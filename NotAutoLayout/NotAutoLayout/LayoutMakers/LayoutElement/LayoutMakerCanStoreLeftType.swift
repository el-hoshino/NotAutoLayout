//
//  LayoutMakerCanStoreLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanStoreLeftType: LayoutMakerType {
	
	associatedtype WillSetLeftMaker
	
	func storeLeft(_ left: LayoutElement.Horizontal) -> WillSetLeftMaker
	
}

extension LayoutMakerCanStoreLeftType {
	
	public func setLeft(to left: CGFloat) -> WillSetLeftMaker {
		
		let left = LayoutElement.Horizontal.constant(left)
		
		let maker = self.storeLeft(left)
		
		return maker
		
	}
	
	public func setLeft(by left: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> WillSetLeftMaker {
		
		let left = LayoutElement.Horizontal.byParent(left)
		
		let maker = self.storeLeft(left)
		
		return maker
		
	}
	
	public func pinLeft(to referenceView: UIView?, with left: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> WillSetLeftMaker {
		
		return self.pinLeft(by: { [weak referenceView] in referenceView }, with: left)
		
	}
	
	public func pinLeft(by referenceView: @escaping () -> UIView?, with left: @escaping (ViewPinProperty<ViewPinPropertyType.Horizontal>) -> CGFloat) -> WillSetLeftMaker {
		
		let left = LayoutElement.Horizontal.byReference(referenceGetter: referenceView, left)
		
		let maker = self.storeLeft(left)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanStoreLeftToEvaluateFrameType: LayoutMakerCanStoreLeftType where WillSetLeftMaker == LayoutEditor {
	
	func evaluateFrame(left: LayoutElement.Horizontal, property: ViewFrameProperty) -> CGRect
	
}

extension LayoutMakerCanStoreLeftToEvaluateFrameType {
	
	public func storeLeft(_ left: LayoutElement.Horizontal) -> WillSetLeftMaker {
		
		let layout = Layout(frame: { (property) -> CGRect in
			return self.evaluateFrame(left: left, property: property)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

@available(*, deprecated)
extension LayoutMakerCanStoreLeftType {
	
	public func pinLeft(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetLeftMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinLeft(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetLeftMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetLeftMaker {
		
		let left = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeLeft(left)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetLeftMaker {
		
		let left = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeLeft(left)
		
		return maker
		
	}
	
}
