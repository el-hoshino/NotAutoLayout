//
//  LayoutControllablePublicAPIs.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	/// Forcedly place a `view` with a specific `frame`.
	///
	/// - Parameters:
	///   - view: The target `UIView`.
	///   - frame: The desired frame for the target `UIView`
	public func place(_ view: UIView, with frame: CGRect) {
		
		if view.transform.isIdentity {
			view.frame = frame
		}
		else {
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

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	private func place(_ view: UIView, with layout: Layout.Individual) {
		
		let frame = layout.evaluatedFrame(fittedBy: { view.sizeThatFits($0)	}, in: self.boundSize)
		self.place(view, with: frame)
		
	}
	
	private func place(_ view: UIView, after previousView: UIView?, with layout: Layout.Sequential) {
		
		fatalError("Not implemented yet")
		
	}
	
	private func place(_ view: UIView, afterCol previousColView: UIView?, afterRow previousRowView: UIView?, with layout: Layout.Matrical) {
		
		fatalError("Not implemented yet")
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	private func layoutNormally(subviews: [UIView]) {
		
		let layoutInfo = self.getCurrentLayoutInfo()
		let defaultLayoutInfo = self.getDefaultLayoutInfo()
		
		subviews.forEach { (view) in
			if let layout = self.getLayout(for: view, from: layoutInfo, or: defaultLayoutInfo) {
				self.place(view, with: layout)
			}
		}
		
	}
	
	private func layoutSequencially(subviews: [UIView]) {
		
		fatalError("Not implemented yet")
		
	}
	
	private func layoutMatrically(subviews: [UIView], colsPerRow: Int) {
		
		fatalError("Not implemented yet")
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	/// Layout all the subviews which have linked layout information. If you conform your own `UIView` to `LayoutControllable` protocol, call this method inside `layoutSubviews()` method.
	public func layoutControl() {
		
		let subviews = self.getLayoutRequiredSubviews(sortedByOrder: true)
		
		switch self.body.layoutOptimization {
		case .none:
			self.layoutNormally(subviews: subviews)
			
		case .sequence:
			fatalError("Not implemented yet")
			
		case .matrix:
			fatalError("Not implemented yet")
		}
		
	}
	
}

