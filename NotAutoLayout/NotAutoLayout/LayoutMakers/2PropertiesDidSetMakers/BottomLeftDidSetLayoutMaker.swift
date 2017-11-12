//
//  BottomLeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct BottomLeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomLeft: LayoutElement.Point
	
}

// MARK: - Make Frame
extension BottomLeftDidSetLayoutMaker {
	
	private func makeFrame(bottomLeft: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (topCenter.x - bottomLeft.x) * 2
		let height = bottomLeft.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = topRight.x - bottomLeft.x
		let height = bottomLeft.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - bottomLeft.x) * 2
		let height = (bottomLeft.y - middleCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = middleRight.x - bottomLeft.x
		let height = (bottomLeft.y - middleRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, size: CGSize) -> CGRect {
		
		let x = bottomLeft.x
		let y = bottomLeft.y - size.height
		let width = size.width
		let height = size.height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopCenter
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetTopCenterToMakeLayoutEditorType {
	
	public typealias WillSetTopCenterMaker = LayoutEditor
	
	public func makeFrame(topCenter: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: parameter)
		let topCenter = topCenter.evaluated(from: parameter)
		return self.makeFrame(bottomLeft: bottomLeft, topCenter: topCenter)
	}
	
}

// MARK: TopRight
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetTopRightToMakeLayoutEditorType {
	
	public typealias WillSetTopRightMaker = LayoutEditor
	
	public func makeFrame(topRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: parameter)
		let topRight = topRight.evaluated(from: parameter)
		return self.makeFrame(bottomLeft: bottomLeft, topRight: topRight)
	}
	
}

// MARK: MiddleCenter
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetMiddleCenterToMakeLayoutEditorType {
	
	public typealias WillSetMiddleCenterMaker = LayoutEditor
	
	public func makeFrame(middleCenter: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: parameter)
		let middleCenter = middleCenter.evaluated(from: parameter)
		return self.makeFrame(bottomLeft: bottomLeft, middleCenter: middleCenter)
	}
	
}

// MARK: MiddleRight
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetMiddleRightToMakeLayoutEditorType {
	
	public typealias WillSetMiddleRightMaker = LayoutEditor
	
	public func makeFrame(middleRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let bottomLeft = self.bottomLeft.evaluated(from: parameter)
		let middleRight = middleRight.evaluated(from: parameter)
		return self.makeFrame(bottomLeft: bottomLeft, middleRight: middleRight)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension BottomLeftDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let bottomLeft = self.bottomLeft.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(bottomLeft: bottomLeft, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let bottomLeft = self.bottomLeft.evaluated(from: boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(bottomLeft: bottomLeft, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetCenterType {
	
	public typealias WillSetCenterMaker = BottomLeftCenterDidSetLayoutMaker
	
	public func setCenter(_ center: LayoutElement.Float) -> BottomLeftCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 center: center)
		
	}
	
}

// MARK: Right
extension BottomLeftDidSetLayoutMaker: LayoutMakerCanSetRightType {
	
	public typealias WillSetRightMaker = BottomLeftRightDidSetLayoutMaker
	
	public func setRight(_ right: LayoutElement.Float) -> BottomLeftRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomLeft: self.bottomLeft,
					 right: right)
		
	}
	
}

// MARK: Top
extension BottomLeftDidSetLayoutMaker {
	
	public func setTop(to top: CGFloat) -> BottomLeftTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.constant(top)
		
		let maker = BottomLeftTopDidSetLayoutMaker(parentView: self.parentView,
		                                           bottomLeft: self.bottomLeft,
		                                           top: top)
		
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> BottomLeftTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.closure(top)
		
		let maker = BottomLeftTopDidSetLayoutMaker(parentView: self.parentView,
		                                           bottomLeft: self.bottomLeft,
		                                           top: top)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> BottomLeftTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomLeftTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> BottomLeftTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = BottomLeftTopDidSetLayoutMaker(parentView: self.parentView,
		                                           bottomLeft: self.bottomLeft,
		                                           top: top)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomLeftTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = BottomLeftTopDidSetLayoutMaker(parentView: self.parentView,
		                                           bottomLeft: self.bottomLeft,
		                                           top: top)
		
		return maker
		
	}
	
}

// MARK: Middle
extension BottomLeftDidSetLayoutMaker {
	
	public func setMiddle(to middle: CGFloat) -> BottomLeftMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.constant(middle)
		
		let maker = BottomLeftMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                              bottomLeft: self.bottomLeft,
		                                              middle: middle)
		
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> BottomLeftMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.closure(middle)
		
		let maker = BottomLeftMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                              bottomLeft: self.bottomLeft,
		                                              middle: middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> BottomLeftMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomLeftMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> BottomLeftMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = BottomLeftMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                              bottomLeft: self.bottomLeft,
		                                              middle: middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomLeftMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = BottomLeftMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                              bottomLeft: self.bottomLeft,
		                                              middle: middle)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension BottomLeftDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> BottomLeftWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = BottomLeftWidthDidSetLayoutMaker(parentView: self.parentView,
		                                             bottomLeft: self.bottomLeft,
		                                             width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> BottomLeftWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = BottomLeftWidthDidSetLayoutMaker(parentView: self.parentView,
		                                             bottomLeft: self.bottomLeft,
		                                             width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension BottomLeftDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> BottomLeftHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = BottomLeftHeightDidSetLayoutMaker(parentView: self.parentView,
		                                              bottomLeft: self.bottomLeft,
		                                              height: height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> BottomLeftHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = BottomLeftHeightDidSetLayoutMaker(parentView: self.parentView,
		                                              bottomLeft: self.bottomLeft,
		                                              height: height)
		
		return maker
		
	}
	
}
