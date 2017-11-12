//
//  MiddleCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleCenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension MiddleCenterDidSetLayoutMaker {
	
	private func makeFrame(middleCenter: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - topLeft.x) * 2
		let height = (middleCenter.y - topLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = (topRight.x - middleCenter.x) * 2
		let height = (middleCenter.y - topRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - bottomLeft.x) * 2
		let height = (bottomLeft.y - middleCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - middleCenter.x) * 2
		let height = (bottomRight.y - middleCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleCenter.x - size.width.half
		let y = middleCenter.y - size.height.half
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension MiddleCenterDidSetLayoutMaker {
	
	public func setTopLeft(to topLeft: CGPoint) -> LayoutEditor {
		
		return self.setTopLeft(by: { _ in topLeft })
		
	}
	
	public func setTopLeft(by topLeft: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let middleCenter = self.middleCenter.evaluated(from: parameter)
			let topLeft = topLeft(parameter)
			let frame = self.makeFrame(middleCenter: middleCenter, topLeft: topLeft)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func pinTopLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTopLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let middleCenter = self.middleCenter.evaluated(from: boundSize)
			let topLeft = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).evaluated(from: boundSize)
			let frame = self.makeFrame(middleCenter: middleCenter, topLeft: topLeft)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let middleCenter = self.middleCenter.evaluated(from: boundSize)
			let topLeft = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).evaluated(from: boundSize)
			let frame = self.makeFrame(middleCenter: middleCenter, topLeft: topLeft)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: TopRight
extension MiddleCenterDidSetLayoutMaker {
	
	public func setTopRight(to topRight: CGPoint) -> LayoutEditor {
		
		return self.setTopRight(by: { _ in topRight })
		
	}
	
	public func setTopRight(by topRight: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let middleCenter = self.middleCenter.evaluated(from: parameter)
			let topRight = topRight(parameter)
			let frame = self.makeFrame(middleCenter: middleCenter, topRight: topRight)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func pinTopRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTopRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let middleCenter = self.middleCenter.evaluated(from: boundSize)
			let topRight = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).evaluated(from: boundSize)
			let frame = self.makeFrame(middleCenter: middleCenter, topRight: topRight)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let middleCenter = self.middleCenter.evaluated(from: boundSize)
			let topRight = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).evaluated(from: boundSize)
			let frame = self.makeFrame(middleCenter: middleCenter, topRight: topRight)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: BottomLeft
extension MiddleCenterDidSetLayoutMaker {
	
	public func setBottomLeft(to bottomLeft: CGPoint) -> LayoutEditor {
		
		return self.setBottomLeft(by: { _ in bottomLeft })
		
	}
	
	public func setBottomLeft(by bottomLeft: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let middleCenter = self.middleCenter.evaluated(from: parameter)
			let bottomLeft = bottomLeft(parameter)
			let frame = self.makeFrame(middleCenter: middleCenter, bottomLeft: bottomLeft)
			
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
			let middleCenter = self.middleCenter.evaluated(from: boundSize)
			let bottomLeft = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).evaluated(from: boundSize)
			let frame = self.makeFrame(middleCenter: middleCenter, bottomLeft: bottomLeft)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let middleCenter = self.middleCenter.evaluated(from: boundSize)
			let bottomLeft = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).evaluated(from: boundSize)
			let frame = self.makeFrame(middleCenter: middleCenter, bottomLeft: bottomLeft)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: BottomRight
extension MiddleCenterDidSetLayoutMaker {
	
	public func setBottomRight(to bottomRight: CGPoint) -> LayoutEditor {
		
		return self.setBottomRight(by: { _ in bottomRight })
		
	}
	
	public func setBottomRight(by bottomRight: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let middleCenter = self.middleCenter.evaluated(from: parameter)
			let bottomRight = bottomRight(parameter)
			let frame = self.makeFrame(middleCenter: middleCenter, bottomRight: bottomRight)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func pinBottomRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottomRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let middleCenter = self.middleCenter.evaluated(from: boundSize)
			let bottomRight = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).evaluated(from: boundSize)
			let frame = self.makeFrame(middleCenter: middleCenter, bottomRight: bottomRight)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let middleCenter = self.middleCenter.evaluated(from: boundSize)
			let bottomRight = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).evaluated(from: boundSize)
			let frame = self.makeFrame(middleCenter: middleCenter, bottomRight: bottomRight)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension MiddleCenterDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let middleCenter = self.middleCenter.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(middleCenter: middleCenter, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let middleCenter = self.middleCenter.evaluated(from: boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(middleCenter: middleCenter, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanSetLeftType {
	
	public typealias WillSetLeftMaker = MiddleCenterLeftDidSetLayoutMaker
	
	public func setLeft(_ left: LayoutElement.Float) -> MiddleCenterLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 left: left)
		
	}
	
}

// MARK: Right
extension MiddleCenterDidSetLayoutMaker {
	
	public func setRight(to right: CGFloat) -> MiddleCenterRightDidSetLayoutMaker {
		
		let right = LayoutElement.Float.constant(right)
		
		let maker = MiddleCenterRightDidSetLayoutMaker(parentView: self.parentView,
		                                               middleCenter: self.middleCenter,
		                                               right: right)
		
		return maker
		
	}
	
	public func setRight(by right: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleCenterRightDidSetLayoutMaker {
		
		let right = LayoutElement.Float.closure(right)
		
		let maker = MiddleCenterRightDidSetLayoutMaker(parentView: self.parentView,
		                                               middleCenter: self.middleCenter,
		                                               right: right)
		
		return maker
		
	}
	
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> MiddleCenterRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleCenterRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> MiddleCenterRightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = MiddleCenterRightDidSetLayoutMaker(parentView: self.parentView,
		                                               middleCenter: self.middleCenter,
		                                               right: right)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleCenterRightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = MiddleCenterRightDidSetLayoutMaker(parentView: self.parentView,
		                                               middleCenter: self.middleCenter,
		                                               right: right)
		
		return maker
		
	}
	
}

// MARK: Top
extension MiddleCenterDidSetLayoutMaker {
	
	public func setTop(to top: CGFloat) -> MiddleCenterTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.constant(top)
		
		let maker = MiddleCenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                             middleCenter: self.middleCenter,
		                                             top: top)
		
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleCenterTopDidSetLayoutMaker {
		
		let top = LayoutElement.Float.closure(top)
		
		let maker = MiddleCenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                             middleCenter: self.middleCenter,
		                                             top: top)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> MiddleCenterTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleCenterTopDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTop(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> MiddleCenterTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = MiddleCenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                             middleCenter: self.middleCenter,
		                                             top: top)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTop(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleCenterTopDidSetLayoutMaker {
		
		let top = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = MiddleCenterTopDidSetLayoutMaker(parentView: self.parentView,
		                                             middleCenter: self.middleCenter,
		                                             top: top)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension MiddleCenterDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> MiddleCenterBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.constant(bottom)
		
		let maker = MiddleCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                                middleCenter: self.middleCenter,
		                                                bottom: bottom)
		
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleCenterBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.closure(bottom)
		
		let maker = MiddleCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                                middleCenter: self.middleCenter,
		                                                bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> MiddleCenterBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleCenterBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> MiddleCenterBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = MiddleCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                                middleCenter: self.middleCenter,
		                                                bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleCenterBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = MiddleCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                                middleCenter: self.middleCenter,
		                                                bottom: bottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension MiddleCenterDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> MiddleCenterWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = MiddleCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               middleCenter: self.middleCenter,
		                                               width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleCenterWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = MiddleCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               middleCenter: self.middleCenter,
		                                               width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension MiddleCenterDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> MiddleCenterHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = MiddleCenterHeightDidSetLayoutMaker(parentView: self.parentView,
		                                                middleCenter: self.middleCenter,
		                                                height: height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleCenterHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = MiddleCenterHeightDidSetLayoutMaker(parentView: self.parentView,
		                                                middleCenter: self.middleCenter,
		                                                height: height)
		
		return maker
		
	}
	
}
