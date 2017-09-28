//
//  TopRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopRightDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topRight: CGRect.Point
	
}

extension TopRightDidSetLayoutMaker {
	
	private func makeFrame(topRight: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = topRight.x - bottomLeft.x
		let height = bottomLeft.y - topRight.y
		let x = bottomLeft.x
		let y = topRight.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(topRight: CGPoint, size: CGSize) -> CGRect {
		
		let x = topRight.x - size.width
		let y = topRight.y
		let width = size.width
		let height = size.height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension TopRightDidSetLayoutMaker {
	
	public func pinLeft(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopRightLeftDidSetLayoutMaker {
		
    	let referenceView = { [weak referenceView] in referenceView }
    	
    	return self.pinLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
    	
	}
	
	@available(iOS 11.0, *)
	public func pinLeft(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopRightLeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopRightLeftDidSetLayoutMaker {
		
		let left = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = TopRightLeftDidSetLayoutMaker(parentView: self.parentView,
		                                          topRight: self.topRight,
		                                          left: left)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopRightLeftDidSetLayoutMaker {
		
		let left = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = TopRightLeftDidSetLayoutMaker(parentView: self.parentView,
		                                          topRight: self.topRight,
		                                          left: left)
		
		return maker
		
	}
	
}

extension TopRightDidSetLayoutMaker {
	
	public func setBottomLeft(to bottomLeft: CGPoint) -> LayoutEditor {
		
		return self.setBottomLeft(by: { _ in bottomLeft })
		
	}
	
	public func setBottomLeft(by bottomLeft: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let topRight = self.topRight.evaluated(from: parameter)
			let bottomLeft = bottomLeft(parameter)
			let frame = self.makeFrame(topRight: topRight, bottomLeft: bottomLeft)
			
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
			let topRight = self.topRight.evaluated(from: boundSize)
			let bottomLeft = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).evaluated(from: boundSize)
			let frame = self.makeFrame(topRight: topRight, bottomLeft: bottomLeft)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let topRight = self.topRight.evaluated(from: boundSize)
			let bottomLeft = parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).evaluated(from: boundSize)
			let frame = self.makeFrame(topRight: topRight, bottomLeft: bottomLeft)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

extension TopRightDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let topRight = self.topRight.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(topRight: topRight, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let topRight = self.topRight.evaluated(from: boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(topRight: topRight, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
