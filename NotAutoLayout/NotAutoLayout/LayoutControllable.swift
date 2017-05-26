//
//  LayoutControllable.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

/// Fundamental class-only protocol that handles the layout.
public protocol LayoutControllable: class {
	
	/// Typealias of Int, which is used to store a view's hash value as the keys of layoutInfo, orderInfo and zIndexInfo.
	typealias Hash = Int
	
	/// UIView's subviews property.
	var subviews: [UIView] { get }
	/// UIView's bounds.size property.
	var boundSize: CGSize { get }
	
	/// The property to store the layout information for subviews.
	var layoutInfo: [Hash: [LayoutMethod]] { get set }
	/// The property to store the layout order information for subviews.
	var orderInfo: [Hash: Int] { get set }
	/// The property to store the zIndex information for subviews.
	var zIndexInfo: [Hash: Int] { get set }
	
	/// LayoutOptimization property that is used for some specific layout.
	var layoutOptimization: LayoutOptimization { get }
	
	/// UIView's addSubview(_ subview) method
	///
	/// - Parameter view: subview to add
	func addSubview(_ view: UIView)
	
	/// UIView's layoutSubviews() method
	func layoutSubviews()
	/// UIView's setNeedsLayout() method
	func setNeedsLayout()
	/// UIView's layoutIfNeeded() method
	func layoutIfNeeded()
	
}

extension LayoutControllable {
	
	/// Removes layout information stored in layoutInfo property, that is linked to subviews which are already removed from self.
	public func refreshLayoutInfo() {
		
		var info: [Hash: [LayoutMethod]] = [:]
		
		self.subviews.forEach { (view) in
			info[view.hash] = self.layoutInfo[view.hash]
		}
		
		self.layoutInfo = info
		
	}
	
}

extension LayoutControllable {
	
	/// Removes layout order information stored in orderInfo property, taht is linked to subviews which are already removed from self.
	public func refreshOrderInfo() {
		
		var info: [Hash: Int] = [:]
		
		self.getLayoutRequiredSubviews(sortedByOrder: false).forEach { (view) in
			info[view.hash] = self.orderInfo[view.hash]
		}
		
		self.orderInfo = info
		
	}
	
}

extension LayoutControllable {
	
	/// Removes zIndex information stored in zIndexInfo property, taht is linked to subviews which are already removed from self.
	public func refreshZIndexInfo() {
		
		var info: [Hash: Int] = [:]
		
		self.getLayoutRequiredSubviews(sortedByOrder: false).forEach { (view) in
			info[view.hash] = self.zIndexInfo[view.hash]
		}
		
		self.zIndexInfo = info
		
	}
	
}

extension LayoutControllable {
	
	private func getSortOrder(of view: UIView) -> Int {
		return self.orderInfo[view.hash] ?? 0
	}
	
	/// Gets an array of subviews which have linked layout information.
	///
	/// - Parameter shouldSortSubviews: If set true, the returned array will be sorted by layout order; otherwise, the returned array is in subviews order.
	/// - Returns: An array of subviews which have linked layout information.
	public func getLayoutRequiredSubviews(sortedByOrder shouldSortSubviews: Bool = true) -> [UIView] {
		
		let layoutRequiredSubviews = self.subviews.filter { (view) -> Bool in
			self.layoutInfo.containsKey(view.hash)
		}
				
		if shouldSortSubviews, !self.orderInfo.isEmpty {
			let sortedSubviews = layoutRequiredSubviews.sorted { self.getSortOrder(of: $0) < self.getSortOrder(of: $1) }
			return sortedSubviews
			
		} else {
			return layoutRequiredSubviews
		}
		
	}
	
}

extension LayoutControllable {
	
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

extension LayoutControllable {
	
	fileprivate func getCurrentLayout(of view: UIView) -> Layout? {
		
		let currentMethod = self.layoutInfo[view.hash]?.first { method in
			return method.condition(self.boundSize) == true
		}
		
		return currentMethod?.layout
		
	}
	
}

extension LayoutControllable {
	
	fileprivate func place(_ view: UIView, with bounds: Bounds) {
		
		view.bounds.size = bounds.size
		view.center = bounds.center
		
	}
	
	fileprivate func place(_ view: UIView, with layout: Layout.Individual) {
		
		let bounds = layout.absoluteBounds(of: view, in: self.boundSize)
		self.place(view, with: bounds)
		
	}
	
	fileprivate func place(_ view: UIView, after previousView: UIView?, with layout: Layout.Sequential) {
		
		let bounds = layout.absoluteBounds(of: view, after: previousView, in: self.boundSize)
		self.place(view, with: bounds)
		
	}
	
	fileprivate func place(_ view: UIView, afterCol previousColView: UIView?, afterRow previousRowView: UIView?, with layout: Layout.Matrical) {
		
		let bounds = layout.absoluteBounds(of: view, afterCol: previousColView, afterRow: previousRowView, in: self.boundSize)
		self.place(view, with: bounds)
		
	}
	
}

extension LayoutControllable {
	
