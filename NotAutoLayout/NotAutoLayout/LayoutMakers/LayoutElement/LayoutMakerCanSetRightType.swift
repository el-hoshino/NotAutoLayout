//
//  LayoutMakerCanSetRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanSetRightType: LayoutMakerType {
	
	associatedtype WillSetRightMaker
	
	func storeRight(_ right: LayoutElement.Line) -> WillSetRightMaker
	
}

extension LayoutMakerCanSetRightType {
	
	public func setRight(to right: CGFloat) -> WillSetRightMaker {
		
		let right = LayoutElement.Line.constant(right)
		
		let maker = self.storeRight(right)
		
		return maker
		
	}
	
	public func setRight(by right: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> WillSetRightMaker {
		
		let right = LayoutElement.Line.closure(right)
		
		let maker = self.storeRight(right)
		
		return maker
		
	}
	
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetRightMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetRightMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetRightMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeRight(right)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetRightMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeRight(right)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanSetRightToMakeLayoutEditorType: LayoutMakerCanSetRightType where WillSetRightMaker == LayoutEditor {
	
	func evaluateFrame(right: LayoutElement.Line, parameter: LayoutControlParameter) -> CGRect
	
}

extension LayoutMakerCanSetRightToMakeLayoutEditorType {
	
	public func storeRight(_ right: LayoutElement.Line) -> WillSetRightMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.evaluateFrame(right: right, parameter: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
