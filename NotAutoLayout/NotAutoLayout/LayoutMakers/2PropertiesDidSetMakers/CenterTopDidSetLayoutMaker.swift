//
//  CenterTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutElementCenterTopType: LayoutElementType {
	
	var center: LayoutElement.Float { get }
	var top: LayoutElement.Float { get }
	
}

public struct CenterTopDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Float
	
	let top: LayoutElement.Float
	
}

// MARK: - Make Frame
extension CenterTopDidSetLayoutMaker {
	
	private func makeFrame(center: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let left = center - size.width.half
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension CenterTopDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let center = self.center.evaluated(from: parameter)
			let top = self.top.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(center: center, top: top, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, parameter) -> CGRect in
			
			let center = self.center.evaluated(from: parameter)
			let top = self.top.evaluated(from: parameter)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(center: center, top: top, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension CenterTopDidSetLayoutMaker {
	
	public func setMiddle(to middle: CGFloat) -> CenterTopMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.constant(middle)
		
		let maker = CenterTopMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             middle: middle)
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterTopMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.closure(middle)
		
		let maker = CenterTopMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             middle: middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterTopMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterTopMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterTopMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = CenterTopMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             middle: middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterTopMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = CenterTopMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             middle: middle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension CenterTopDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> CenterTopBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.constant(bottom)
		
		let maker = CenterTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             bottom: bottom)
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterTopBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.closure(bottom)
		
		let maker = CenterTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterTopBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterTopBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterTopBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = CenterTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterTopBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = CenterTopBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             bottom: bottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension CenterTopDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> CenterTopWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = CenterTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                            center: self.center,
		                                            top: self.top,
		                                            width: width)
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterTopWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = CenterTopWidthDidSetLayoutMaker(parentView: self.parentView,
		                                            center: self.center,
		                                            top: self.top,
		                                            width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension CenterTopDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> CenterTopHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = CenterTopHeightDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             height: height)
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterTopHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = CenterTopHeightDidSetLayoutMaker(parentView: self.parentView,
		                                             center: self.center,
		                                             top: self.top,
		                                             height: height)
		
		return maker
		
	}
	
}
