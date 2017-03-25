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
	
	fileprivate func getCurrentLayoutPosition(of view: UIView) -> LayoutPosition? {
		
		let currentMethod = self.layoutInfo[view.hash]?.first { method in
			return method.condition(self.boundSize) == true
		}
		
		return currentMethod?.position
		
	}
	
}

extension LayoutControllable {
	
	fileprivate func place(_ view: UIView, at position: Position) {
		
		view.bounds.size = position.size
		view.center = position.center
		
	}
	
	fileprivate func place(_ view: UIView, at position: LayoutPosition.Individual) {
		
		let position = position.absolutePosition(of: view, in: self.boundSize)
		self.place(view, at: position)
		
	}
	
	fileprivate func place(_ view: UIView, after previousView: UIView?, at position: LayoutPosition.Sequential) {
		
		let position = position.absolutePosition(of: view, after: previousView, in: self.boundSize)
		self.place(view, at: position)
		
	}
	
	fileprivate func place(_ view: UIView, afterRow previousRowView: UIView?, afterCol previousColView: UIView?, at position: LayoutPosition.Matrical) {
		
		let position = position.absolutePosition(of: view, afterRow: previousRowView, afterCol: previousColView, in: self.boundSize)
		self.place(view, at: position)
		
	}
	
}

extension LayoutControllable {
	
	private func getPreviousSequentialView(of view: UIView) -> UIView? {
		
		let subviews = self.getLayoutRequiredSubviews(sortedByOrder: true)
		guard let index = subviews.index(of: view) else { return nil }
		
		let lastSequentialView = subviews.last(before: index) { (view) -> Bool in
			return self.getCurrentLayoutPosition(of: view)?.isSequential ?? false
		}
		
		return lastSequentialView
		
	}
	
	private func layout(_ view: UIView, withPosition position: LayoutPosition) {
		
		switch position {
		case .individual(let position):
			self.place(view, at: position)
			
		case .sequential(let position):
			let previousView = self.getPreviousSequentialView(of: view)
			self.place(view, after: previousView, at: position)
			
		case .matrical(let position):
			let previousRowView = self.getPreviousSequentialView(of: view)
			self.place(view, afterRow: previousRowView, afterCol: nil, at: position)
		}
		
	}
	
	fileprivate func layoutNormally(subviews: [UIView]) {
		
		subviews.forEach { (view) in
			if let position = self.getCurrentLayoutPosition(of: view) {
				self.layout(view, withPosition: position)
			}
		}
		
	}
	
}

extension LayoutControllable {
	
	private func layout(_ view: UIView, after previousView: UIView?, withPosition position: LayoutPosition) {
		
		switch position {
		case .individual(let position):
			self.place(view, at: position)
			
		case .sequential(let position):
			self.place(view, after: previousView, at: position)
			
		case .matrical(let position):
			self.place(view, afterRow: previousView, afterCol: nil, at: position)
		}
		
	}
	
	fileprivate func layoutSequencially(subviews: [UIView]) {
		
		subviews.forEachPair { (previousView, view) in
			if let position = self.getCurrentLayoutPosition(of: view) {
				self.layout(view, after: previousView, withPosition: position)
			}
		}
		
	}
	
}

extension LayoutControllable {
	
	private func layout(_ view: UIView, afterRow previousRowView: UIView?, afterCol previousColView: UIView?, withPosition position: LayoutPosition) {
		
		switch position {
		case .individual(let position):
			self.place(view, at: position)
			
		case .sequential(let position):
			self.place(view, after: previousColView, at: position)
			
		case .matrical(let position):
			self.place(view, afterRow: previousRowView, afterCol: previousColView, at: position)
		}
		
	}
	
	fileprivate func layoutMatrically(subviews: [UIView], colsPerRow: Int) {
		
		subviews.forEachCell(underColsPerRow: colsPerRow) { (previousRow, previousCol, view) in
			if let position = self.getCurrentLayoutPosition(of: view) {
				self.layout(view, afterRow: previousRow, afterCol: previousCol, withPosition: position)
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
	
	public func setConstantPosition(_ position: LayoutPosition, for subview: UIView) {
		
		let method = LayoutMethod(constantPosition: position)
		
		self.layoutInfo[subview.hash] = [method]
		
	}
	
	public func appendLayoutMethod(_ method: LayoutMethod, for subview: UIView) {
		
		if let methods = self.layoutInfo[subview.hash] {
			self.layoutInfo[subview.hash] = methods + [method]
			
		} else {
			self.layoutInfo[subview.hash] = [method]
		}
		
	}
	
	public func appendConstantPosition(_ position: LayoutPosition, for subview: UIView) {
		
		let method = LayoutMethod(constantPosition: position)
		
		if let methods = self.layoutInfo[subview.hash] {
			layoutInfo[subview.hash] = methods + [method]
			
		} else {
			self.layoutInfo[subview.hash] = [method]
		}
		
	}
	
}

extension LayoutControllable {
	
	public func setLayout(of subview: UIView, at position: LayoutPosition, while condition: @escaping LayoutCondition) {
		
		let method = LayoutMethod(condition: condition, position: position)
		
		self.appendLayoutMethod(method, for: subview)
		
	}
	
}

extension LayoutControllable {
	
	public func setZIndex(_ zIndex: Int, for subview: UIView) {
		
		self.zIndexInfo[subview.hash] = zIndex
		
	}
	
}

extension LayoutControllable where Self: UIView {
	
	@available(*, deprecated: 0.10.0, message: "Use LayoutControllable#addSubview(_: layoutMethods: order: zIndex:) instead.")
	public func addSubview(_ view: UIView, withAssociatedLayoutMethods methods: [LayoutMethod]? = nil, andZIndex zIndex: Int? = nil) {
		
		if let methods = methods {
			self.layoutInfo[view.hash] = methods
		}

		if let zIndex = zIndex {
			self.zIndexInfo[view.hash] = zIndex
		}
		
		(self as UIView).addSubview(view)
		
	}
	
	@available(*, deprecated: 0.10.0, message: "Use LayoutControllable#addSubview(_: constantPosition: order: zIndex:) instead.")
	public func addSubview(_ view: UIView, withAssociatedConstantPosition position: LayoutPosition, andZIndex zIndex: Int? = nil) {
		
		let method = LayoutMethod(constantPosition: position)
		self.layoutInfo[view.hash] = [method]
		
		if let zIndex = zIndex {
			self.zIndexInfo[view.hash] = zIndex
		}
		
		(self as UIView).addSubview(view)
		
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
	
	public func addSubview(_ view: UIView, constantPosition: LayoutPosition, order: Int? = nil, zIndex: Int? = nil) {
		
		let method = LayoutMethod(constantPosition: constantPosition)
		
		self.addSubview(view, layoutMethods: [method], order: order, zIndex: zIndex)
		
	}
	
}
