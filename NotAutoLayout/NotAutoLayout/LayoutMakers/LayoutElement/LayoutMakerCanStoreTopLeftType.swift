//
//  LayoutPropertyCanStoreTopLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreTopLeftType: LayoutMakerPropertyType {
	
	associatedtype WillSetTopLeftProperty
	
	func storeTopLeft(_ topLeft: LayoutElement.Point) -> WillSetTopLeftProperty
	
}

extension LayoutPropertyCanStoreTopLeftType {
	
	public func setTopLeft(to topLeft: CGPoint) -> WillSetTopLeftProperty {
		
		let topLeft = LayoutElement.Point.constant(topLeft)
		
		let maker = self.storeTopLeft(topLeft)
		
		return maker
		
	}
	
	public func setTopLeft(by topLeft: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> WillSetTopLeftProperty {
		
		let topLeft = LayoutElement.Point.byParent(topLeft)
		
		let maker = self.storeTopLeft(topLeft)
		
		return maker
		
	}
	
	public func pinTopLeft(to referenceView: UIView?, with topLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetTopLeftProperty {
		
		return self.pinTopLeft(by: { [weak referenceView] in referenceView }, with: topLeft)
		
	}
	
	public func pinTopLeft(by referenceView: @escaping () -> UIView?, with topLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetTopLeftProperty {
		
		let topLeft = LayoutElement.Point.byReference(referenceGetter: referenceView, topLeft)
		
		let maker = self.storeTopLeft(topLeft)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreTopLeftToEvaluateFrameType: LayoutPropertyCanStoreTopLeftType where WillSetTopLeftProperty == LayoutEditor {
	
	func evaluateFrame(topLeft: LayoutElement.Point, parentView: UIView, property: ViewFrameProperty, fitting: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
	
	public func storeTopLeft(_ topLeft: LayoutElement.Point) -> WillSetTopLeftProperty {
		
		let layout = Layout(frame: { (parentView, property, fitting) -> CGRect in
			return self.evaluateFrame(topLeft: topLeft, parentView: parentView, property: property, fitting: fitting)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

@available(*, deprecated)
extension LayoutPropertyCanStoreTopLeftType {
	
	public func pinTopLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopLeftProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopLeftProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTopLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopLeftProperty {
		
		let topLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeTopLeft(topLeft)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopLeftProperty {
		
		let topLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeTopLeft(topLeft)
		
		return maker
		
	}
	
}
