//
//  BottomCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct BottomCenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension BottomCenterDidSetLayoutMaker {
	
	private func makeFrame(bottomCenter: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - topLeft.x) * 2
		let height = bottomCenter.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = (topRight.x - bottomCenter.x) * 2
		let height = bottomCenter.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - middleLeft.x) * 2
		let height = (bottomCenter.y - middleLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = (middleRight.x - bottomCenter.x) * 2
		let height = (bottomCenter.y - middleRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = bottomCenter.x - size.width.half
		let y = bottomCenter.y - size.height
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft

// MARK: TopRight

// MARK: MiddleLeft

// MARK: MiddleRight

// MARK: - Set A Size -
// MARK: Size
extension BottomCenterDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let bottomCenter = self.bottomCenter.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(bottomCenter: bottomCenter, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let bottomCenter = self.bottomCenter.evaluated(from: boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(bottomCenter: bottomCenter, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension BottomCenterDidSetLayoutMaker {
	
	public func setLeft(to left: CGFloat) -> BottomCenterLeftDidSetLayoutMaker {
		
		let left = LayoutElement.Float.constant(left)
		
		let maker = BottomCenterLeftDidSetLayoutMaker(parentView: self.parentView,
		                                              bottomCenter: self.bottomCenter,
		                                              left: left)
		
		return maker
		
	}
	
	public func setLeft(by left: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> BottomCenterLeftDidSetLayoutMaker {
		
		let left = LayoutElement.Float.closure(left)
		
		let maker = BottomCenterLeftDidSetLayoutMaker(parentView: self.parentView,
		                                              bottomCenter: self.bottomCenter,
		                                              left: left)
		
		return maker
		
	}
	
	public func pinLeft(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> BottomCenterLeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinLeft(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomCenterLeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> BottomCenterLeftDidSetLayoutMaker {
		
		let left = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = BottomCenterLeftDidSetLayoutMaker(parentView: self.parentView,
		                                              bottomCenter: self.bottomCenter,
		                                              left: left)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomCenterLeftDidSetLayoutMaker {
		
		let left = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = BottomCenterLeftDidSetLayoutMaker(parentView: self.parentView,
		                                              bottomCenter: self.bottomCenter,
		                                              left: left)
		
		return maker
		
	}
	
}

// MARK: Right
extension BottomCenterDidSetLayoutMaker {
	
	public func setRight(to right: CGFloat) -> BottomCenterRightDidSetLayoutMaker {
		
		let right = LayoutElement.Float.constant(right)
		
		let maker = BottomCenterRightDidSetLayoutMaker(parentView: self.parentView,
		                                               bottomCenter: self.bottomCenter,
		                                               right: right)
		
		return maker
		
	}
	
	public func setRight(by right: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> BottomCenterRightDidSetLayoutMaker {
		
		let right = LayoutElement.Float.closure(right)
		
		let maker = BottomCenterRightDidSetLayoutMaker(parentView: self.parentView,
		                                               bottomCenter: self.bottomCenter,
		                                               right: right)
		
		return maker
		
	}
	
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> BottomCenterRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomCenterRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> BottomCenterRightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = BottomCenterRightDidSetLayoutMaker(parentView: self.parentView,
		                                               bottomCenter: self.bottomCenter,
		                                               right: right)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomCenterRightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = BottomCenterRightDidSetLayoutMaker(parentView: self.parentView,
		                                               bottomCenter: self.bottomCenter,
		                                               right: right)
		
		return maker
		
	}
	
}

// MARK: Top
extension BottomCenterDidSetLayoutMaker {
	
	public func setTop(to top: CGFloat) -> BottomCenterTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.constant(top)
		
		let maker = BottomCenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                             bottomCenter: self.bottomCenter,
		                                             top: top)
		
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> BottomCenterTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.closure(top)
		
		let maker = BottomCenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                             bottomCenter: self.bottomCenter,
		                                             top: top)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> BottomCenterTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomCenterTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> BottomCenterTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = BottomCenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                             bottomCenter: self.bottomCenter,
		                                             top: top)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomCenterTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = BottomCenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                             bottomCenter: self.bottomCenter,
		                                             top: top)
		
		return maker
		
	}
	
}

// MARK: Middle
extension BottomCenterDidSetLayoutMaker {
	
	public func setMiddle(to middle: CGFloat) -> BottomCenterMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.constant(middle)
		
		let maker = BottomCenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                                bottomCenter: self.bottomCenter,
		                                                middle: middle)
		
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> BottomCenterMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.closure(middle)
		
		let maker = BottomCenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                                bottomCenter: self.bottomCenter,
		                                                middle: middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> BottomCenterMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomCenterMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> BottomCenterMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = BottomCenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                                bottomCenter: self.bottomCenter,
		                                                middle: middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomCenterMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = BottomCenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                                bottomCenter: self.bottomCenter,
		                                                middle: middle)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension BottomCenterDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> BottomCenterWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = BottomCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               bottomCenter: self.bottomCenter,
		                                               width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> BottomCenterWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = BottomCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               bottomCenter: self.bottomCenter,
		                                               width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension BottomCenterDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> BottomCenterHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = BottomCenterHeightDidSetLayoutMaker(parentView: self.parentView,
		                                                bottomCenter: self.bottomCenter,
		                                                height: height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> BottomCenterHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = BottomCenterHeightDidSetLayoutMaker(parentView: self.parentView,
		                                                bottomCenter: self.bottomCenter,
		                                                height: height)
		
		return maker
		
	}
	
}
