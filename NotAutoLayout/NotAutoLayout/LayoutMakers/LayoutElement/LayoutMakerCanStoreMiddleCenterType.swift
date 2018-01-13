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
	
	func storeMiddleCenter(_ middleCenter: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetMiddleCenterProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreMiddleCenterType {
	
	public func setMiddleCenter(to middleCenter: CGPoint) -> LayoutMaker<Property.WillSetMiddleCenterProperty> {
		
		let middleCenter = LayoutElement.Point.constant(middleCenter)
		let maker = self.didSetProperty.storeMiddleCenter(middleCenter, to: self)
		
		return maker
		
	}
	
	public func setMiddleCenter(by middleCenter: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> LayoutMaker<Property.WillSetMiddleCenterProperty> {
		
		let middleCenter = LayoutElement.Point.byParent(middleCenter)
		let maker = self.didSetProperty.storeMiddleCenter(middleCenter, to: self)
		
		return maker
		
	}
	
	public func pinMiddleCenter(to referenceView: UIView?, with middleCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<Property.WillSetMiddleCenterProperty> {
		
		return self.pinMiddleCenter(by: { [weak referenceView] in referenceView }, with: middleCenter)
		
	}
	
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, with middleCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> LayoutMaker<Property.WillSetMiddleCenterProperty> {
		
		let middleCenter = LayoutElement.Point.byReference(referenceGetter: referenceView, middleCenter)
		let maker = self.didSetProperty.storeMiddleCenter(middleCenter, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType: LayoutPropertyCanStoreMiddleCenterType {
	
	func evaluateFrame(middleCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect
	
}

extension LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point, to maker: LayoutMaker<Self>) -> LayoutMaker<DidStoreAllRequiredLayoutProperty> {
		
		let layout = Layout(frame: { (property) -> CGRect in
			return self.evaluateFrame(middleCenter: middleCenter, property: property)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
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
