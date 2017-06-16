//
//  LayoutControllableOtherPublicAPIs.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	/// Gets an array of subviews which have linked layout information.
	///
	/// - Parameter shouldSortSubviews: If set true, the returned array will be sorted by layout order; otherwise, the returned array is in subviews order.
	/// - Returns: An array of subviews which have linked layout information.
	public func getLayoutRequiredSubviews(sortedByOrder shouldSortSubviews: Bool = true) -> [UIView] {
		
		guard let currentLayoutInfo = self.getCurrentLayoutInfo() else {
			return []
		}
		
		let layoutRequiredSubviews = self.body.subviews.filter { (view) -> Bool in
			currentLayoutInfo.containsKey(view.nal.hash)
		}
		
		if shouldSortSubviews, let orderInfo = self.getCurrentOrderInfo() {
			let sortedSubviews = layoutRequiredSubviews.sorted {
				self.getFactOrder(for: $0, from: orderInfo) <
					self.getFactOrder(for: $1, from: orderInfo)
			}
			return sortedSubviews
			
		} else {
			return layoutRequiredSubviews
		}
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	/// Gets a CGRect that represents the whole frame combined with all the subviews which have linked layout information, which may be useful in some situations like to setup contentSize in UIScrollView.
	///
	/// - Returns: A CGRect value that represents the whole frame of layout required subviews.
	public func getLayoutRequiredSubviewsTotalFrame() -> CGRect {
		
		let subviews = self.getLayoutRequiredSubviews(sortedByOrder: false)
		
		let insets = subviews.reduce(nil) { (result, subview) -> UIEdgeInsets? in
			
			if let result = result {
				let top = min(result.top, subview.frame.minY)
				let left = min(result.left, subview.frame.minX)
				let bottom = max(result.bottom, subview.frame.maxY)
				let right = max(result.right, subview.frame.maxX)
				let result = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
				return result
				
			} else {
				let top = subview.frame.minY
				let left = subview.frame.minX
				let bottom = subview.frame.maxY
				let right = subview.frame.maxX
				let result = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
				return result
			}
			
		}
		
		guard let resultInsets = insets else {
			return .zero
		}
		
		let x = resultInsets.left
		let y = resultInsets.top
		let width = resultInsets.right - resultInsets.left
		let height = resultInsets.bottom - resultInsets.top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	private func getSubviewsSortedByZIndex() -> [UIView] {
		
		let subviews = self.body.subviews
		
		guard let zIndexInfo = self.getCurrentZIndexInfo() else {
			return subviews
		}
		
		let sortedSubviews = subviews.sorted {
			self.getFactZIndex(for: $0, from: zIndexInfo) <
				self.getFactZIndex(for: $1, from: zIndexInfo)
		}
		
		return sortedSubviews
		
	}
	
	private func removeAllSubviews() {
		
		self.body.subviews.forEach { (view) in
			view.removeFromSuperview()
		}
		
	}
	
	private func addSubviews(_ views: [UIView]) {
		
		views.forEach { (view) in
			self.body.addSubview(view)
		}
		
	}
	
	/// Temporarily removes all subviews and re-add them again under zIndex order.
	public func reloadSubviews() {
		
		let subviews = self.getSubviewsSortedByZIndex()
		self.removeAllSubviews()
		self.addSubviews(subviews)
		
	}
	
}
