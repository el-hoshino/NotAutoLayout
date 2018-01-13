//
//  LayoutPropertyCanStoreTopRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreTopRightType: LayoutMakerPropertyType {
	
	associatedtype WillSetTopRightProperty
	
	func storeTopRight(_ topRight: LayoutElement.Point) -> WillSetTopRightProperty
	
}

extension LayoutPropertyCanStoreTopRightType {
	
	public func setTopRight(to topRight: CGPoint) -> WillSetTopRightProperty {
		
		let topRight = LayoutElement.Point.constant(topRight)
		
		let maker = self.storeTopRight(topRight)
		
		return maker
		
	}
	
	public func setTopRight(by topRight: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> WillSetTopRightProperty {
		
		let topRight = LayoutElement.Point.byParent(topRight)
		
		let maker = self.storeTopRight(topRight)
		
		return maker
		
	}
	
	public func pinTopRight(to referenceView: UIView?, with topRight: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetTopRightProperty {
		
		return self.pinTopRight(by: { [weak referenceView] in referenceView }, with: topRight)
		
	}
	
	public func pinTopRight(by referenceView: @escaping () -> UIView?, with topRight: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetTopRightProperty {
		
		let topRight = LayoutElement.Point.byReference(referenceGetter: referenceView, topRight)
		
		let maker = self.storeTopRight(topRight)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreTopRightToEvaluateFrameType: LayoutPropertyCanStoreTopRightType where WillSetTopRightProperty == LayoutEditor {
	
	func evaluateFrame(topRight: LayoutElement.Point, parentView: UIView, property: ViewFrameProperty, fitting: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public func storeTopRight(_ topRight: LayoutElement.Point) -> WillSetTopRightProperty {
		
		let layout = Layout(frame: { (parentView, property, fitting) -> CGRect in
			return self.evaluateFrame(topRight: topRight, parentView: parentView, property: property, fitting: fitting)
		})

		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

@available(*, deprecated)
extension LayoutPropertyCanStoreTopRightType {
	
	public func pinTopRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopRightProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopRightProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTopRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopRightProperty {
		
		let topRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeTopRight(topRight)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopRightProperty {
		
		let topRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeTopRight(topRight)
		
		return maker
		
	}
	
}