	/// Forcedly place a `view` with a specific `frame`.
	///
	/// - Parameters:
	///   - view: The target `UIView`.
	///   - frame: The desired `Frame` for the target `UIView`
	public func place(_ view: UIView, with frame: Frame) {
		
		let anchorPoint = view.layer.anchorPoint
		let bounds = frame.bounds(under: anchorPoint, in: self.boundSize)
		self.place(view, with: bounds)
		
	}
	
}

extension LayoutControllable {
	
	private func getPreviousSequentialView(of view: UIView) -> UIView? {
		
		let subviews = self.getLayoutRequiredSubviews(sortedByOrder: true)
		guard let index = subviews.index(of: view) else { return nil }
		
		let lastSequentialView = subviews.last(before: index) { (view) -> Bool in
			return self.getCurrentLayout(of: view)?.isSequential ?? false
		}
		
		return lastSequentialView
		
	}
	
	private func layout(_ view: UIView, with layout: Layout) {
		
		switch layout {
		case .individual(let layout):
			self.place(view, with: layout)
			
		case .sequential(let layout):
			let previousView = self.getPreviousSequentialView(of: view)
			self.place(view, after: previousView, with: layout)
			
		case .matrical(let layout):
			let previousView = self.getPreviousSequentialView(of: view)
			self.place(view, afterCol: previousView, afterRow: nil, with: layout)
		}
		
	}
	
	fileprivate func layoutNormally(subviews: [UIView]) {
		
		subviews.forEach { (view) in
			if let layout = self.getCurrentLayout(of: view) {
				self.layout(view, with: layout)
			}
		}
		
	}
	
}

extension LayoutControllable {
	
	private func layout(_ view: UIView, after previousView: UIView?, with layout: Layout) {
		
		switch layout {
		case .individual(let layout):
			self.place(view, with: layout)
			
		case .sequential(let layout):
			self.place(view, after: previousView, with: layout)
			
		case .matrical(let layout):
			self.place(view, afterCol: previousView, afterRow: nil, with: layout)
		}
		
	}
	
	fileprivate func layoutSequencially(subviews: [UIView]) {
		
		subviews.forEachPair { (previousView, view) in
			if let bounds = self.getCurrentLayout(of: view) {
				self.layout(view, after: previousView, with: bounds)
			}
		}
		
	}
	
}

extension LayoutControllable {
	
	private func layout(_ view: UIView, afterCol previousColView: UIView?, afterRow previousRowView: UIView?, with layout: Layout) {
		
		switch layout {
		case .individual(let layout):
			self.place(view, with: layout)
			
		case .sequential(let layout):
			self.place(view, after: previousColView, with: layout)
			
		case .matrical(let layout):
			self.place(view, afterCol: previousColView, afterRow: previousRowView, with: layout)
		}
		
	}
	
	fileprivate func layoutMatrically(subviews: [UIView], colsPerRow: Int) {
		
		subviews.forEachCell(underColsPerRow: colsPerRow) { (previousCol, previousRow, view) in
			if let bounds = self.getCurrentLayout(of: view) {
				self.layout(view, afterCol: previousCol, afterRow: previousRow, with: bounds)
			}
		}
		
	}
	
}

extension LayoutControllable {
	
	/// Layout all the subviews which have linked layout information. If you conform your own `UIView` to `LayoutControllable` protocol, call this method inside `layoutSubviews()` method.
	public func layoutControl() {
		
		let subviews = self.getLayoutRequiredSubviews(sortedByOrder: true)
		
		switch self.layoutOptimization {
		case .none:
			self.layoutNormally(subviews: subviews)
			
		case .sequence:
			self.layoutSequencially(subviews: subviews)
			
		case .matrix(colsPerRow: let colsPerRow):
			self.layoutMatrically(subviews: subviews, colsPerRow: colsPerRow)
		}
		
	}
	
}

extension LayoutControllable {
	
	private func getZIndex(of view: UIView) -> Int {
		
		return self.zIndexInfo[view.hash] ?? 0
		
	}
	
	private func getSubviewsSortedByZIndex() -> [UIView] {
		
		guard !self.zIndexInfo.isEmpty else { return self.subviews }
		
		let subviews = self.subviews.sorted { self.getZIndex(of: $0) < self.getZIndex(of: $1) }
		
		return subviews
		
	}
	
	private func removeAllSubviews() {
		
		self.subviews.forEach { (view) in
			view.removeFromSuperview()
		}
		
	}
	
	private func addSubviews(_ views: [UIView]) {
		
		views.forEach { (view) in
			self.addSubview(view)
		}
		
	}
	
	/// Temporarily removes all subviews and re-add them again under zIndex order.
	public func reloadSubviews() {
		
		let subviews = self.getSubviewsSortedByZIndex()
		self.removeAllSubviews()
		self.addSubviews(subviews)
		
	}
	
}

extension LayoutControllable {
	
