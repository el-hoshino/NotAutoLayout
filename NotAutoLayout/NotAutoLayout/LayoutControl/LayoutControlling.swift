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
	
	public func layout(_ view: UIView, with layout: IndividualLayout) {
		
		let frame = layout.evaluatedFrame(for: view, from: self.viewFrameProperty)
		
		self.layout(view, with: frame)
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func layout(_ subview: UIView, by making: (_ layoutMaker: LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<IndividualLayout>) {
		
		let layout = self.makeLayout(making)
		
		self.layout(subview, with: layout)
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func makeLayout(_ making: (LayoutMaker<InitialLayoutProperty>) -> LayoutMaker<IndividualLayout>) -> IndividualLayout {
		
		let maker = LayoutMaker(parentView: self.body, didSetProperty: InitialLayoutProperty())
		let layout = making(maker).didSetProperty
		
		return layout
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func makeSequentialLayout(_ making: (LayoutMaker<InitialSequentialLayoutProperty>) -> LayoutMaker<SequentialLayout>) -> SequentialLayout {
		
		let maker = LayoutMaker(parentView: self.body, didSetProperty: InitialSequentialLayoutProperty())
		let layout = making(maker).didSetProperty
		
		return layout
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func layout(_ subviews: [UIView], with layout: SequentialLayout) {
		
		let frames = layout.evaluatedFrame(for: subviews, from: self.viewFrameProperty)
		
		for (subview, frame) in zip(subviews, frames) {
			self.layout(subview, with: frame)
		}
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func layout(_ subviews: [UIView], by making: (_ layoutMaker: LayoutMaker<InitialSequentialLayoutProperty>) -> LayoutMaker<SequentialLayout>) {
		
		let layout = self.makeSequentialLayout(making)
		
		self.layout(subviews, with: layout)
		
	}
	
}
