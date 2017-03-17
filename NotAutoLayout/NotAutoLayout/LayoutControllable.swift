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
		
		self.subviews.forEach { (view) in
			info[view.hash] = self.zIndexInfo[view.hash]
		}
		
		self.zIndexInfo = info
		
	}
	
}

extension LayoutControllable {
	
	public func refreshOrderInfo() {
		
		var info: [Hash: Int] = [:]
		
		self.subviews.forEach { (view) in
			info[view.hash] = self.orderInfo[view.hash]
		}
		
		self.orderInfo = info
		
	}
	
}

extension LayoutControllable {
	
	private func getSortOrder(of view: UIView) -> Int {
		return self.orderInfo[view.hash] ?? 0
	}
	
	private func getSubviewsSortedByOrder() -> [UIView] {
		
		guard !self.orderInfo.isEmpty else { return self.subviews }
		
		let subviews = self.subviews.sorted { self.getSortOrder(of: $0) < self.getSortOrder(of: $1) }
		
		return subviews
		
	}
	
	private func place(_ view: UIView, at position: LayoutPosition) {
		
		let positionRect = position.absolutePosition(in: self.boundSize)
		view.bounds.size = positionRect.size
		view.center = positionRect.center
		
	}
	
	private func layout(_ view: UIView, withMethods methods: [LayoutMethod]) {
		
		if let method = methods.first(where: { $0.condition(self.boundSize) == true }) {
			self.place(view, at: method.position)
		}
		
	}
	
	public func layoutControl() {
		
		let subviews = self.getSubviewsSortedByOrder()
		
		subviews.forEach { (view) in
			if let methods = self.layoutInfo[view.hash] {
				self.layout(view, withMethods: methods)
			}
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
	
	public func addSubview(_ view: UIView, withAssociatedLayoutMethods methods: [LayoutMethod]? = nil, andZIndex zIndex: Int? = nil) {
		
		if let methods = methods {
			self.layoutInfo[view.hash] = methods
		}

		if let zIndex = zIndex {
			self.zIndexInfo[view.hash] = zIndex
		}
		
		(self as UIView).addSubview(view)
		
	}
	
	public func addSubview(_ view: UIView, withAssociatedConstantPosition position: LayoutPosition, andZIndex zIndex: Int? = nil) {
		
		let method = LayoutMethod(constantPosition: position)
		self.layoutInfo[view.hash] = [method]
		
		if let zIndex = zIndex {
			self.zIndexInfo[view.hash] = zIndex
		}
		
		(self as UIView).addSubview(view)
		
	}
	
}
