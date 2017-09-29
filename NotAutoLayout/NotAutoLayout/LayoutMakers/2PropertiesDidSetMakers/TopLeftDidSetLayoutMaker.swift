//
//  TopLeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopLeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topLeft: CGRect.Point
	
}

extension TopLeftDidSetLayoutMaker {
	
	private func makeFrame(topLeft: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = bottomRight.x - topLeft.x
		let height = bottomRight.y - topLeft.y
		let x = topLeft.x
		let y = topLeft.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(topLeft: CGPoint, size: CGSize) -> CGRect {
		
		let origin = topLeft
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

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

extension TopLeftDidSetLayoutMaker {
	
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopLeftRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopLeftRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopLeftRightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = TopLeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                          topLeft: self.topLeft,
		                                          right: right)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopLeftRightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = TopLeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                          topLeft: self.topLeft,
		                                          right: right)
		
		return maker
		
	}
	
}

extension TopLeftDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> TopLeftWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.constant(width)
		
		let maker = TopLeftWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          topLeft: self.topLeft,
		                                          width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopLeftWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(width)
		
		let maker = TopLeftWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          topLeft: self.topLeft,
		                                          width: width)
		
		return maker
		
	}
	
}

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
