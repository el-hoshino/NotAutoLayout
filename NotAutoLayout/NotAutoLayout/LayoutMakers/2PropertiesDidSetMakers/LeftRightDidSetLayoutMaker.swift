//
//  LeftRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftRightDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: CGRect.Float
	
	let right: CGRect.Float
	
}

// MARK: - Set A Line -
// MARK: Top
extension LeftRightDidSetLayoutMaker {
	
	public func setTop(to top: CGFloat) -> LeftRightTopDidSetLayoutMaker {
		
		let top = CGRect.Float.constant(top)
		
		let maker = LeftRightTopDidSetLayoutMaker(parentView: self.parentView,
		                                          left: self.left,
		                                          right: self.right,
		                                          top: top)
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftRightTopDidSetLayoutMaker {
		
		let top = CGRect.Float.closure(top)
		
		let maker = LeftRightTopDidSetLayoutMaker(parentView: self.parentView,
		                                          left: self.left,
		                                          right: self.right,
		                                          top: top)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftRightTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftRightTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftRightTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftRightTopDidSetLayoutMaker(parentView: self.parentView,
		                                          left: self.left,
		                                          right: self.right,
		                                          top: top)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftRightTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftRightTopDidSetLayoutMaker(parentView: self.parentView,
		                                          left: self.left,
		                                          right: self.right,
		                                          top: top)
		
		return maker
		
	}
	
}

// MARK: Middle
extension LeftRightDidSetLayoutMaker {
	
	public func setMiddle(to middle: CGFloat) -> LeftRightMiddleDidSetLayoutMaker {
		
		let middle = CGRect.Float.constant(middle)
		
		let maker = LeftRightMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                             left: self.left,
		                                             right: self.right,
		                                             middle: middle)
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftRightMiddleDidSetLayoutMaker {
		
		let middle = CGRect.Float.closure(middle)
		
		let maker = LeftRightMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                             left: self.left,
		                                             right: self.right,
		                                             middle: middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftRightMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftRightMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftRightMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftRightMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                             left: self.left,
		                                             right: self.right,
		                                             middle: middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftRightMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftRightMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                             left: self.left,
		                                             right: self.right,
		                                             middle: middle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension LeftRightDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> LeftRightBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.constant(bottom)
		
		let maker = LeftRightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             left: self.left,
		                                             right: self.right,
		                                             bottom: bottom)
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftRightBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.closure(bottom)
		
		let maker = LeftRightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             left: self.left,
		                                             right: self.right,
		                                             bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftRightBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftRightBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftRightBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftRightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             left: self.left,
		                                             right: self.right,
		                                             bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftRightBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftRightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             left: self.left,
		                                             right: self.right,
		                                             bottom: bottom)
		
		return maker
		
	}
	
}

