//
//  TopLeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutElementTopLeftType: LayoutElementType {
	
	var topLeft: LayoutElement.Point { get }
	
}

public struct TopLeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topLeft: LayoutElement.Point
	
}

// MARK: - Make Frame
extension TopLeftDidSetLayoutMaker {
	
	private func makeFrame(topLeft: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - topLeft.x) * 2
		let height = (middleCenter.y - topLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = middleRight.x - topLeft.x
		let height = (middleRight.y - topLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - topLeft.x) * 2
		let height = bottomCenter.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = bottomRight.x - topLeft.x
		let height = bottomRight.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, size: CGSize) -> CGRect {
		
		let origin = topLeft
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleCenter
extension TopLeftDidSetLayoutMaker {
	
	public func setMiddleCenter(to middleCenter: CGPoint) -> LayoutEditor {
		
		return self.setMiddleCenter(by: { _ in middleCenter })
		
	}
	
	public func setMiddleCenter(by middleCenter: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let topLeft = self.topLeft.evaluated(from: parameter)
			let middleCenter = middleCenter(parameter)
			let frame = self.makeFrame(topLeft: topLeft, middleCenter: middleCenter)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func pinMiddleCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let topLeft = self.topLeft.evaluated(from: boundSize)
			let middleCenter = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).evaluated(from: boundSize)
			let frame = self.makeFrame(topLeft: topLeft, middleCenter: middleCenter)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let topLeft = self.topLeft.evaluated(from: boundSize)
			let middleCenter = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).evaluated(from: boundSize)
			let frame = self.makeFrame(topLeft: topLeft, middleCenter: middleCenter)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: MiddleRight
extension TopLeftDidSetLayoutMaker {
	
	public func setMiddleRight(to middleRight: CGPoint) -> LayoutEditor {
		
		return self.setMiddleRight(by: { _ in middleRight })
		
	}
	
	public func setMiddleRight(by middleRight: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let topLeft = self.topLeft.evaluated(from: parameter)
			let middleRight = middleRight(parameter)
			let frame = self.makeFrame(topLeft: topLeft, middleRight: middleRight)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func pinMiddleRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddleRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let topLeft = self.topLeft.evaluated(from: boundSize)
			let middleRight = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).evaluated(from: boundSize)
			let frame = self.makeFrame(topLeft: topLeft, middleRight: middleRight)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let topLeft = self.topLeft.evaluated(from: boundSize)
			let middleRight = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).evaluated(from: boundSize)
			let frame = self.makeFrame(topLeft: topLeft, middleRight: middleRight)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: BottomCenter
extension TopLeftDidSetLayoutMaker {
	
	public func setBottomCenter(to bottomCenter: CGPoint) -> LayoutEditor {
		
		return self.setBottomCenter(by: { _ in bottomCenter })
		
	}
	
	public func setBottomCenter(by bottomCenter: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let topLeft = self.topLeft.evaluated(from: parameter)
			let bottomCenter = bottomCenter(parameter)
			let frame = self.makeFrame(topLeft: topLeft, bottomCenter: bottomCenter)
			
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
			let topLeft = self.topLeft.evaluated(from: boundSize)
			let bottomCenter = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).evaluated(from: boundSize)
			let frame = self.makeFrame(topLeft: topLeft, bottomCenter: bottomCenter)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let topLeft = self.topLeft.evaluated(from: boundSize)
			let bottomCenter = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).evaluated(from: boundSize)
			let frame = self.makeFrame(topLeft: topLeft, bottomCenter: bottomCenter)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: BottomRight
extension TopLeftDidSetLayoutMaker {
	
	public func setBottomRight(to bottomRight: CGPoint) -> LayoutEditor {
		
		return self.setBottomRight(by: { _ in bottomRight })
		
	}
	
	public func setBottomRight(by bottomRight: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let topLeft = self.topLeft.evaluated(from: parameter)
			let bottomRight = bottomRight(parameter)
			let frame = self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
			
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
			let topLeft = self.topLeft.evaluated(from: boundSize)
			let bottomRight = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).evaluated(from: boundSize)
			let frame = self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
			
			return frame
			
		})
        
        let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let topLeft = self.topLeft.evaluated(from: boundSize)
			let bottomRight = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).evaluated(from: boundSize)
			let frame = self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
			
			return frame
			
		})
        
        let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
// MARK: - Set A Size -
// MARK: Size
extension TopLeftDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let topLeft = self.topLeft.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(topLeft: topLeft, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let topLeft = self.topLeft.evaluated(from: boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(topLeft: topLeft, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension TopLeftDidSetLayoutMaker {
	
	public func setCenter(to center: CGFloat) -> TopLeftCenterDidSetLayoutMaker {
		
		let center = LayoutElement.Float.constant(center)
		
		let maker = TopLeftCenterDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           center: center)
		
		return maker
		
	}
	
	public func setCenter(by center: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopLeftCenterDidSetLayoutMaker {
		
		let center = LayoutElement.Float.closure(center)
		
		let maker = TopLeftCenterDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           center: center)
		
		return maker
		
	}
	
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopLeftCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopLeftCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopLeftCenterDidSetLayoutMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = TopLeftCenterDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           center: center)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopLeftCenterDidSetLayoutMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = TopLeftCenterDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           center: center)
		
		return maker
		
	}
	
}

// MARK: Right
extension TopLeftDidSetLayoutMaker {
	
	public func setRight(to right: CGFloat) -> TopLeftRightDidSetLayoutMaker {
		
		let right = LayoutElement.Float.constant(right)
		
		let maker = TopLeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                          topLeft: self.topLeft,
		                                          right: right)
		
		return maker
		
	}
	
	public func setRight(by right: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopLeftRightDidSetLayoutMaker {
		
		let right = LayoutElement.Float.closure(right)
		
		let maker = TopLeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                          topLeft: self.topLeft,
		                                          right: right)
		
		return maker
		
	}
	
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopLeftRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopLeftRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopLeftRightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = TopLeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                          topLeft: self.topLeft,
		                                          right: right)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopLeftRightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = TopLeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                          topLeft: self.topLeft,
		                                          right: right)
		
		return maker
		
	}
	
}

// MARK: Middle
extension TopLeftDidSetLayoutMaker {
	
	public func setMiddle(to middle: CGFloat) -> TopLeftMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.constant(middle)
		
		let maker = TopLeftMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           middle: middle)
		
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopLeftMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.closure(middle)
		
		let maker = TopLeftMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           middle: middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopLeftMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopLeftMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopLeftMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = TopLeftMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           middle: middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopLeftMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = TopLeftMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           middle: middle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension TopLeftDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> TopLeftBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.constant(bottom)
		
		let maker = TopLeftBottomDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           bottom: bottom)
		
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopLeftBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.closure(bottom)
		
		let maker = TopLeftBottomDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopLeftBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopLeftBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopLeftBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = TopLeftBottomDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopLeftBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = TopLeftBottomDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           bottom: bottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension TopLeftDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> TopLeftWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = TopLeftWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          topLeft: self.topLeft,
		                                          width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopLeftWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = TopLeftWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          topLeft: self.topLeft,
		                                          width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension TopLeftDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> TopLeftHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = TopLeftHeightDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           height: height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopLeftHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = TopLeftHeightDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           height: height)
		
		return maker
		
	}
	
}
