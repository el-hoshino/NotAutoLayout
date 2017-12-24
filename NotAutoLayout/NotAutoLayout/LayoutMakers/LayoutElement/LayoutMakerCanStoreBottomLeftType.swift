//
//  LayoutPropertyCanStoreBottomLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreBottomLeftType: LayoutMakerPropertyType {
	
	associatedtype WillSetBottomLeftMaker
	
	func storeBottomLeft(_ bottomLeft: LayoutElement.Point) -> WillSetBottomLeftMaker
	
}

extension LayoutPropertyCanStoreBottomLeftType {
	
	public func setBottomLeft(to bottomLeft: CGPoint) -> WillSetBottomLeftMaker {
		
		let bottomLeft = LayoutElement.Point.constant(bottomLeft)
		
		let maker = self.storeBottomLeft(bottomLeft)
		
		return maker
		
	}
	
	public func setBottomLeft(by bottomLeft: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> WillSetBottomLeftMaker {
		
		let bottomLeft = LayoutElement.Point.byParent(bottomLeft)
		
		let maker = self.storeBottomLeft(bottomLeft)
		
		return maker
		
	}
	
	public func pinBottomLeft(to referenceView: UIView?, with bottomLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetBottomLeftMaker {
		
		return self.pinBottomLeft(by: { [weak referenceView] in referenceView }, with: bottomLeft)
		
	}
	
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, with bottomLeft: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetBottomLeftMaker {
		
		let bottomLeft = LayoutElement.Point.byReference(referenceGetter: referenceView, bottomLeft)
		
		let maker = self.storeBottomLeft(bottomLeft)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomLeftToEvaluateFrameType: LayoutPropertyCanStoreBottomLeftType where WillSetBottomLeftMaker == LayoutEditor {
	
	func evaluateFrame(bottomLeft: LayoutElement.Point, parentView: UIView, property: ViewFrameProperty, fitting: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func storeBottomLeft(_ bottomLeft: LayoutElement.Point) -> WillSetBottomLeftMaker {
		
		let layout = Layout(frame: { (parentView, property, fitting) -> CGRect in
			return self.evaluateFrame(bottomLeft: bottomLeft, parentView: parentView, property: property, fitting: fitting)
		})

		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

@available(*, deprecated)
extension LayoutPropertyCanStoreBottomLeftType {
	
	public func pinBottomLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetBottomLeftMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomLeftMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetBottomLeftMaker {
		
		let bottomLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeBottomLeft(bottomLeft)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomLeftMaker {
		
		let bottomLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeBottomLeft(bottomLeft)
		
		return maker
		
	}
	
}
