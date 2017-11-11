//
//  LeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutElementLeftType: LayoutElementType {
	
	var left: LayoutElement.Float { get }
	
}

extension LayoutElement {
	
	public struct Left: LayoutElementLeftType {
		
		public let left: LayoutElement.Float
		
	}
	
}

extension LayoutMaker where DidSetLayoutElement: LayoutElementLeftType {
	
	var left: LayoutElement.Float {
		return self.didSetLayoutElement.left
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension LayoutMaker where DidSetLayoutElement: LayoutElementLeftType {
	
	public func setCenter(to center: CGFloat) -> LayoutMaker<LayoutElement.LeftCenter> {
		
		let center = LayoutElement.Float.constant(center)
		let didSetElement = LayoutElement.LeftCenter(left: self.left,
		                                             center: center)
		let maker = LayoutMaker<LayoutElement.LeftCenter>(parentView: self.parentView,
		                                                  didSetLayoutElement: didSetElement)
		
		return maker
		
	}
	
	public func setCenter(by center: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutMaker<LayoutElement.LeftCenter> {
		
		let center = LayoutElement.Float.closure(center)
		let didSetElement = LayoutElement.LeftCenter(left: self.left,
		                                             center: center)
		let maker = LayoutMaker<LayoutElement.LeftCenter>(parentView: self.parentView,
		                                                  didSetLayoutElement: didSetElement)
		
		return maker
		
	}
	
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LayoutMaker<LayoutElement.LeftCenter> {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutMaker<LayoutElement.LeftCenter> {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LayoutMaker<LayoutElement.LeftCenter> {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		let didSetElement = LayoutElement.LeftCenter(left: self.left,
		                                             center: center)
		let maker = LayoutMaker<LayoutElement.LeftCenter>(parentView: self.parentView,
		                                                  didSetLayoutElement: didSetElement)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutMaker<LayoutElement.LeftCenter> {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		let didSetElement = LayoutElement.LeftCenter(left: self.left,
		                                             center: center)
		let maker = LayoutMaker<LayoutElement.LeftCenter>(parentView: self.parentView,
		                                                  didSetLayoutElement: didSetElement)

		return maker
		
	}
	
}

// MARK: Right
extension LayoutMaker where DidSetLayoutElement: LayoutElementLeftType {
	
	public func setRight(to right: CGFloat) -> LayoutMaker<LayoutElement.LeftRight> {
		
		let right = LayoutElement.Float.constant(right)
		let didSetElement = LayoutElement.LeftRight(left: self.left,
		                                            right: right)
		let maker = LayoutMaker<LayoutElement.LeftRight>(parentView: self.parentView,
		                                                 didSetLayoutElement: didSetElement)
		
		return maker
		
	}
	
	public func setRight(by right: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutMaker<LayoutElement.LeftRight> {
		
		let right = LayoutElement.Float.closure(right)
		let didSetElement = LayoutElement.LeftRight(left: self.left,
		                                            right: right)
		let maker = LayoutMaker<LayoutElement.LeftRight>(parentView: self.parentView,
		                                                 didSetLayoutElement: didSetElement)
		
		return maker
		
	}
	
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LayoutMaker<LayoutElement.LeftRight> {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutMaker<LayoutElement.LeftRight> {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LayoutMaker<LayoutElement.LeftRight> {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		let didSetElement = LayoutElement.LeftRight(left: self.left,
		                                            right: right)
		let maker = LayoutMaker<LayoutElement.LeftRight>(parentView: self.parentView,
		                                                 didSetLayoutElement: didSetElement)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutMaker<LayoutElement.LeftRight> {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		let didSetElement = LayoutElement.LeftRight(left: self.left,
		                                            right: right)
		let maker = LayoutMaker<LayoutElement.LeftRight>(parentView: self.parentView,
		                                                 didSetLayoutElement: didSetElement)
		
		return maker
		
	}
	
}

// MARK: Top
extension LayoutMaker where DidSetLayoutElement: LayoutElementLeftType {
	
	public func setTop(to top: CGFloat) -> LayoutMaker<LayoutElement.LeftTop> {
		
		let top = LayoutElement.Float.constant(top)
		let didSetElement = LayoutElement.LeftTop(left: self.left,
		                                          top: top)
		let maker = LayoutMaker<LayoutElement.LeftTop>(parentView: self.parentView,
		                                               didSetLayoutElement: didSetElement)
		
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutMaker<LayoutElement.LeftTop> {
		
		let top = LayoutElement.Float.closure(top)
		let didSetElement = LayoutElement.LeftTop(left: self.left,
		                                          top: top)
		let maker = LayoutMaker<LayoutElement.LeftTop>(parentView: self.parentView,
		                                               didSetLayoutElement: didSetElement)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LayoutMaker<LayoutElement.LeftTop> {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutMaker<LayoutElement.LeftTop> {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LayoutMaker<LayoutElement.LeftTop> {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		let didSetElement = LayoutElement.LeftTop(left: self.left,
		                                          top: top)
		let maker = LayoutMaker<LayoutElement.LeftTop>(parentView: self.parentView,
		                                               didSetLayoutElement: didSetElement)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutMaker<LayoutElement.LeftTop> {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		let didSetElement = LayoutElement.LeftTop(left: self.left,
		                                          top: top)
		let maker = LayoutMaker<LayoutElement.LeftTop>(parentView: self.parentView,
		                                               didSetLayoutElement: didSetElement)
		
		return maker
		
	}
	
}

// MARK: Middle
extension LayoutMaker where DidSetLayoutElement: LayoutElementLeftType {
	
	public func setMiddle(to middle: CGFloat) -> LeftMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.constant(middle)
		
		let maker = LeftMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        middle: middle)
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.closure(middle)
		
		let maker = LeftMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        middle: middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        middle: middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        middle: middle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension LayoutMaker where DidSetLayoutElement: LayoutElementLeftType {
	
	public func setBottom(to bottom: CGFloat) -> LeftBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.constant(bottom)
		
		let maker = LeftBottomDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        bottom: bottom)
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.closure(bottom)
		
		let maker = LeftBottomDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftBottomDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftBottomDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        bottom: bottom)
		
		return maker
		
	}
	
}

