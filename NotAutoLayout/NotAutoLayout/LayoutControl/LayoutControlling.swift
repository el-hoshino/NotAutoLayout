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
		
		let frame = layout.evaluatedFrame(for: view, from: self.layoutGuides)
		
		self.layout(view, with: frame.cgValue)
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func layout(_ subview: UIView, by making: (_ layoutMaker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualLayout>) {
		
		let layout = self.makeLayout(making)
		
		self.layout(subview, with: layout)
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func makeLayout(_ making: (LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualLayout>) -> IndividualLayout {
		
		let maker = LayoutMaker(parentView: self.body, didSetProperty: IndividualProperty.Initial())
		let layout = making(maker).didSetProperty
		
		return layout
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func makeSequentialLayout(_ making: (LayoutMaker<SequentialProperty.Initial>) -> LayoutMaker<SequentialLayout>) -> SequentialLayout {
		
		let maker = LayoutMaker(parentView: self.body, didSetProperty: SequentialProperty.Initial())
		let layout = making(maker).didSetProperty
		
		return layout
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func layout(_ subviews: [UIView], with layout: SequentialLayout) {
		
		let frames = layout.evaluatedFrame(for: subviews, from: self.layoutGuides)
		
		for (subview, frame) in zip(subviews, frames) {
			self.layout(subview, with: frame.cgValue)
		}
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func layout(_ subviews: [UIView], by making: (_ layoutMaker: LayoutMaker<SequentialProperty.Initial>) -> LayoutMaker<SequentialLayout>) {
		
		let layout = self.makeSequentialLayout(making)
		
		self.layout(subviews, with: layout)
		
	}
	
}
