//
//  MiddleRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleRightDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleRight: LayoutElement.Point
	
}

// MARK: - Make Frame
extension MiddleRightDidSetLayoutMaker {
	
	private func makeFrame(middleRight: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = middleRight.x - topLeft.x
		let height = (middleRight.y - topLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (middleRight.x - topCenter.x) * 2
		let height = (middleRight.y - topCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = middleRight.x - bottomLeft.x
		let height = (bottomLeft.y - middleRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (middleRight.x - bottomCenter.x) * 2
		let height = (bottomCenter.y - middleRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleRight.x - size.width
		let y = middleRight.y - size.height.half
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetTopLeftType {
	
	public typealias WillSetTopLeftMaker = LayoutEditor
	
	public func setTopLeft(_ topLeft: LayoutElement.Point) -> MiddleRightDidSetLayoutMaker.WillSetTopLeftMaker {
		
		let layout = Layout { (parameter) -> CGRect in
			let middleRight = self.middleRight.evaluated(from: parameter)
			let topLeft = topLeft.evaluated(from: parameter)
			return self.makeFrame(middleRight: middleRight, topLeft: topLeft)
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: TopCenter
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetTopCenterType {
	
	public typealias WillSetTopCenterMaker = LayoutEditor
	
	public func setTopCenter(_ topCenter: LayoutElement.Point) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let middleRight = self.middleRight.evaluated(from: parameter)
			let topCenter = topCenter.evaluated(from: parameter)
			return self.makeFrame(middleRight: middleRight, topCenter: topCenter)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: BottomLeft
extension MiddleRightDidSetLayoutMaker {
	
	public func setBottomLeft(to bottomLeft: CGPoint) -> LayoutEditor {
		
		return self.setBottomLeft(by: { _ in bottomLeft })
		
	}
	
	public func setBottomLeft(by bottomLeft: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let middleRight = self.middleRight.evaluated(from: parameter)
			let bottomLeft = bottomLeft(parameter)
			let frame = self.makeFrame(middleRight: middleRight, bottomLeft: bottomLeft)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func pinBottomLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let middleRight = self.middleRight.evaluated(from: boundSize)
			let bottomLeft = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).evaluated(from: boundSize)
			let frame = self.makeFrame(middleRight: middleRight, bottomLeft: bottomLeft)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let middleRight = self.middleRight.evaluated(from: boundSize)
			let bottomLeft = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).evaluated(from: boundSize)
			let frame = self.makeFrame(middleRight: middleRight, bottomLeft: bottomLeft)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: BottomCenter
extension MiddleRightDidSetLayoutMaker {
	
	public func setBottomCenter(to bottomCenter: CGPoint) -> LayoutEditor {
		
		return self.setBottomCenter(by: { _ in bottomCenter })
		
	}
	
	public func setBottomCenter(by bottomCenter: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let middleRight = self.middleRight.evaluated(from: parameter)
			let bottomCenter = bottomCenter(parameter)
			let frame = self.makeFrame(middleRight: middleRight, bottomCenter: bottomCenter)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func pinBottomCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottomCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let middleRight = self.middleRight.evaluated(from: boundSize)
			let bottomCenter = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).evaluated(from: boundSize)
			let frame = self.makeFrame(middleRight: middleRight, bottomCenter: bottomCenter)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let middleRight = self.middleRight.evaluated(from: boundSize)
			let bottomCenter = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).evaluated(from: boundSize)
			let frame = self.makeFrame(middleRight: middleRight, bottomCenter: bottomCenter)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension MiddleRightDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let middleRight = self.middleRight.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(middleRight: middleRight, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let middleRight = self.middleRight.evaluated(from: boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(middleRight: middleRight, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension MiddleRightDidSetLayoutMaker: LayoutMakerCanSetLeftType {
	
	public typealias WillSetLeftMaker = MiddleRightLeftDidSetLayoutMaker
	
	public func setLeft(_ left: LayoutElement.Float) -> MiddleRightLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: self.middleRight,
					 left: left)
		
	}
	
}

// MARK: Center
extension MiddleRightDidSetLayoutMaker {
	
	public func setCenter(to center: CGFloat) -> MiddleRightCenterDidSetLayoutMaker {
		
		let center = LayoutElement.Float.constant(center)
		
		let maker = MiddleRightCenterDidSetLayoutMaker(parentView: self.parentView,
		                                               middleRight: self.middleRight,
		                                               center: center)
		
		return maker
		
	}
	
	public func setCenter(by center: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleRightCenterDidSetLayoutMaker {
		
		let center = LayoutElement.Float.closure(center)
		
		let maker = MiddleRightCenterDidSetLayoutMaker(parentView: self.parentView,
		                                               middleRight: self.middleRight,
		                                               center: center)
		
		return maker
		
	}
	
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> MiddleRightCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleRightCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> MiddleRightCenterDidSetLayoutMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = MiddleRightCenterDidSetLayoutMaker(parentView: self.parentView,
		                                               middleRight: self.middleRight,
		                                               center: center)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleRightCenterDidSetLayoutMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = MiddleRightCenterDidSetLayoutMaker(parentView: self.parentView,
		                                               middleRight: self.middleRight,
		                                               center: center)
		
		return maker
		
	}
	
}

// MARK: Top
extension MiddleRightDidSetLayoutMaker {
	
	public func setTop(to top: CGFloat) -> MiddleRightTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.constant(top)
		
		let maker = MiddleRightTopDidSetLayoutMaker(parentView: self.parentView,
		                                            middleRight: self.middleRight,
		                                            top: top)
		
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleRightTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.closure(top)
		
		let maker = MiddleRightTopDidSetLayoutMaker(parentView: self.parentView,
		                                            middleRight: self.middleRight,
		                                            top: top)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> MiddleRightTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleRightTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> MiddleRightTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = MiddleRightTopDidSetLayoutMaker(parentView: self.parentView,
		                                            middleRight: self.middleRight,
		                                            top: top)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleRightTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = MiddleRightTopDidSetLayoutMaker(parentView: self.parentView,
		                                            middleRight: self.middleRight,
		                                            top: top)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension MiddleRightDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> MiddleRightBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.constant(bottom)
		
		let maker = MiddleRightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                               middleRight: self.middleRight,
		                                               bottom: bottom)
		
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleRightBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.closure(bottom)
		
		let maker = MiddleRightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                               middleRight: self.middleRight,
		                                               bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> MiddleRightBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleRightBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> MiddleRightBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = MiddleRightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                               middleRight: self.middleRight,
		                                               bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleRightBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = MiddleRightBottomDidSetLayoutMaker(parentView: self.parentView,
		                                               middleRight: self.middleRight,
		                                               bottom: bottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension MiddleRightDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> MiddleRightWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = MiddleRightWidthDidSetLayoutMaker(parentView: self.parentView,
		                                              middleRight: self.middleRight,
		                                              width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleRightWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = MiddleRightWidthDidSetLayoutMaker(parentView: self.parentView,
		                                              middleRight: self.middleRight,
		                                              width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension MiddleRightDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> MiddleRightHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = MiddleRightHeightDidSetLayoutMaker(parentView: self.parentView,
		                                               middleRight: self.middleRight,
		                                               height: height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleRightHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = MiddleRightHeightDidSetLayoutMaker(parentView: self.parentView,
		                                               middleRight: self.middleRight,
		                                               height: height)
		
		return maker
		
	}
	
}
