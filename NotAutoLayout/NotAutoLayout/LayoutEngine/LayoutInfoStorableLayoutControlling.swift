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

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	/// Layout all the subviews which have linked layout information. If you conform your own `UIView` to `LayoutInfoStorable` protocol, call this method inside `layoutSubviews()` method.
	public func layoutSubviews() {
		
		let subviews = self.getLayoutRequiredSubviews(sortedByOrder: true)
		
		switch self.body.layoutOptimization {
		case .none:
			self.layoutNormally(subviews: subviews)
			
		case .sequence:
			self.layoutSequencially(subviews: subviews)
			
		case .matrix(defaultLayout: _, colsPerRow: let colsPerRow):
			self.layoutMatrically(subviews: subviews, colsPerRow: colsPerRow)
		}
		
	}
	
}

