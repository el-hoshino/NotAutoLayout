//
//  LeftCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutElementLeftCenterType: LayoutElementType {
	
	var left: LayoutElement.Float { get }
	var center: LayoutElement.Float { get }
	
}

extension LayoutElement {
	
	public struct LeftCenter: LayoutElementLeftCenterType {
		
		public let left: LayoutElement.Float
		public let center: LayoutElement.Float
		
	}
	
}

extension LayoutMaker where DidSetLayoutElement: LayoutElementLeftCenterType {
	
	var left: LayoutElement.Float {
		return self.didSetLayoutElement.left
	}
	
	var center: LayoutElement.Float {
		return self.didSetLayoutElement.center
	}

}

// MARK: - Set A Line -
// MARK: Top
extension LayoutMaker where DidSetLayoutElement: LayoutElementLeftCenterType {
	
	public func setTop(to top: CGFloat) -> LeftCenterTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.constant(top)
		
		let maker = LeftCenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           center: self.center,
		                                           top: top)
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftCenterTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.closure(top)
		
		let maker = LeftCenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           center: self.center,
		                                           top: top)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftCenterTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftCenterTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftCenterTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftCenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           center: self.center,
		                                           top: top)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftCenterTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftCenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           center: self.center,
		                                           top: top)
		
		return maker
		
	}
	
}

// MARK: Middle
extension LayoutMaker where DidSetLayoutElement: LayoutElementLeftCenterType {
	
	public func setMiddle(to middle: CGFloat) -> LeftCenterMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.constant(middle)
		
		let maker = LeftCenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                              left: self.left,
		                                              center: self.center,
		                                              middle: middle)
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftCenterMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.closure(middle)
		
		let maker = LeftCenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                              left: self.left,
		                                              center: self.center,
		                                              middle: middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftCenterMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftCenterMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftCenterMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftCenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                              left: self.left,
		                                              center: self.center,
		                                              middle: middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftCenterMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftCenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                              left: self.left,
		                                              center: self.center,
		                                              middle: middle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension LayoutMaker where DidSetLayoutElement: LayoutElementLeftCenterType {
	
	public func setBottom(to bottom: CGFloat) -> LeftCenterBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.constant(bottom)
		
		let maker = LeftCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                              left: self.left,
		                                              center: self.center,
		                                              bottom: bottom)
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftCenterBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.closure(bottom)
		
		let maker = LeftCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                              left: self.left,
		                                              center: self.center,
		                                              bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftCenterBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftCenterBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftCenterBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                              left: self.left,
		                                              center: self.center,
		                                              bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftCenterBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                              left: self.left,
		                                              center: self.center,
		                                              bottom: bottom)
		
		return maker
		
	}
	
}

