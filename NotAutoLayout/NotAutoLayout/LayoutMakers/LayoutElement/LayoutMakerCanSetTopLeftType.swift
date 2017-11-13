//
//  LayoutMakerCanSetTopLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanSetTopLeftType: LayoutMakerType {
	
	associatedtype WillSetTopLeftMaker
	
	func storeTopLeft(_ topLeft: LayoutElement.Point) -> WillSetTopLeftMaker
	
}

extension LayoutMakerCanSetTopLeftType {
	
	public func setTopLeft(to topLeft: CGPoint) -> WillSetTopLeftMaker {
		
		let topLeft = LayoutElement.Point.constant(topLeft)
		
		let maker = self.storeTopLeft(topLeft)
		
		return maker
		
	}
	
	public func setTopLeft(by topLeft: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> WillSetTopLeftMaker {
		
		let topLeft = LayoutElement.Point.closure(topLeft)
		
		let maker = self.storeTopLeft(topLeft)
		
		return maker
		
	}
	
	public func pinTopLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopLeftMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopLeftMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTopLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetTopLeftMaker {
		
		let topLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeTopLeft(topLeft)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopLeftMaker {
		
		let topLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeTopLeft(topLeft)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanSetTopLeftToMakeLayoutEditorType: LayoutMakerCanSetTopLeftType where WillSetTopLeftMaker == LayoutEditor {
	
	func evaluateFrame(topLeft: LayoutElement.Point, parameter: LayoutControlParameter) -> CGRect
	
}

extension LayoutMakerCanSetTopLeftToMakeLayoutEditorType {
	
	public func storeTopLeft(_ topLeft: LayoutElement.Point) -> WillSetTopLeftMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.evaluateFrame(topLeft: topLeft, parameter: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
