//
//  LayoutControllable.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public protocol LayoutControllable: class {
	
	var layoutInfo: [UIView: [LayoutMethod]] { get set }
	var zIndexInfo: [UIView: Int] { get set }
	
	func layoutSubviews()
	func setNeedsLayout()
	
	func refreshLayoutInfo()
	func refreshZIndexInfo()
	
	func layoutControl()
	func reloadSubviews()
	
	func setLayoutMethods(_ methods: [LayoutMethod], for subview: UIView)
	func setConstantPosition(_ position: LayoutPosition, for subview: UIView)
	func appendLayoutMethod(_ method: LayoutMethod, for subview: UIView)
	func setSubview(_ subview: UIView, at position: LayoutPosition, while condition: @escaping LayoutCondition)
	
}

extension LayoutControllable where Self: UIView {
	
	public func refreshLayoutInfo() {
		
		var info: [UIView: [LayoutMethod]] = [:]
		
		self.subviews.forEach { (view) in
			info[view] = self.layoutInfo[view]
		}
		
		self.layoutInfo = info
		
	}
	
}

extension LayoutControllable where Self: UIView {
	
	public func refreshZIndexInfo() {
		
		var info: [UIView: Int] = [:]
		
		self.subviews.forEach { (view) in
			info[view] = self.zIndexInfo[view]
		}
		
		self.zIndexInfo = info
		
	}
	
}

extension LayoutControllable where Self: UIView {
	
	private func place(_ view: UIView, at position: LayoutPosition) {
		
		let rect = position.absoluteRect(in: self.bounds.size)
		view.bounds.size = rect.size
		view.center = rect.centerPosition
		
	}
	
	private func layout(_ view: UIView, withMethods methods: [LayoutMethod]) {
		
		if let method = methods.first(where: { $0.condition(self.bounds.size) == true }) {
			self.place(view, at: method.position)
		}
		
	}
	
	public func layoutControl() {
		
		self.subviews.forEach { (view) in
			if let methods = self.layoutInfo[view] {
				self.layout(view, withMethods: methods)
			}
		}
		
	}
	
}

extension LayoutControllable where Self: UIView {
	
	private func getSubviewsSortedByIndex() -> [UIView] {
		
		let subviewTuples = self.subviews.map { (view) -> (view: UIView, index: Int) in
			let index = self.zIndexInfo[view] ?? 0
			return (view, index)
		}
		
		let sortedTuples = subviewTuples.sorted(by: {$0.index < $1.index})
		
		let views = sortedTuples.map({ (view, _) -> UIView in
			return view
		})
		
		return views
		
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
		
		let subviews = self.getSubviewsSortedByIndex()
		self.removeAllSubviews()
		self.addSubviews(subviews)
		
	}
	
}

extension LayoutControllable where Self: UIView {
	
	public func setLayoutMethods(_ methods: [LayoutMethod], for subview: UIView) {
		
		self.layoutInfo[subview] = methods
		
	}
	
	public func setConstantPosition(_ position: LayoutPosition, for subview: UIView) {
		
		let method: LayoutMethod = ({ _ in true }, position)
		
		self.layoutInfo[subview] = [method]
		
	}
	
	public func appendLayoutMethod(_ method: LayoutMethod, for subview: UIView) {
		
		if let methods = self.layoutInfo[subview] {
			self.layoutInfo[subview] = methods + [method]
			
		} else {
			self.layoutInfo[subview] = [method]
		}
		
	}
	
}

extension LayoutControllable where Self: UIView {
	
	public func setSubview(_ subview: UIView, at position: LayoutPosition, while condition: @escaping LayoutCondition) {
		
		let method: LayoutMethod = (condition, position)
		
		self.appendLayoutMethod(method, for: subview)
		
	}
	
}
