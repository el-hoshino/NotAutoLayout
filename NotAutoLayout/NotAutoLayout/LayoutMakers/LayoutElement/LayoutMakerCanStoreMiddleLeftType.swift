//
//  LayoutPropertyCanStoreMiddleLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreMiddleLeftType: LayoutMakerPropertyType {
	
	associatedtype WillSetMiddleLeftProperty
	
	func storeMiddleLeft(_ middleLeft: LayoutElement.Point) -> WillSetMiddleLeftProperty
	
}

extension LayoutPropertyCanStoreMiddleLeftType {
	
	public func setMiddleLeft(to middleLeft: CGPoint) -> WillSetMiddleLeftProperty {
		
		let middleLeft = LayoutElement.Point.constant(middleLeft)
		
		let maker = self.storeMiddleLeft(middleLeft)
		
		return maker
		
	}
	
	public func setMiddleLeft(by middleLeft: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> WillSetMiddleLeftProperty {
		
		let middleLeft = LayoutElement.Point.byParent(middleLeft)
		
		let maker = self.storeMiddleLeft(middleLeft)
		
		return maker
		
	}
	
	public func pinMiddleLeft(to referenceView: UIView?, with middleLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetMiddleLeftProperty {
		
		return self.pinMiddleLeft(by: { [weak referenceView] in referenceView }, with: middleLeft)
		
	}
	
	public func pinMiddleLeft(by referenceView: @escaping () -> UIView?, with middleLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetMiddleLeftProperty {
		
		let middleLeft = LayoutElement.Point.byReference(referenceGetter: referenceView, middleLeft)
		
		let maker = self.storeMiddleLeft(middleLeft)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType: LayoutPropertyCanStoreMiddleLeftType where WillSetMiddleLeftProperty == LayoutEditor {
	
	func evaluateFrame(middleLeft: LayoutElement.Point, parentView: UIView, property: ViewFrameProperty, fitting: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public func storeMiddleLeft(_ middleLeft: LayoutElement.Point) -> WillSetMiddleLeftProperty {
		
		let layout = Layout(frame: { (parentView, property, fitting) -> CGRect in
			return self.evaluateFrame(middleLeft: middleLeft, parentView: parentView, property: property, fitting: fitting)
		})

		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

@available(*, deprecated)
extension LayoutPropertyCanStoreMiddleLeftType {
	
	public func pinMiddleLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetMiddleLeftProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleLeftProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddleLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetMiddleLeftProperty {
		
		let middleLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeMiddleLeft(middleLeft)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleLeftProperty {
		
		let middleLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeMiddleLeft(middleLeft)
		
		return maker
		
	}
	
}
