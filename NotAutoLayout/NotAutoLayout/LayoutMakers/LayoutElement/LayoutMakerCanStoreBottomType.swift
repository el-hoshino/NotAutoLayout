//
//  LayoutMakerCanStoreBottomType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanStoreBottomType: LayoutMakerType {
	
	associatedtype WillSetBottomMaker
	
	func storeBottom(_ bottom: LayoutElement.Line) -> WillSetBottomMaker
	
}

extension LayoutMakerCanStoreBottomType {
	
	public func setBottom(to bottom: CGFloat) -> WillSetBottomMaker {
		
		let bottom = LayoutElement.Line.constant(bottom)
		
		let maker = self.storeBottom(bottom)
		
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ property: ViewFrameProperty) -> CGFloat) -> WillSetBottomMaker {
		
		let bottom = LayoutElement.Line.closure(bottom)
		
		let maker = self.storeBottom(bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetBottomMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> WillSetBottomMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeBottom(bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeBottom(bottom)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanStoreBottomToEvaluateFrameType: LayoutMakerCanStoreBottomType where WillSetBottomMaker == LayoutEditor {
	
	func evaluateFrame(bottom: LayoutElement.Line, property: ViewFrameProperty) -> CGRect
	
}

extension LayoutMakerCanStoreBottomToEvaluateFrameType {
	
	public func storeBottom(_ bottom: LayoutElement.Line) -> WillSetBottomMaker {
		
		let layout = Layout(frame: { (property) -> CGRect in
			return self.evaluateFrame(bottom: bottom, property: property)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
