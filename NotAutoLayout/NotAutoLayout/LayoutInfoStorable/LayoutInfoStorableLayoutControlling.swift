//
//  LayoutInfoStorableLayoutControlling.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	private func layoutNormally(subviews: [UIView]) {
		
		let layoutInfo = self.getCurrentLayoutInfo()
		let defaultLayoutInfo = self.getDefaultLayoutInfo()
		
		subviews.forEach { (view) in
			if let layout = self.getLayout(for: view, from: layoutInfo, or: defaultLayoutInfo) {
				self.layout(view, with: layout)
			}
		}
		
	}
	
	private func layoutSequencially(subviews: [UIView], with sequentialLayout: SequentialLayout) {
		
		let layoutInfo = self.getCurrentLayoutInfo()
		
		let specificSubviewsWithLayouts = subviews.flatMap { (subview) -> (UIView, Layout)? in
			if let layout = self.getLayout(for: subview, from: layoutInfo) {
				return (subview, layout)
			} else {
				return nil
			}
		}
		
		let sequentialSubviews = subviews.filter { (subview) -> Bool in
			specificSubviewsWithLayouts.contains(where: { $0.0 === subview }) == false
		}
		
		specificSubviewsWithLayouts.forEach { (view, layout) in
			self.layout(view, with: layout)
		}
		
		self.layout(sequentialSubviews, with: sequentialLayout)
		
	}
	
	private func layoutMatrically(subviews: [UIView], columnsPerRow: Int) {
		
		fatalError("Not implemented yet")
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	/// Layout all the subviews which have linked layout information. If you conform your own `UIView` to `LayoutInfoStorable` protocol, call this method inside `layoutSubviews()` method.
	public func layoutSubviews() {
		
		let subviews = self.getSubviews(sortedByOrder: true)
		
		switch self.body.layoutOptimization {
		case .none:
			self.layoutNormally(subviews: subviews)
			
		case .sequence(sequentialLayout: let sequentialLayout):
			self.layoutSequencially(subviews: subviews, with: sequentialLayout)
			
		case .matrix(matricalLayout: _, columnsPerRow: let columnsPerRow):
			self.layoutMatrically(subviews: subviews, columnsPerRow: columnsPerRow)
		}
		
	}
	
}

