//
//  TopRightLeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopRightLeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topRight: CGRect.Point
	
	let left: CGRect.Float
	
}

extension TopRightLeftDidSetLayoutMaker {
	
	private func makeFrame(topRight: CGPoint, left: CGFloat, bottom: CGFloat) -> CGRect {
		
		let x = left
		let y = topRight.y
		let width = topRight.x - left
		let height = bottom - topRight.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(topRight: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = topRight.y
		let width = topRight.x - left
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension TopRightLeftDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> LayoutEditor {
		
		return self.setBottom(by: { _ in bottom })
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let topRight = self.topRight.evaluated(from: parameter)
			let left = self.left.evaluated(from: parameter)
			let bottom = bottom(parameter)
			let frame = self.makeFrame(topRight: topRight, left: left, bottom: bottom)
			
			return frame
			
		})
        
        let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let topRight = self.topRight.evaluated(from: boundSize)
			let left = self.left.evaluated(from: boundSize)
			let bottom = parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).evaluated(from: boundSize)
			let frame = self.makeFrame(topRight: topRight, left: left, bottom: bottom)
			
			return frame
			
		})
        
        let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { [unowned parentView] (boundSize) -> CGRect in
			let topRight = self.topRight.evaluated(from: boundSize)
			let left = self.left.evaluated(from: boundSize)
			let bottom = parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).evaluated(from: boundSize)
			let frame = self.makeFrame(topRight: topRight, left: left, bottom: bottom)
			
			return frame
			
		})
        
        let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

extension TopRightLeftDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LayoutEditor {
		
		return self.setHeight(by: { _ in height })
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let topRight = self.topRight.evaluated(from: parameter)
			let left = self.left.evaluated(from: parameter)
			let height = height(parameter)
			let frame = self.makeFrame(topRight: topRight, left: left, height: height)

			return frame
			
		})
        
        let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let topRight = self.topRight.evaluated(from: boundSize)
			let left = self.left.evaluated(from: boundSize)
			let x = left
			let y = topRight.y
			let width = topRight.y - left
			let fittingSize = CGSize(width: width, height: fittingHeight)
			let height = fitting(fittingSize).height
			let frame = CGRect(x: x, y: y, width: width, height: height)
			
			return frame
			
		})
        
        let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
