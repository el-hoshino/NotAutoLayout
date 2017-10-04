//
//  LeftTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftTopDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: CGRect.Float
	
	let top: CGRect.Float
	
}

// MARK: - Make Frame
extension LeftTopDidSetLayoutMaker {
	
	private func makeFrame(left: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension LeftTopDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let left = self.left.evaluated(from: parameter)
			let top = self.top.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(left: left, top: top, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, parameter) -> CGRect in
			
			let left = self.left.evaluated(from: parameter)
			let top = self.top.evaluated(from: parameter)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(left: left, top: top, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension LeftTopDidSetLayoutMaker {
	
	public func setMiddle(to middle: CGFloat) -> LeftTopMiddleDidSetLayoutMaker {
		
		let middle = CGRect.Float.constant(middle)
		
		let maker = LeftTopMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           top: self.top,
		                                           middle: middle)
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftTopMiddleDidSetLayoutMaker {
		
		let middle = CGRect.Float.closure(middle)
		
		let maker = LeftTopMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           top: self.top,
		                                           middle: middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftTopMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftTopMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftTopMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftTopMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           top: self.top,
		                                           middle: middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftTopMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftTopMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           top: self.top,
		                                           middle: middle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension LeftTopDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> LeftTopBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.constant(bottom)
		
		let maker = LeftTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           top: self.top,
		                                           bottom: bottom)
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftTopBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.closure(bottom)
		
		let maker = LeftTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           top: self.top,
		                                           bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftTopBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftTopBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftTopBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           top: self.top,
		                                           bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftTopBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           top: self.top,
		                                           bottom: bottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension LeftTopDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> LeftTopWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.constant(width)
		
		let maker = LeftTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          left: self.left,
		                                          top: self.top,
		                                          width: width)
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftTopWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(width)
		
		let maker = LeftTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          left: self.left,
		                                          top: self.top,
		                                          width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension LeftTopDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LeftTopHeightDidSetLayoutMaker {
		
		let height = CGRect.Float.constant(height)
		
		let maker = LeftTopHeightDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           top: self.top,
		                                           height: height)
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftTopHeightDidSetLayoutMaker {
		
		let height = CGRect.Float.closure(height)
		
		let maker = LeftTopHeightDidSetLayoutMaker(parentView: self.parentView,
		                                           left: self.left,
		                                           top: self.top,
		                                           height: height)
		
		return maker
		
	}
	
}
