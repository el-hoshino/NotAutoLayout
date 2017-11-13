//
//  LayoutMakerCanSetMiddleType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanSetMiddleType: LayoutMakerType {
	
	associatedtype WillSetMiddleMaker
	
	func storeMiddle(_ middle: LayoutElement.Line) -> WillSetMiddleMaker
	
}

extension LayoutMakerCanSetMiddleType {
	
	public func setMiddle(to middle: CGFloat) -> WillSetMiddleMaker {
		
		let middle = LayoutElement.Line.constant(middle)
		
		let maker = self.storeMiddle(middle)
		
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> WillSetMiddleMaker {
		
		let middle = LayoutElement.Line.closure(middle)
		
		let maker = self.storeMiddle(middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetMiddleMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetMiddleMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeMiddle(middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetMiddleMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeMiddle(middle)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanSetMiddleToMakeLayoutEditorType: LayoutMakerCanSetMiddleType where WillSetMiddleMaker == LayoutEditor {
	
	func evaluateFrame(middle: LayoutElement.Line, parameter: LayoutControlParameter) -> CGRect
	
}

extension LayoutMakerCanSetMiddleToMakeLayoutEditorType {
	
	public func storeMiddle(_ middle: LayoutElement.Line) -> WillSetMiddleMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.evaluateFrame(middle: middle, parameter: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
