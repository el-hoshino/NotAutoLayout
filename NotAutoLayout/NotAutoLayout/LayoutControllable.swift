//
//  LayoutControllable.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

/// Fundamental class-only protocol that handles the layout.
public protocol LayoutControllable: class, NotAutoLayoutCompatible {
	
	/// The property to store the layout information for subviews.
	var layoutInfo: [ConditionEnum.RawValue: LayoutInfo] { get set }
	
	/// The property to store the layout order information for subviews.
	var orderInfo: [ConditionEnum.RawValue: OrderInfo] { get set }
	
	/// The property to store the zIndex information for subviews.
	var zIndexInfo: [ConditionEnum.RawValue: ZIndexInfo] { get set }
	
	/// LayoutOptimization property that is used for some specific layout.
	var layoutOptimization: LayoutOptimization { get }
	
	
	///
	func getDefaultCondition() -> ConditionEnum
	
	///
	func getCondition(underCurrentBoundSize boundSize: CGSize) -> ConditionEnum?
	
	/// UIView's layoutSubviews() method
	func layoutSubviews()
	/// UIView's setNeedsLayout() method
	func setNeedsLayout()
	/// UIView's layoutIfNeeded() method
	func layoutIfNeeded()
	
}

// MARK: Default implement for override-able methods
extension LayoutControllable {
	
	public func getDefaultCondition() -> ConditionEnum {
		return DefaultCondition.default
	}
	
	public func getCondition(underCurrentBoundSize boundSize: CGSize) -> ConditionEnum? {
		return nil
	}
	
}

// MARK: Frequently used getters
extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func getCurrentCondition() -> ConditionEnum {
		return self.body.getCondition(underCurrentBoundSize: self.boundSize) ?? self.body.getDefaultCondition()
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func getCurrentLayoutInfo() -> LayoutInfo? {
		
		let currentCondition = self.getCurrentCondition()
		let currentLayoutInfo = self.body.layoutInfo[currentCondition.rawValue]
		return currentLayoutInfo
		
	}
	
	func getCurrentOrderInfo() -> OrderInfo? {
		
		let currentCondition = self.getCurrentCondition()
		let currentOrderInfo = self.body.orderInfo[currentCondition.rawValue]
		return currentOrderInfo
		
	}
	
	func getCurrentZIndexInfo() -> ZIndexInfo? {
		
		let currentCondition = self.getCurrentCondition()
		let currentZIndexInfo = self.body.zIndexInfo[currentCondition.rawValue]
		return currentZIndexInfo
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func getLayout(for view: UIView, from layoutInfo: LayoutInfo) -> Layout.Individual? {
		
		let layout = layoutInfo[view.nal.hash]
		return layout
		
	}
	
	func getOrder(for view: UIView, from orderInfo: OrderInfo) -> Int? {
		
		let order = orderInfo[view.nal.hash]
		return order
		
	}
	
	func getZIndex(for view: UIView, from zIndexInfo: ZIndexInfo) -> Int? {
		
		let zIndex = zIndexInfo[view.nal.hash]
		return zIndex
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func getFactOrder(for view: UIView, from orderInfo: OrderInfo) -> Int {
		
		let order = self.getOrder(for: view, from: orderInfo)
		return order ?? 0
		
	}
	
	func getFactZIndex(for view: UIView, from zIndexInfo: ZIndexInfo) -> Int {
		
		let zIndex = self.getZIndex(for: view, from: zIndexInfo)
		return zIndex ?? 0
		
	}
	
}

// MARK: View Layouting
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
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	fileprivate func place(_ view: UIView, with bounds: Bounds) {
		
		view.bounds.size = bounds.size
		view.center = bounds.center
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	fileprivate func place(_ view: UIView, with layout: Layout.Individual) {
		
		let frame = layout.evaluatedFrame(in: self.boundSize)
		self.place(view, with: frame)
		
	}
	
	fileprivate func place(_ view: UIView, after previousView: UIView?, with layout: Layout.Sequential) {
		
		fatalError("Not implemented yet")
		
	}
	
	fileprivate func place(_ view: UIView, afterCol previousColView: UIView?, afterRow previousRowView: UIView?, with layout: Layout.Matrical) {
		
		fatalError("Not implemented yet")
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	fileprivate func layoutNormally(subviews: [UIView]) {
		
		guard let layoutInfo = self.getCurrentLayoutInfo() else {
			return
		}
		
		subviews.forEach { (view) in
			if let layout = self.getLayout(for: view, from: layoutInfo) {
				self.place(view, with: layout)
			}
		}
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	fileprivate func layoutSequencially(subviews: [UIView]) {
		
		fatalError("Not implemented yet")
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	fileprivate func layoutMatrically(subviews: [UIView], colsPerRow: Int) {
		
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

// MARK: Ordering
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

// MARK: ZIndexing
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

// MARK: Internal APIs
extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func appendLayout(_ layout: Layout.Individual, under condition: ConditionEnum, for subview: UIView) {
		
		let condition = condition.rawValue
		let newInfo: LayoutInfo = [subview.nal.hash: layout]
		self.body.layoutInfo[condition, default: [:]].append(newInfo)
		
	}
	
	func setDefaultLayout(_ layout: Layout.Individual, for subview: UIView) {
		
		let condition = self.body.getDefaultCondition().rawValue
		let newInfo: LayoutInfo = [subview.nal.hash: layout]
		self.body.layoutInfo[condition, default: [:]].append(newInfo)
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func appendLayoutOrder(_ order: Int, under condition: ConditionEnum, for subview: UIView) {
		
		let condition = condition.rawValue
		let newInfo: OrderInfo = [subview.nal.hash: order]
		self.body.orderInfo[condition, default: [:]].append(newInfo)
		
	}
	
	func setDefaultLayoutOrder(_ order: Int, for subview: UIView) {
		
		let condition = self.body.getDefaultCondition().rawValue
		let newInfo: OrderInfo = [subview.nal.hash: order]
		self.body.orderInfo[condition, default: [:]].append(newInfo)
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	func appendZIndex(_ index: Int, under condition: ConditionEnum, for subview: UIView) {
		
		let condition = condition.rawValue
		let newInfo: ZIndexInfo = [subview.nal.hash: index]
		self.body.zIndexInfo[condition, default: [:]].append(newInfo)
		
	}
	
	func setDefaultZIndex(_ zIndex: Int, for subview: UIView) {
		
		let condition = self.body.getDefaultCondition().rawValue
		let newInfo: ZIndexInfo = [subview.nal.hash: zIndex]
		self.body.orderInfo[condition, default: [:]].append(newInfo)
		
	}
	
}

// MARK: Public APIs
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
