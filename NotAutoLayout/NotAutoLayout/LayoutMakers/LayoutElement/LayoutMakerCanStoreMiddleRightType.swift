//
//  LayoutMakerCanStoreMiddleRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanStoreMiddleRightType: LayoutMakerType {
	
	associatedtype WillSetMiddleRightMaker
	
	func storeMiddleRight(_ middleRight: LayoutElement.Point) -> WillSetMiddleRightMaker
	
}

extension LayoutMakerCanStoreMiddleRightType {
	
	public func setMiddleRight(to middleRight: CGPoint) -> WillSetMiddleRightMaker {
		
		let middleRight = LayoutElement.Point.constant(middleRight)
		
		let maker = self.storeMiddleRight(middleRight)
		
		return maker
		
	}
	
	public func setMiddleRight(by middleRight: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> WillSetMiddleRightMaker {
		
		let middleRight = LayoutElement.Point.closure(middleRight)
		
		let maker = self.storeMiddleRight(middleRight)
		
		return maker
		
	}
	
	public func pinMiddleRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetMiddleRightMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleRightMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddleRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetMiddleRightMaker {
		
		let middleRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeMiddleRight(middleRight)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleRightMaker {
		
		let middleRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeMiddleRight(middleRight)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanStoreMiddleRightToEvaluateFrameType: LayoutMakerCanStoreMiddleRightType where WillSetMiddleRightMaker == LayoutEditor {
	
	func evaluateFrame(middleRight: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect
	
}

extension LayoutMakerCanStoreMiddleRightToEvaluateFrameType {
	
	public func storeMiddleRight(_ middleRight: LayoutElement.Point) -> WillSetMiddleRightMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.evaluateFrame(middleRight: middleRight, parameter: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
