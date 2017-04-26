//
//  LayoutControllable.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public protocol LayoutControllable: class {
	
	typealias Hash = Int
	
	var subviews: [UIView] { get }
	var boundSize: CGSize { get }
	
	var layoutInfo: [Hash: [LayoutMethod]] { get set }
	var orderInfo: [Hash: Int] { get set }
	var zIndexInfo: [Hash: Int] { get set }
	
	var layoutOptimization: LayoutOptimization { get }
	
	func addSubview(_ view: UIView)
	
	func layoutSubviews()
	func setNeedsLayout()
	
}

extension LayoutControllable {
	
	public func refreshLayoutInfo() {
		
		var info: [Hash: [LayoutMethod]] = [:]
		
		self.subviews.forEach { (view) in
			info[view.hash] = self.layoutInfo[view.hash]
		}
		
		self.layoutInfo = info
		
	}
	
}

extension LayoutControllable {
	
	public func refreshZIndexInfo() {
		
		var info: [Hash: Int] = [:]
		
		self.getLayoutRequiredSubviews().forEach { (view) in
			info[view.hash] = self.zIndexInfo[view.hash]
		}
		
		self.zIndexInfo = info
		
	}
	
}

extension LayoutControllable {
	
	public func refreshOrderInfo() {
		
		var info: [Hash: Int] = [:]
		
		self.getLayoutRequiredSubviews().forEach { (view) in
			info[view.hash] = self.orderInfo[view.hash]
		}
		
		self.orderInfo = info
		
	}
	
}

extension LayoutControllable {
	
	private func getSortOrder(of view: UIView) -> Int {
		return self.orderInfo[view.hash] ?? 0
	}
	
	public func getLayoutRequiredSubviews(sortedByOrder shouldSortSubviews: Bool = false) -> [UIView] {
		
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
	
	public func getLayoutRequiredSubviewsTotalFrame() -> CGRect {
		
		let subviews = self.getLayoutRequiredSubviews()
		
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
	
	fileprivate func place(_ view: UIView, afterRow previousRowView: UIView?, afterCol previousColView: UIView?, with layout: Layout.Matrical) {
		
		let bounds = layout.absoluteBounds(of: view, afterRow: previousRowView, afterCol: previousColView, in: self.boundSize)
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
			let previousRowView = self.getPreviousSequentialView(of: view)
			self.place(view, afterRow: previousRowView, afterCol: nil, with: layout)
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
			self.place(view, afterRow: previousView, afterCol: nil, with: layout)
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
	
	private func layout(_ view: UIView, afterRow previousRowView: UIView?, afterCol previousColView: UIView?, with layout: Layout) {
		
		switch layout {
		case .individual(let layout):
			self.place(view, with: layout)
			
		case .sequential(let layout):
			self.place(view, after: previousColView, with: layout)
			
		case .matrical(let layout):
			self.place(view, afterRow: previousRowView, afterCol: previousColView, with: layout)
		}
		
	}
	
	fileprivate func layoutMatrically(subviews: [UIView], colsPerRow: Int) {
		
		subviews.forEachCell(underColsPerRow: colsPerRow) { (previousRow, previousCol, view) in
			if let bounds = self.getCurrentLayout(of: view) {
				self.layout(view, afterRow: previousRow, afterCol: previousCol, with: bounds)
			}
		}
		
	}
	
}

extension LayoutControllable {
	
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
	
	public func place(_ view: UIView, with frame: Frame) {
		
		let bounds = frame.bounds(in: self.boundSize)
		self.place(view, with: bounds)
		
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
	
	public func reloadSubviews() {
		
		let subviews = self.getSubviewsSortedByZIndex()
		self.removeAllSubviews()
		self.addSubviews(subviews)
		
	}
	
}

extension LayoutControllable {
	
	public func setLayoutMethods(_ methods: [LayoutMethod], for subview: UIView) {
		
		self.layoutInfo[subview.hash] = methods
		
	}
	
	public func setConstantLayout(_ layout: Layout, for subview: UIView) {
		
		let method = LayoutMethod(constantLayout: layout)
		
		self.layoutInfo[subview.hash] = [method]
		
	}
	
	public func appendLayoutMethod(_ method: LayoutMethod, for subview: UIView) {
		
		if let methods = self.layoutInfo[subview.hash] {
			self.layoutInfo[subview.hash] = methods + [method]
			
		} else {
			self.layoutInfo[subview.hash] = [method]
		}
		
	}
	
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
	
	public func setLayout(of subview: UIView, with layout: Layout, while condition: @escaping Condition) {
		
		let method = LayoutMethod(condition: condition, layout: layout)
		
		self.appendLayoutMethod(method, for: subview)
		
	}
	
}

extension LayoutControllable {
	
	public func setZIndex(_ zIndex: Int, for subview: UIView) {
		
		self.zIndexInfo[subview.hash] = zIndex
		
	}
	
}

extension LayoutControllable where Self: UIView {
	
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
	
	public func addSubview(_ view: UIView, constantLayout: Layout, order: Int? = nil, zIndex: Int? = nil) {
		
		let method = LayoutMethod(constantLayout: constantLayout)
		
		self.addSubview(view, layoutMethods: [method], order: order, zIndex: zIndex)
		
	}
	
}
