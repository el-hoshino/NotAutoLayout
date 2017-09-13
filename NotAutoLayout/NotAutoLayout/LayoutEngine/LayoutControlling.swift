//
//  LayoutControlling.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/11.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension NotAutoLayoutContainer where Containee: UIView {
	
	/// Forcedly place a `view` with a specific `frame`.
	///
	/// - Parameters:
	///   - view: The target `UIView`.
	///   - frame: The desired frame for the target `UIView`
	public func place(_ view: UIView, with frame: CGRect) {
		
		if view.transform.isIdentity {
			view.frame = frame
			
		} else {
			let anchorPoint = view.layer.anchorPoint
			let bounds = Bounds(frame: frame, anchorPoint: anchorPoint)
			self.place(view, with: bounds)
		}
		
	}
	
	private func place(_ view: UIView, with bounds: Bounds) {
		
		view.bounds.size = bounds.size
		view.center = bounds.center
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func place(_ view: UIView, with layout: Layout.Individual) {
		
		let frame = layout.evaluatedFrame(for: view, fittedBy: { view.sizeThatFits($0) }, with: self.layoutProperty)
		self.place(view, with: frame)
		
	}
	
	func place(_ view: UIView, after previousView: UIView?, with layout: Layout.Sequential) {
		
		fatalError("Not implemented yet")
		
	}
	
	func place(_ view: UIView, afterCol previousColView: UIView?, afterRow previousRowView: UIView?, with layout: Layout.Matrical) {
		
		fatalError("Not implemented yet")
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func place(_ subview: UIView, by making: (_ layoutMaker: InitialLayoutMaker) -> Layout.Individual) {
		
		let maker = InitialLayoutMaker(parentView: self.body)
		let layout = making(maker)
		
		self.place(subview, with: layout)
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func makeLayout(_ making: (InitialLayoutMaker) -> Layout.Individual) -> Layout.Individual {
		
		let maker = InitialLayoutMaker(parentView: self.body)
		return making(maker)
		
	}
	
}