	/// Link `methods` with a `subview`.
	///
	/// - Parameters:
	///   - methods: An array of `LayoutMethod`.
	///   - subview: The linking target of `methods`.
	public func setLayoutMethods(_ methods: [LayoutMethod], for subview: UIView) {
		
		self.layoutInfo[subview.hash] = methods
		
	}
	
	/// Link a `layout` with a `subview`. If the `subview` already has linked layout information, the old information will be replaced.
	///
	/// - Parameters:
	///   - layout: The constant `Layout`.
	///   - subview: The linking target of `layout`.
	public func setConstantLayout(_ layout: Layout, for subview: UIView) {
		
		let method = LayoutMethod(constantLayout: layout)
		
		self.layoutInfo[subview.hash] = [method]
		
	}
	
	/// Link a `method` with a `subview`. If the `subview` already has linked layout information, this method will be appended to the old information.
	///
	/// - Parameters:
	///   - method: An appending `LayoutMethod`.
	///   - subview: The linking target of `method`.
	public func appendLayoutMethod(_ method: LayoutMethod, for subview: UIView) {
		
		if let methods = self.layoutInfo[subview.hash] {
			self.layoutInfo[subview.hash] = methods + [method]
			
		} else {
			self.layoutInfo[subview.hash] = [method]
		}
		
	}
	
	/// Link a `layout` with a `subview`. If the `subview` already has linked layout information, this `layout` will be appended to the old information.
	///
	/// - Parameters:
	///   - layout: An appending constant `Layout`.
	///   - subview: The linking target of `layout`.
	public func appendConstantLayout(_ layout: Layout, for subview: UIView) {
		
		let method = LayoutMethod(constantLayout: layout)
		
		if let methods = self.layoutInfo[subview.hash] {
			layoutInfo[subview.hash] = methods + [method]
			
		} else {
			self.layoutInfo[subview.hash] = [method]
		}
		
	}
	
}

extension LayoutControllable {
	
	/// Link a `LayoutMethod` made up from `layout` and `condition`, with a `subview`. If the `subview` already has linked layout information, this `LayoutMethod` will be appended to the old information.
	///
	/// - Parameters:
	///   - subview: The linking target of the `LayoutMethod`.
	///   - layout: The `Layout` to initialize a `LayoutMethod`.
	///   - condition: The `Condition` to initialize a `LayoutMethod`.
	public func setLayout(of subview: UIView, with layout: Layout, while condition: @escaping Condition) {
		
		let method = LayoutMethod(condition: condition, layout: layout)
		
		self.appendLayoutMethod(method, for: subview)
		
	}
	
}

extension LayoutControllable {
	
	/// Link the `order` with a `subview`. If the `subview` already has a linked `order`, the old value will be replaced.
	///
	/// - Parameters:
	///   - order: `Int` to represent the layout order of the `subview`.
	///   - subview: The linking target of `order`.
	public func setLayoutOrder(_ order: Int, for subview: UIView) {
		
		self.orderInfo[subview.hash] = order
		
	}
	
}

extension LayoutControllable {
	
	/// Link the zIndex with a `subview`. If the `subview` already has a linked `zIndex`, the old value will be replaced.
	///
	/// - Parameters:
	///   - zIndex: `Int` to represent the zIndex of the `subview`.
	///   - subview: The linking target of `zIndex`.
	public func setZIndex(_ zIndex: Int, for subview: UIView) {
		
		self.zIndexInfo[subview.hash] = zIndex
		
	}
	
}

extension LayoutControllable where Self: UIView {
	
	/// Add `view` to self, and linke the `layoutMethods`, `order` and `zIndex` with that `view`.
	///
	/// - Parameters:
	///   - view: The linking target `UIView`.
	///   - layoutMethods: An array of `LayoutMethod`. If `view` already has linked layout information, the old information will be replaced.
	///   - order: `Int` to represent the layout order of the `subview`.
	///   - zIndex: `Int` to represent the zIndex of the `subview`.
	public func addSubview(_ view: UIView, layoutMethods: [LayoutMethod], order: Int? = nil, zIndex: Int? = nil) {
		
		self.layoutInfo[view.hash] = layoutMethods
		
		if let order = order {
			self.orderInfo[view.hash] = order
		}
		
		if let zIndex = zIndex {
			self.zIndexInfo[view.hash] = zIndex
		}
		
		(self as UIView).addSubview(view)
		
	}
	
	/// Add `view` to self, and linke the `constantLayout`, `order` and `zIndex` with that `view`.
	///
	/// - Parameters:
	///   - view: The linking target `UIView`.
	///   - constantLayout: A constant `Layout`. If `view` already has linked layout information, the old information will be replaced.
	///   - order: `Int` to represent the layout order of the `subview`.
	///   - zIndex: `Int` to represent the zIndex of the `subview`.
	public func addSubview(_ view: UIView, constantLayout: Layout, order: Int? = nil, zIndex: Int? = nil) {
		
		let method = LayoutMethod(constantLayout: constantLayout)
		
		self.addSubview(view, layoutMethods: [method], order: order, zIndex: zIndex)
		
	}
	
}
