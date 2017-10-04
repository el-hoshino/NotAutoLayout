//
//  LeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
		
	let left: CGRect.Float
	
}

// MARK: - Set A Line -
// MARK: Center
extension LeftDidSetLayoutMaker {
	
	public func setCenter(to center: CGFloat) -> LeftCenterDidSetLayoutMaker {
		
		let center = CGRect.Float.constant(center)
		
		let maker = LeftCenterDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        center: center)
		return maker
		
	}
	
	public func setCenter(by center: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftCenterDidSetLayoutMaker {
		
		let center = CGRect.Float.closure(center)
		
		let maker = LeftCenterDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        center: center)
		
		return maker
		
	}
	
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftCenterDidSetLayoutMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftCenterDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        center: center)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftCenterDidSetLayoutMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftCenterDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        center: center)
		
		return maker
		
	}
	
}

// MARK: Right
extension LeftDidSetLayoutMaker {
	
	public func setRight(to right: CGFloat) -> LeftRightDidSetLayoutMaker {
		
		let right = CGRect.Float.constant(right)
		
		let maker = LeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                       left: self.left,
		                                       right: right)
		return maker
		
	}
	
	public func setRight(by right: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftRightDidSetLayoutMaker {
		
		let right = CGRect.Float.closure(right)
		
		let maker = LeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                       left: self.left,
		                                       right: right)
		
		return maker
		
	}
	
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftRightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                       left: self.left,
		                                       right: right)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftRightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                       left: self.left,
		                                       right: right)
		
		return maker
		
	}
	
}

// MARK: Top
extension LeftDidSetLayoutMaker {
	
	public func setTop(to top: CGFloat) -> LeftTopDidSetLayoutMaker {
		
		let top = CGRect.Float.constant(top)
		
		let maker = LeftTopDidSetLayoutMaker(parentView: self.parentView,
		                                     left: self.left,
		                                     top: top)
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftTopDidSetLayoutMaker {
		
		let top = CGRect.Float.closure(top)
		
		let maker = LeftTopDidSetLayoutMaker(parentView: self.parentView,
		                                     left: self.left,
		                                     top: top)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftTopDidSetLayoutMaker(parentView: self.parentView,
		                                     left: self.left,
		                                     top: top)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftTopDidSetLayoutMaker(parentView: self.parentView,
		                                     left: self.left,
		                                     top: top)
		
		return maker
		
	}
	
}

// MARK: Middle
extension LeftDidSetLayoutMaker {
	
	public func setMiddle(to middle: CGFloat) -> LeftMiddleDidSetLayoutMaker {
		
		let middle = CGRect.Float.constant(middle)
		
		let maker = LeftMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        middle: middle)
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftMiddleDidSetLayoutMaker {
		
		let middle = CGRect.Float.closure(middle)
		
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
extension LeftDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> LeftBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.constant(bottom)
		
		let maker = LeftBottomDidSetLayoutMaker(parentView: self.parentView,
		                                        left: self.left,
		                                        bottom: bottom)
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.closure(bottom)
		
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

