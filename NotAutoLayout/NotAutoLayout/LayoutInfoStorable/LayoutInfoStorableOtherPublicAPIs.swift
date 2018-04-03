//
//  LayoutControllableOtherPublicAPIs.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	public func getCurrentCondition() -> ConditionEnum {
		return self.body.getCondition(underCurrentBoundSize: self.body.bounds.size) ?? self.body.getDefaultCondition()
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	public func getCurrentLayoutInfo() -> LayoutInfo? {
		
		let currentCondition = self.getCurrentCondition()
		let currentLayoutInfo = self.body.layoutInfo[currentCondition.rawValue]
		return currentLayoutInfo
		
	}
	
	public func getDefaultLayoutInfo() -> LayoutInfo? {
		
		let defaultCondition = self.body.getDefaultCondition()
		let defaultLayoutInfo = self.body.layoutInfo[defaultCondition.rawValue]
		return defaultLayoutInfo
		
	}
	
	public func getCurrentLayout(for view: UIView) -> IndividualProperty.Layout? {
		
		if let layoutInfo = self.getCurrentLayoutInfo(), let layout = layoutInfo[view] {
			return layout
			
		} else if let layoutInfo = self.getDefaultLayoutInfo(), let layout = layoutInfo[view] {
			return layout
			
		} else {
			return nil
		}
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	public func getCurrentOrderInfo() -> OrderInfo? {
		
		let currentCondition = self.getCurrentCondition()
		let currentOrderInfo = self.body.orderInfo[currentCondition.rawValue]
		return currentOrderInfo
		
	}
	
	public func getDefaultOrderInfo() -> OrderInfo? {
		
		let defaultCondition = self.body.getDefaultCondition()
		let currentOrderInfo = self.body.orderInfo[defaultCondition.rawValue]
		return currentOrderInfo
		
	}
	
	public func getCurrentOrder(for view: UIView) -> Int? {
		
		if let orderInfo = self.getCurrentOrderInfo(), let order = orderInfo[view] {
			return order
			
		} else if let orderInfo = self.getDefaultOrderInfo(), let order = orderInfo[view] {
			return order
			
		} else {
			return nil
		}
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	public func getCurrentZIndexInfo() -> ZIndexInfo? {
		
		let currentCondition = self.getCurrentCondition()
		let currentZIndexInfo = self.body.zIndexInfo[currentCondition.rawValue]
		return currentZIndexInfo
		
	}
	
	public func getDefaultZIndexInfo() -> ZIndexInfo? {
		
		let defaultCondition = self.body.getDefaultCondition()
		let currentZIndexInfo = self.body.zIndexInfo[defaultCondition.rawValue]
		return currentZIndexInfo
		
	}
	
	public func getCurrentZIndex(for view: UIView) -> Int? {
		
		if let zIndexInfo = self.getCurrentZIndexInfo(), let zIndex = zIndexInfo[view] {
			return zIndex
			
		} else if let zIndexInfo = self.getDefaultZIndexInfo(), let zIndex = zIndexInfo[view] {
			return zIndex
			
		} else {
			return nil
		}
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	public func layout(_ subview: UIView) {
		
		if let layout = self.getCurrentLayout(for: subview) {
			self.layout(subview, with: layout)
		}
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	/// Gets an array of subviews which have linked layout information.
	///
	/// - Parameter shouldSortSubviews: If set true, the returned array will be sorted by layout order; otherwise, the returned array is in subviews order.
	/// - Returns: An array of subviews which have linked layout information.
	public func getLayoutRequiredSubviews(sortedByOrder shouldSortSubviews: Bool = true) -> [UIView] {
		
		guard let currentLayoutInfo = self.getCurrentLayoutInfo() else {
			return []
		}
		
		guard let defaultLayoutInfo = self.getDefaultLayoutInfo() else {
			return []
		}
		
		let layoutRequiredSubviews = self.body.subviews.filter { (view) -> Bool in
			currentLayoutInfo.containsInfo(for: view) || defaultLayoutInfo.containsInfo(for: view)
		}
		
		if shouldSortSubviews, let orderInfo = self.getCurrentOrderInfo() {
			let sortedSubviews = layoutRequiredSubviews.sorted {
				return orderInfo[$0, default: 0] < orderInfo[$1, default: 0]
			}
			return sortedSubviews
			
		} else {
			return layoutRequiredSubviews
		}
		
	}
	
	public func getSubviews(sortedByOrder shouldSortSubviews: Bool = false) -> [UIView] {
		
		if shouldSortSubviews == true, let orderInfo = self.getCurrentOrderInfo() {
			let sortedSubviews = self.body.subviews.sorted {
				return orderInfo[$0, default: 0] < orderInfo[$1, default: 0]
			}
			return sortedSubviews
			
		} else {
			return self.body.subviews
		}
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
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

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	private func getSubviewsSortedByZIndex() -> [UIView] {
		
		let subviews = self.body.subviews
		
		guard let zIndexInfo = self.getCurrentZIndexInfo() else {
			return subviews
		}
		
		let sortedSubviews = subviews.sorted {
			zIndexInfo[$0, default: 0] < zIndexInfo[$1, default: 0]
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

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	public func setupSubview(_ subview: UIView, setup: (SubviewSetupWizard<Containee>) -> SubviewSetupWizard<Containee>) {
		
		let setupWizard = SubviewSetupWizard(parent: self.body, settee: subview)
		let result = setup(setupWizard)
		
		result.commit()
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	public func addSubview(_ subview: UIView, withDefaultLayout layout: IndividualProperty.Layout) {
		
		self.setupSubview(subview) { (wizard) in wizard
			.setDefaultLayout(to: layout)
			.addToParent()
		}
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutInfoStorable {
	
	public func setLayout(for subview: UIView, making: (_ maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.Layout>) {
		
		self.setupSubview(subview) { (wizard) in wizard
			.setDefaultLayout(making)
		}
		
	}
	
}

