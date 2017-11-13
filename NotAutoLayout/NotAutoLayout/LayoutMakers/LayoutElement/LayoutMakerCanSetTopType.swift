//
//  LayoutMakerCanSetTopType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copytop © 2017年 史翔新. All tops reserved.
//

import Foundation

public protocol LayoutMakerCanSetTopType: LayoutMakerType {
	
	associatedtype WillSetTopMaker
	
	func storeTop(_ top: LayoutElement.Line) -> WillSetTopMaker
	
}

extension LayoutMakerCanSetTopType {
	
	public func setTop(to top: CGFloat) -> WillSetTopMaker {
		
		let top = LayoutElement.Line.constant(top)
		
		let maker = self.storeTop(top)
		
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> WillSetTopMaker {
		
		let top = LayoutElement.Line.closure(top)
		
		let maker = self.storeTop(top)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetTopMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetTopMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeTop(top)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetTopMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeTop(top)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanSetTopToMakeLayoutEditorType: LayoutMakerCanSetTopType where WillSetTopMaker == LayoutEditor {
	
	func evaluateFrame(top: LayoutElement.Line, parameter: LayoutControlParameter) -> CGRect
	
}

extension LayoutMakerCanSetTopToMakeLayoutEditorType {
	
	public func storeTop(_ top: LayoutElement.Line) -> WillSetTopMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.evaluateFrame(top: top, parameter: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
