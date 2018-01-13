//
//  LayoutPropertyCanStoreBottomCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreBottomCenterType: LayoutMakerPropertyType {
	
	associatedtype WillSetBottomCenterProperty
	
	func storeBottomCenter(_ bottomCenter: LayoutElement.Point) -> WillSetBottomCenterProperty
	
}

extension LayoutPropertyCanStoreBottomCenterType {
	
	public func setBottomCenter(to bottomCenter: CGPoint) -> WillSetBottomCenterProperty {
		
		let bottomCenter = LayoutElement.Point.constant(bottomCenter)
		
		let maker = self.storeBottomCenter(bottomCenter)
		
		return maker
		
	}
	
	public func setBottomCenter(by bottomCenter: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> WillSetBottomCenterProperty {
		
		let bottomCenter = LayoutElement.Point.byParent(bottomCenter)
		
		let maker = self.storeBottomCenter(bottomCenter)
		
		return maker
		
	}
	
	public func pinBottomCenter(to referenceView: UIView?, with bottomCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetBottomCenterProperty {
		
		return self.pinBottomCenter(by: { [weak referenceView] in referenceView }, with: bottomCenter)
		
	}
	
	public func pinBottomCenter(by referenceView: @escaping () -> UIView?, with bottomCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetBottomCenterProperty {
		
		let bottomCenter = LayoutElement.Point.byReference(referenceGetter: referenceView, bottomCenter)
		
		let maker = self.storeBottomCenter(bottomCenter)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomCenterToEvaluateFrameType: LayoutPropertyCanStoreBottomCenterType where WillSetBottomCenterProperty == LayoutEditor {
	
	func evaluateFrame(bottomCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect
	
}

extension LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public func storeBottomCenter(_ bottomCenter: LayoutElement.Point) -> WillSetBottomCenterProperty {
		
		let layout = Layout(frame: { (property) -> CGRect in
			return self.evaluateFrame(bottomCenter: bottomCenter, property: property)
		})

		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

extension LayoutPropertyCanStoreBottomCenterType {
	
	public func pinBottomCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetBottomCenterProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomCenterProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottomCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetBottomCenterProperty {
		
		let bottomCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeBottomCenter(bottomCenter)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomCenterProperty {
		
		let bottomCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeBottomCenter(bottomCenter)
		
		return maker
		
	}
	
}
