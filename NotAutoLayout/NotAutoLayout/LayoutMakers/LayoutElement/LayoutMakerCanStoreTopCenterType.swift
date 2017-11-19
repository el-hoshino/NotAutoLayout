//
//  LayoutMakerCanStoreTopCenterType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanStoreTopCenterType: LayoutMakerType {
	
	associatedtype WillSetTopCenterMaker
	
	func storeTopCenter(_ topCenter: LayoutElement.Point) -> WillSetTopCenterMaker
	
}

extension LayoutMakerCanStoreTopCenterType {
	
	public func setTopCenter(to topCenter: CGPoint) -> WillSetTopCenterMaker {
		
		let topCenter = LayoutElement.Point.constant(topCenter)
		
		let maker = self.storeTopCenter(topCenter)
		
		return maker
		
	}
	
	public func setTopCenter(by topCenter: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> WillSetTopCenterMaker {
		
		let topCenter = LayoutElement.Point.closure(topCenter)
		
		let maker = self.storeTopCenter(topCenter)
		
		return maker
		
	}
	
	public func pinTopCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopCenterMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopCenterMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTopCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopCenterMaker {
		
		let topCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeTopCenter(topCenter)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopCenterMaker {
		
		let topCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeTopCenter(topCenter)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanStoreTopCenterToEvaluateFrameType: LayoutMakerCanStoreTopCenterType where WillSetTopCenterMaker == LayoutEditor {
	
	func evaluateFrame(topCenter: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect
	
}

extension LayoutMakerCanStoreTopCenterToEvaluateFrameType {
	
	public func storeTopCenter(_ topCenter: LayoutElement.Point) -> WillSetTopCenterMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.evaluateFrame(topCenter: topCenter, parameter: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
