//
//  LayoutMakerCanStoreMiddleCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanStoreMiddleCenterType: LayoutMakerType {
	
	associatedtype WillSetMiddleCenterMaker
	
	func storeMiddleCenter(_ middleCenter: LayoutElement.Point) -> WillSetMiddleCenterMaker
	
}

extension LayoutMakerCanStoreMiddleCenterType {
	
	public func setMiddleCenter(to middleCenter: CGPoint) -> WillSetMiddleCenterMaker {
		
		let middleCenter = LayoutElement.Point.constant(middleCenter)
		
		let maker = self.storeMiddleCenter(middleCenter)
		
		return maker
		
	}
	
	public func setMiddleCenter(by middleCenter: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> WillSetMiddleCenterMaker {
		
		let middleCenter = LayoutElement.Point.byParent(middleCenter)
		
		let maker = self.storeMiddleCenter(middleCenter)
		
		return maker
		
	}
	
	public func pinMiddleCenter(to referenceView: UIView?, with middleCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetMiddleCenterMaker {
		
		return self.pinMiddleCenter(by: { [weak referenceView] in referenceView }, with: middleCenter)
		
	}
	
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, with middleCenter: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetMiddleCenterMaker {
		
		let middleCenter = LayoutElement.Point.byReference(referenceGetter: referenceView, middleCenter)
		
		let maker = self.storeMiddleCenter(middleCenter)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanStoreMiddleCenterToEvaluateFrameType: LayoutMakerCanStoreMiddleCenterType where WillSetMiddleCenterMaker == LayoutEditor {
	
	func evaluateFrame(middleCenter: LayoutElement.Point, property: ViewFrameProperty) -> CGRect
	
}

extension LayoutMakerCanStoreMiddleCenterToEvaluateFrameType {
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point) -> WillSetMiddleCenterMaker {
		
		let layout = Layout(frame: { (property) -> CGRect in
			return self.evaluateFrame(middleCenter: middleCenter, property: property)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

@available(* , deprecated)
extension LayoutMakerCanStoreMiddleCenterType {
	
	public func pinMiddleCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetMiddleCenterMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleCenterMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetMiddleCenterMaker {
		
		let middleCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeMiddleCenter(middleCenter)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleCenterMaker {
		
		let middleCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeMiddleCenter(middleCenter)
		
		return maker
		
	}
	
}
