//
//  CenterRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutElementCenterRightType: LayoutElementType {
	
	var center: LayoutElement.Float { get }
	var right: LayoutElement.Float { get }
	
}

extension LayoutElement {
	
	public struct CenterRight: LayoutElementCenterRightType {
		
		public let center: LayoutElement.Float
		public let right: LayoutElement.Float
		
	}
	
}

extension LayoutElement.CenterRight {
	
	init(center: LayoutElement.Float, others: LayoutElementRightType) {
		self.center = center
		self.right = others.right
	}
	
	init(right: LayoutElement.Float, others: LayoutElementCenterType) {
		self.center = others.center
		self.right = right
	}
	
}

extension LayoutMaker where DidSetLayoutElement: LayoutElementCenterRightType {
	
	var center: LayoutElement.Float {
		return self.didSetLayoutElement.center
	}
	
	var right: LayoutElement.Float {
		return self.didSetLayoutElement.right
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension LayoutMaker where DidSetLayoutElement: LayoutElementCenterRightType {
	
	public func setTop(to top: CGFloat) -> CenterRightTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.constant(top)
		
		let maker = CenterRightTopDidSetLayoutMaker(parentView: self.parentView,
		                                            center: self.center,
		                                            right: self.right,
		                                            top: top)
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterRightTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.closure(top)
		
		let maker = CenterRightTopDidSetLayoutMaker(parentView: self.parentView,
		                                            center: self.center,
		                                            right: self.right,
		                                            top: top)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterRightTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterRightTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterRightTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = CenterRightTopDidSetLayoutMaker(parentView: self.parentView,
		                                            center: self.center,
		                                            right: self.right,
		                                            top: top)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterRightTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = CenterRightTopDidSetLayoutMaker(parentView: self.parentView,
		                                            center: self.center,
		                                            right: self.right,
		                                            top: top)
		
		return maker
		
	}
	
}

// MARK: Middle
extension LayoutMaker where DidSetLayoutElement: LayoutElementCenterRightType {
	
	public func setMiddle(to middle: CGFloat) -> CenterRightMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.constant(middle)
		
		let maker = CenterRightMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                               center: self.center,
		                                               right: self.right,
		                                               middle: middle)
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterRightMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.closure(middle)
		
		let maker = CenterRightMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                               center: self.center,
		                                               right: self.right,
		                                               middle: middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterRightMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterRightMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterRightMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = CenterRightMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                               center: self.center,
		                                               right: self.right,
		                                               middle: middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterRightMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = CenterRightMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                               center: self.center,
		                                               right: self.right,
		                                               middle: middle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension LayoutMaker where DidSetLayoutElement: LayoutElementCenterRightType {
	
	public func setBottom(to bottom: CGFloat) -> CenterRightBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.constant(bottom)
		
		let maker = CenterRightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                               center: self.center,
		                                               right: self.right,
		                                               bottom: bottom)
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterRightBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.closure(bottom)
		
		let maker = CenterRightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                               center: self.center,
		                                               right: self.right,
		                                               bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterRightBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterRightBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterRightBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = CenterRightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                               center: self.center,
		                                               right: self.right,
		                                               bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterRightBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = CenterRightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                               center: self.center,
		                                               right: self.right,
		                                               bottom: bottom)
		
		return maker
		
	}
	
}
