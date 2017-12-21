//
//  LayoutMakerCanStoreTopRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanStoreTopRightType: LayoutMakerType {
	
	associatedtype WillSetTopRightMaker
	
	func storeTopRight(_ topRight: LayoutElement.Point) -> WillSetTopRightMaker
	
}

extension LayoutMakerCanStoreTopRightType {
	
	public func setTopRight(to topRight: CGPoint) -> WillSetTopRightMaker {
		
		let topRight = LayoutElement.Point.constant(topRight)
		
		let maker = self.storeTopRight(topRight)
		
		return maker
		
	}
	
	public func setTopRight(by topRight: @escaping (_ parameter: ViewFrameProperty) -> CGPoint) -> WillSetTopRightMaker {
		
		let topRight = LayoutElement.Point.closure(topRight)
		
		let maker = self.storeTopRight(topRight)
		
		return maker
		
	}
	
	public func pinTopRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopRightMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopRightMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTopRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopRightMaker {
		
		let topRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeTopRight(topRight)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopRightMaker {
		
		let topRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeTopRight(topRight)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanStoreTopRightToEvaluateFrameType: LayoutMakerCanStoreTopRightType where WillSetTopRightMaker == LayoutEditor {
	
	func evaluateFrame(topRight: LayoutElement.Point, parameter: ViewFrameProperty) -> CGRect
	
}

extension LayoutMakerCanStoreTopRightToEvaluateFrameType {
	
	public func storeTopRight(_ topRight: LayoutElement.Point) -> WillSetTopRightMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.evaluateFrame(topRight: topRight, parameter: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
