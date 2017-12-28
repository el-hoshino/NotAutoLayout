//
//  LayoutMakerCanStoreMiddleLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanStoreMiddleLeftType: LayoutMakerType {
	
	associatedtype WillSetMiddleLeftMaker
	
	func storeMiddleLeft(_ middleLeft: LayoutElement.Point) -> WillSetMiddleLeftMaker
	
}

extension LayoutMakerCanStoreMiddleLeftType {
	
	public func setMiddleLeft(to middleLeft: CGPoint) -> WillSetMiddleLeftMaker {
		
		let middleLeft = LayoutElement.Point.constant(middleLeft)
		
		let maker = self.storeMiddleLeft(middleLeft)
		
		return maker
		
	}
	
	public func setMiddleLeft(by middleLeft: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> WillSetMiddleLeftMaker {
		
		let middleLeft = LayoutElement.Point.closure(middleLeft)
		
		let maker = self.storeMiddleLeft(middleLeft)
		
		return maker
		
	}
	
	public func pinMiddleLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetMiddleLeftMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleLeftMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddleLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetMiddleLeftMaker {
		
		let middleLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeMiddleLeft(middleLeft)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleLeftMaker {
		
		let middleLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeMiddleLeft(middleLeft)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanStoreMiddleLeftToEvaluateFrameType: LayoutMakerCanStoreMiddleLeftType where WillSetMiddleLeftMaker == LayoutEditor {
	
	func evaluateFrame(middleLeft: LayoutElement.Point, property: ViewFrameProperty) -> CGRect
	
}

extension LayoutMakerCanStoreMiddleLeftToEvaluateFrameType {
	
	public func storeMiddleLeft(_ middleLeft: LayoutElement.Point) -> WillSetMiddleLeftMaker {
		
		let layout = Layout(frame: { (property) -> CGRect in
			return self.evaluateFrame(middleLeft: middleLeft, property: property)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
