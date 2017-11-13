//
//  LayoutMakerCanSetBottomRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanSetBottomRightType: LayoutMakerType {
	
	associatedtype WillSetBottomRightMaker
	
	func storeBottomRight(_ bottomRight: LayoutElement.Point) -> WillSetBottomRightMaker
	
}

extension LayoutMakerCanSetBottomRightType {
	
	public func setBottomRight(to bottomRight: CGPoint) -> WillSetBottomRightMaker {
		
		let bottomRight = LayoutElement.Point.constant(bottomRight)
		
		let maker = self.storeBottomRight(bottomRight)
		
		return maker
		
	}
	
	public func setBottomRight(by bottomRight: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> WillSetBottomRightMaker {
		
		let bottomRight = LayoutElement.Point.closure(bottomRight)
		
		let maker = self.storeBottomRight(bottomRight)
		
		return maker
		
	}
	
	public func pinBottomRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetBottomRightMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomRightMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottomRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetBottomRightMaker {
		
		let bottomRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeBottomRight(bottomRight)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomRightMaker {
		
		let bottomRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeBottomRight(bottomRight)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanSetBottomRightToMakeLayoutEditorType: LayoutMakerCanSetBottomRightType where WillSetBottomRightMaker == LayoutEditor {
	
	func evaluateFrame(bottomRight: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect
	
}

extension LayoutMakerCanSetBottomRightToMakeLayoutEditorType {
	
	public func storeBottomRight(_ bottomRight: LayoutElement.Point) -> WillSetBottomRightMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.evaluateFrame(bottomRight: bottomRight, parameter: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
