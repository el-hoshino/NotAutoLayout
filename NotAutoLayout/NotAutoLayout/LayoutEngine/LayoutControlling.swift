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
		
		let frame = layout.evaluatedFrame(for: view, with: self.layoutControlParameter)
		self.layout(view, with: frame)
		
	}
	
	public func layout(_ views: [UIView], with layout: SequentialLayout) {
		
		views.forEachPair { (previousView, view) in
			let frame = layout.evaluatedFrame(for: view, after: previousView, with: self.layoutControlParameter)
			self.layout(view, with: frame)
		}
		
	}
	
	public func layout(_ views: [UIView], by numberOfColumnsInRow: @autoclosure () -> Int, with layout: MatricalLayout) {
		
		fatalError("Not implemented yet")
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func layout(_ subview: UIView, by making: (_ layoutMaker: LayoutMaker<LayoutElement.None>) -> LayoutEditor) {
		
		let maker = LayoutMaker<LayoutElement.None>(parentView: self.body, didSetLayoutElement: .init())
		let layout = making(maker).layout
		
		self.layout(subview, with: layout)
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public func makeLayout(_ making: (LayoutMaker<LayoutElement.None>) -> LayoutEditor) -> Layout {
		
		let maker = LayoutMaker<LayoutElement.None>(parentView: self.body, didSetLayoutElement: .init())
		return making(maker).layout
		
	}
	
	public func makeSequentialLayout(_ making: (InitialSequentialLayoutMaker) -> SequentialLayout) -> SequentialLayout {
		
		let maker = InitialSequentialLayoutMaker(parentView: self.body)
		return making(maker)
		
	}
	
}
