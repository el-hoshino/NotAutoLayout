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
		
		let frame = layout.evaluatedFrame(for: view, fittedBy: { view.sizeThatFits($0) }, with: self.layoutControlParameter)
		self.layout(view, with: frame)
		
	}
	
	func layout(_ view: UIView, after previousView: UIView?, with layout: Layout.Sequential) {
		
		fatalError("Not implemented yet")
		
	}
	
	func layout(_ view: UIView, afterCol previousColView: UIView?, afterRow previousRowView: UIView?, with layout: Layout.Matrical) {
		
		fatalError("Not implemented yet")
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func layout(_ subview: UIView, by making: (_ layoutMaker: InitialLayoutMaker) -> Layout) {
		
		let maker = InitialLayoutMaker(parentView: self.body)
		let layout = making(maker)
		
		self.layout(subview, with: layout)
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func makeLayout(_ making: (InitialLayoutMaker) -> Layout) -> Layout {
		
		let maker = InitialLayoutMaker(parentView: self.body)
		return making(maker)
		
	}
	
}
