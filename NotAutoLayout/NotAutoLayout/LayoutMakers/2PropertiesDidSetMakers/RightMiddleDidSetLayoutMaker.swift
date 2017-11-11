//
//  RightMiddleDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutElementRightMiddleType: LayoutElementType {
	
	var right: LayoutElement.Float { get }
	var middle: LayoutElement.Float { get }
	
}

public struct RightMiddleDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let right: LayoutElement.Float
	
	let middle: LayoutElement.Float
	
}

// MARK: - Make Frame
extension RightMiddleDidSetLayoutMaker {
	
	private func makeFrame(right: CGFloat, middle: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let top = middle - size.height.half
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension RightMiddleDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let right = self.right.evaluated(from: parameter)
			let middle = self.middle.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(right: right, middle: middle, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, parameter) -> CGRect in
			
			let right = self.right.evaluated(from: parameter)
			let middle = self.middle.evaluated(from: parameter)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(right: right, middle: middle, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension RightMiddleDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> RightMiddleBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.constant(bottom)
		
		let maker = RightMiddleBottomDidSetLayoutMaker(parentView: self.parentView,
		                                               right: self.right,
		                                               middle: self.middle,
		                                               bottom: bottom)
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightMiddleBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.closure(bottom)
		
		let maker = RightMiddleBottomDidSetLayoutMaker(parentView: self.parentView,
		                                               right: self.right,
		                                               middle: self.middle,
		                                               bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightMiddleBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightMiddleBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightMiddleBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = RightMiddleBottomDidSetLayoutMaker(parentView: self.parentView,
		                                               right: self.right,
		                                               middle: self.middle,
		                                               bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightMiddleBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = RightMiddleBottomDidSetLayoutMaker(parentView: self.parentView,
		                                               right: self.right,
		                                               middle: self.middle,
		                                               bottom: bottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension RightMiddleDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> RightMiddleWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = RightMiddleWidthDidSetLayoutMaker(parentView: self.parentView,
		                                              right: self.right,
		                                              middle: self.middle,
		                                              width: width)
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightMiddleWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = RightMiddleWidthDidSetLayoutMaker(parentView: self.parentView,
		                                              right: self.right,
		                                              middle: self.middle,
		                                              width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension RightMiddleDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> RightMiddleHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = RightMiddleHeightDidSetLayoutMaker(parentView: self.parentView,
		                                               right: self.right,
		                                               middle: self.middle,
		                                               height: height)
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightMiddleHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = RightMiddleHeightDidSetLayoutMaker(parentView: self.parentView,
		                                               right: self.right,
		                                               middle: self.middle,
		                                               height: height)
		
		return maker
		
	}
	
}
