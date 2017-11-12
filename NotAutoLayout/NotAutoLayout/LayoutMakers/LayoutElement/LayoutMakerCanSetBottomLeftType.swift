//
//  LayoutMakerCanSetBottomLeftType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanSetBottomLeftType: LayoutMakerType {
	
	associatedtype WillSetBottomLeftMaker
	
	func setBottomLeft(_ bottomLeft: LayoutElement.Point) -> WillSetBottomLeftMaker
	
}

extension LayoutMakerCanSetBottomLeftType {
	
	public func setBottomLeft(to bottomLeft: CGPoint) -> WillSetBottomLeftMaker {
		
		let bottomLeft = LayoutElement.Point.constant(bottomLeft)
		
		let maker = self.setBottomLeft(bottomLeft)
		
		return maker
		
	}
	
	public func setBottomLeft(by bottomLeft: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> WillSetBottomLeftMaker {
		
		let bottomLeft = LayoutElement.Point.closure(bottomLeft)
		
		let maker = self.setBottomLeft(bottomLeft)
		
		return maker
		
	}
	
	public func pinBottomLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetBottomLeftMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomLeftMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetBottomLeftMaker {
		
		let bottomLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.setBottomLeft(bottomLeft)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomLeftMaker {
		
		let bottomLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.setBottomLeft(bottomLeft)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanSetBottomLeftToMakeLayoutEditorType: LayoutMakerCanSetBottomLeftType where WillSetBottomLeftMaker == LayoutEditor {
	
	func makeFrame(bottomLeft: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect
	
}

extension LayoutMakerCanSetBottomLeftToMakeLayoutEditorType {
	
	public func setBottomLeft(_ bottomLeft: LayoutElement.Point) -> WillSetBottomLeftMaker {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return self.makeFrame(bottomLeft: bottomLeft, evaluatedFrom: parameter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
