//
//  RightTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutElementRightTopType: LayoutElementType {
	
	var right: LayoutElement.Float { get }
	var top: LayoutElement.Float { get }
	
}

public struct RightTopDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let right: LayoutElement.Float
	
	let top: LayoutElement.Float
	
}

// MARK: - Make Frame
extension RightTopDidSetLayoutMaker {
	
	private func makeFrame(right: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension RightTopDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let right = self.right.evaluated(from: parameter)
			let top = self.top.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(right: right, top: top, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, parameter) -> CGRect in
			
			let right = self.right.evaluated(from: parameter)
			let top = self.top.evaluated(from: parameter)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(right: right, top: top, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension RightTopDidSetLayoutMaker {
	
	public func setMiddle(to middle: CGFloat) -> RightTopMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.constant(middle)
		
		let maker = RightTopMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                            right: self.right,
		                                            top: self.top,
		                                            middle: middle)
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightTopMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.closure(middle)
		
		let maker = RightTopMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                            right: self.right,
		                                            top: self.top,
		                                            middle: middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightTopMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightTopMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightTopMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = RightTopMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                            right: self.right,
		                                            top: self.top,
		                                            middle: middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightTopMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = RightTopMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                            right: self.right,
		                                            top: self.top,
		                                            middle: middle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension RightTopDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> RightTopBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.constant(bottom)
		
		let maker = RightTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                            right: self.right,
		                                            top: self.top,
		                                            bottom: bottom)
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightTopBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.closure(bottom)
		
		let maker = RightTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                            right: self.right,
		                                            top: self.top,
		                                            bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightTopBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightTopBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightTopBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = RightTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                            right: self.right,
		                                            top: self.top,
		                                            bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightTopBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = RightTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                            right: self.right,
		                                            top: self.top,
		                                            bottom: bottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension RightTopDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> RightTopWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = RightTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                           right: self.right,
		                                           top: self.top,
		                                           width: width)
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightTopWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = RightTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                           right: self.right,
		                                           top: self.top,
		                                           width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension RightTopDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> RightTopHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = RightTopHeightDidSetLayoutMaker(parentView: self.parentView,
		                                            right: self.right,
		                                            top: self.top,
		                                            height: height)
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightTopHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = RightTopHeightDidSetLayoutMaker(parentView: self.parentView,
		                                            right: self.right,
		                                            top: self.top,
		                                            height: height)
		
		return maker
		
	}
	
}
