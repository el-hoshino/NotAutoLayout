//
//  LayoutMakerCanSetLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanSetLeftType: LayoutMakerType {
	
	associatedtype WillSetLeftMaker
	
	func storeLeft(_ left: LayoutElement.Line) -> WillSetLeftMaker
	
}

extension LayoutMakerCanSetLeftType {
	
	public func setLeft(to left: CGFloat) -> WillSetLeftMaker {
		
		let left = LayoutElement.Line.constant(left)
		
		let maker = self.storeLeft(left)
		
		return maker
		
	}
	
	public func setLeft(by left: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> WillSetLeftMaker {
		
		let left = LayoutElement.Line.closure(left)
		
		let maker = self.storeLeft(left)
		
		return maker
		
	}
	
	public func pinLeft(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetLeftMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinLeft(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetLeftMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetLeftMaker {
		
		let left = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeLeft(left)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetLeftMaker {
		
		let left = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeLeft(left)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanSetLeftToMakeLayoutEditorType: LayoutMakerCanSetLeftType where WillSetLeftMaker == LayoutEditor {
	
	func evaluateFrame(left: LayoutElement.Line, parameter: LayoutControlParameter) -> CGRect
	
}

extension LayoutMakerCanSetLeftToMakeLayoutEditorType {
	
	public func storeLeft(_ left: LayoutElement.Line) -> WillSetLeftMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.evaluateFrame(left: left, parameter: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
