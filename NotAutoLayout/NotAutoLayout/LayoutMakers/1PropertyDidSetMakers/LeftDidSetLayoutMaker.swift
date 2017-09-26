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

extension LeftDidSetLayoutMaker {
	
	public func setTop(to top: CGFloat) -> LeftTopDidSetLayoutMaker {
		
		let maker = LeftTopDidSetLayoutMaker(parentView: self.parentView,
		                                     left: self.left,
		                                     top: .constant(top))
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftTopDidSetLayoutMaker {
		
		let top = CGRect.Float.closure(top)
		
		let maker = LeftTopDidSetLayoutMaker(parentView: self.parentView,
		                                     left: self.left,
		                                     top: top)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftTopDidSetLayoutMaker(parentView: self.parentView,
		                                     left: self.left,
		                                     top: top)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftTopDidSetLayoutMaker(parentView: self.parentView,
		                                     left: self.left,
		                                     top: top)
		
		return maker
		
	}
	
}

extension LeftDidSetLayoutMaker {
	
	public func setRight(to right: CGFloat) -> LeftRightDidSetLayoutMaker {
		
		let maker = LeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                       left: self.left,
		                                       right: .constant(right))
		return maker
		
	}
	
	public func setRight(by right: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftRightDidSetLayoutMaker {
		
		let right = CGRect.Float.closure(right)
		
		let maker = LeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                       left: self.left,
		                                       right: right)
		
		return maker
		
	}
	
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftRightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                       left: self.left,
		                                       right: right)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftRightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                       left: self.left,
		                                       right: right)
		
		return maker
		
	}
	
}
