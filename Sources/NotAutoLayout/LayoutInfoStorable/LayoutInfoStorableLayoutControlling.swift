//
//  LayoutInfoStorableLayoutControlling.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

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
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	/// Layout all the subviews which have linked layout information. If you conform your own `UIView` to `LayoutInfoStorable` protocol, call this method inside `layoutSubviews()` method.
	public func layoutSubviews() {
		
		let subviews = self.getSubviews(sortedByOrder: true)
		
		self.layoutNormally(subviews: subviews)
		
	}
	
}

