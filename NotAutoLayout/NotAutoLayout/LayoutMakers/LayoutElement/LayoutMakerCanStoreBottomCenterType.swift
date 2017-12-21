//
//  LayoutMakerCanStoreBottomCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanStoreBottomCenterType: LayoutMakerType {
	
	associatedtype WillSetBottomCenterMaker
	
	func storeBottomCenter(_ bottomCenter: LayoutElement.Point) -> WillSetBottomCenterMaker
	
}

extension LayoutMakerCanStoreBottomCenterType {
	
	public func setBottomCenter(to bottomCenter: CGPoint) -> WillSetBottomCenterMaker {
		
		let bottomCenter = LayoutElement.Point.constant(bottomCenter)
		
		let maker = self.storeBottomCenter(bottomCenter)
		
		return maker
		
	}
	
	public func setBottomCenter(by bottomCenter: @escaping (_ parameter: ViewFrameProperty) -> CGPoint) -> WillSetBottomCenterMaker {
		
		let bottomCenter = LayoutElement.Point.closure(bottomCenter)
		
		let maker = self.storeBottomCenter(bottomCenter)
		
		return maker
		
	}
	
	public func pinBottomCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetBottomCenterMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomCenterMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottomCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetBottomCenterMaker {
		
		let bottomCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeBottomCenter(bottomCenter)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomCenterMaker {
		
		let bottomCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeBottomCenter(bottomCenter)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanStoreBottomCenterToEvaluateFrameType: LayoutMakerCanStoreBottomCenterType where WillSetBottomCenterMaker == LayoutEditor {
	
	func evaluateFrame(bottomCenter: LayoutElement.Point, parameter: ViewFrameProperty) -> CGRect
	
}

extension LayoutMakerCanStoreBottomCenterToEvaluateFrameType {
	
	public func storeBottomCenter(_ bottomCenter: LayoutElement.Point) -> WillSetBottomCenterMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.evaluateFrame(bottomCenter: bottomCenter, parameter: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
