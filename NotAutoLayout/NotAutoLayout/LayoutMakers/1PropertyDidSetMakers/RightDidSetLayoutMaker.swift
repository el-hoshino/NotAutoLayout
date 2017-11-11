//
//  RightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutElementRightType: LayoutElementType {
	
	var right: LayoutElement.Float { get }
	
}

extension LayoutElement {
	
	public struct Right: LayoutElementRightType {
		
		public let right: LayoutElement.Float
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension LayoutMaker where DidSetLayoutElement: LayoutElementRightType {
	
	public func setTop(to top: CGFloat) -> RightTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.constant(top)
		
		let maker = RightTopDidSetLayoutMaker(parentView: self.parentView,
		                                      right: self.didSetLayoutElement.right,
		                                      top: top)
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.closure(top)
		
		let maker = RightTopDidSetLayoutMaker(parentView: self.parentView,
		                                      right: self.didSetLayoutElement.right,
		                                      top: top)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = RightTopDidSetLayoutMaker(parentView: self.parentView,
		                                      right: self.didSetLayoutElement.right,
		                                      top: top)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = RightTopDidSetLayoutMaker(parentView: self.parentView,
		                                      right: self.didSetLayoutElement.right,
		                                      top: top)
		
		return maker
		
	}
	
}

// MARK: Middle
extension LayoutMaker where DidSetLayoutElement: LayoutElementRightType {
	
	public func setMiddle(to middle: CGFloat) -> RightMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.constant(middle)
		
		let maker = RightMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                         right: self.didSetLayoutElement.right,
		                                         middle: middle)
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.closure(middle)
		
		let maker = RightMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                         right: self.didSetLayoutElement.right,
		                                         middle: middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = RightMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                         right: self.didSetLayoutElement.right,
		                                         middle: middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = RightMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                         right: self.didSetLayoutElement.right,
		                                         middle: middle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension LayoutMaker where DidSetLayoutElement: LayoutElementRightType {
	
	public func setBottom(to bottom: CGFloat) -> RightBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.constant(bottom)
		
		let maker = RightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                         right: self.didSetLayoutElement.right,
		                                         bottom: bottom)
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.closure(bottom)
		
		let maker = RightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                         right: self.didSetLayoutElement.right,
		                                         bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = RightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                         right: self.didSetLayoutElement.right,
		                                         bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = RightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                         right: self.didSetLayoutElement.right,
		                                         bottom: bottom)
		
		return maker
		
	}
	
}
