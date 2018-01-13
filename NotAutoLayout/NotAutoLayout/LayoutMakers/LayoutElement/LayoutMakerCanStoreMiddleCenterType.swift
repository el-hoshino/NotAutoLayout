//
//  LayoutPropertyCanStoreMiddleCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreMiddleCenterType: LayoutMakerPropertyType {
	
	associatedtype WillSetMiddleCenterProperty
	
	func storeMiddleCenter(_ middleCenter: LayoutElement.Point) -> WillSetMiddleCenterProperty
	
}

extension LayoutPropertyCanStoreMiddleCenterType {
	
	public func setMiddleCenter(to middleCenter: CGPoint) -> WillSetMiddleCenterProperty {
		
		let middleCenter = LayoutElement.Point.constant(middleCenter)
		
		let maker = self.storeMiddleCenter(middleCenter)
		
		return maker
		
	}
	
	public func setMiddleCenter(by middleCenter: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> WillSetMiddleCenterProperty {
		
		let middleCenter = LayoutElement.Point.byParent(middleCenter)
		
		let maker = self.storeMiddleCenter(middleCenter)
		
		return maker
		
	}
	
	public func pinMiddleCenter(to referenceView: UIView?, with middleCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetMiddleCenterProperty {
		
		return self.pinMiddleCenter(by: { [weak referenceView] in referenceView }, with: middleCenter)
		
	}
	
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, with middleCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetMiddleCenterProperty {
		
		let middleCenter = LayoutElement.Point.byReference(referenceGetter: referenceView, middleCenter)
		
		let maker = self.storeMiddleCenter(middleCenter)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType: LayoutPropertyCanStoreMiddleCenterType where WillSetMiddleCenterProperty == LayoutEditor {
	
	func evaluateFrame(middleCenter: LayoutElement.Point, parentView: UIView, property: ViewFrameProperty, fitting: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point) -> WillSetMiddleCenterProperty {
		
		let layout = Layout(frame: { (parentView, property, fitting) -> CGRect in
			return self.evaluateFrame(middleCenter: middleCenter, parentView: parentView, property: property, fitting: fitting)
		})

		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

@available(* , deprecated)
extension LayoutPropertyCanStoreMiddleCenterType {
	
	public func pinMiddleCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetMiddleCenterProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleCenterProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetMiddleCenterProperty {
		
		let middleCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeMiddleCenter(middleCenter)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleCenterProperty {
		
		let middleCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeMiddleCenter(middleCenter)
		
		return maker
		
	}
	
}
