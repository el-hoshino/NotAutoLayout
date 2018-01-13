//
//  LayoutPropertyCanStoreTopCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreTopCenterType: LayoutMakerPropertyType {
	
	associatedtype WillSetTopCenterProperty
	
	func storeTopCenter(_ topCenter: LayoutElement.Point) -> WillSetTopCenterProperty
	
}

extension LayoutPropertyCanStoreTopCenterType {
	
	public func setTopCenter(to topCenter: CGPoint) -> WillSetTopCenterProperty {
		
		let topCenter = LayoutElement.Point.constant(topCenter)
		
		let maker = self.storeTopCenter(topCenter)
		
		return maker
		
	}
	
	public func setTopCenter(by topCenter: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> WillSetTopCenterProperty {
		
		let topCenter = LayoutElement.Point.byParent(topCenter)
		
		let maker = self.storeTopCenter(topCenter)
		
		return maker
		
	}
	
	public func pinTopCenter(to referenceView: UIView?, with topCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetTopCenterProperty {
		
		return self.pinTopCenter(by: { [weak referenceView] in referenceView }, with: topCenter)
		
	}
	
	public func pinTopCenter(by referenceView: @escaping () -> UIView?, with topCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetTopCenterProperty {
		
		let topCenter = LayoutElement.Point.byReference(referenceGetter: referenceView, topCenter)
		
		let maker = self.storeTopCenter(topCenter)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreTopCenterToEvaluateFrameType: LayoutPropertyCanStoreTopCenterType where WillSetTopCenterProperty == LayoutEditor {
	
	func evaluateFrame(topCenter: LayoutElement.Point, parentView: UIView, property: ViewFrameProperty, fitting: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public func storeTopCenter(_ topCenter: LayoutElement.Point) -> WillSetTopCenterProperty {
		
		let layout = Layout(frame: { (parentView, property, fitting) -> CGRect in
			return self.evaluateFrame(topCenter: topCenter, parentView: parentView, property: property, fitting: fitting)
		})

		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

@available(*, deprecated)
extension LayoutPropertyCanStoreTopCenterType {
	
	public func pinTopCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopCenterProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopCenterProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTopCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopCenterProperty {
		
		let topCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeTopCenter(topCenter)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopCenterProperty {
		
		let topCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeTopCenter(topCenter)
		
		return maker
		
	}
	
}
