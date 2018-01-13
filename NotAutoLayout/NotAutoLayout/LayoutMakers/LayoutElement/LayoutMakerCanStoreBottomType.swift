//
//  LayoutPropertyCanStoreBottomType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreBottomType: LayoutMakerPropertyType {
	
	associatedtype WillSetBottomProperty
	
	func storeBottom(_ bottom: LayoutElement.Vertical) -> WillSetBottomProperty
	
}

extension LayoutPropertyCanStoreBottomType {
	
	public func setBottom(to bottom: CGFloat) -> WillSetBottomProperty {
		
		let bottom = LayoutElement.Vertical.constant(bottom)
		
		let maker = self.storeBottom(bottom)
		
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> WillSetBottomProperty {
		
		let bottom = LayoutElement.Vertical.byParent(bottom)
		
		let maker = self.storeBottom(bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, with bottom: @escaping (ViewPinProperty<ViewPinPropertyType.Vertical>) -> CGFloat) -> WillSetBottomProperty {
		
		return self.pinBottom(by: { [weak referenceView] in referenceView }, with: bottom)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, with bottom: @escaping (ViewPinProperty<ViewPinPropertyType.Vertical>) -> CGFloat) -> WillSetBottomProperty {
		
		let bottom = LayoutElement.Vertical.byReference(referenceGetter: referenceView, bottom)
		
		let maker = self.storeBottom(bottom)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomToEvaluateFrameType: LayoutPropertyCanStoreBottomType where WillSetBottomProperty == LayoutEditor {
	
	func evaluateFrame(bottom: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect
	
}

extension LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> WillSetBottomProperty {
		
		let layout = Layout(frame: { (property) -> CGRect in
			return self.evaluateFrame(bottom: bottom, property: property)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

@available(*, deprecated)
extension LayoutPropertyCanStoreBottomType {
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetBottomProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetBottomProperty {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeBottom(bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomProperty {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeBottom(bottom)
		
		return maker
		
	}
	
}
