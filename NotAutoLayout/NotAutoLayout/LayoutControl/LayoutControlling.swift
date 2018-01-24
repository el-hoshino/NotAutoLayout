//
//  LayoutControlling.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/11.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension NotAutoLayoutContainer where Containee: UIView {
	
	/// Layout a `view` with a specific `frame`.
	///
	/// - Parameters:
	///   - view: The target `UIView`.
	///   - frame: The desired frame for the target `UIView`
	public func layout(_ view: UIView, with frame: CGRect) {
		
		if view.transform.isIdentity {
			view.frame = frame
			
		} else {
			let anchorPoint = view.layer.anchorPoint
			let bounds = Bounds(frame: frame, anchorPoint: anchorPoint)
			self.layout(view, with: bounds)
		}
		
	}
	
	private func layout(_ view: UIView, with bounds: Bounds) {
		
		view.bounds.size = bounds.size
		view.center = bounds.center
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func layout(_ view: UIView, with layout: Layout) {
		
		let frame = layout.evaluatedFrame(from: self.viewFrameProperty(forChild: view))
		
		self.layout(view, with: frame)
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func layout(_ subview: UIView, by making: (_ layoutMaker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<Layout>) {
		
		let layout = self.makeLayout(making)
		
		self.layout(subview, with: layout)
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func makeLayout(_ making: (LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<Layout>) -> Layout {
		
		let maker = LayoutMaker(parentView: self.body, didSetProperty: InitialLayoutProperty())
		let layout = making(maker).didSetProperty
		
		return layout
		
	}
	
}
