//
//  LayoutControllable.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public protocol LayoutControllable: class {
	
	var layoutingSubviews: [SubviewTuple] { get set }
	
	func layoutSubviews()
	func setNeedsLayout()
	
	func layoutControl()
	func reloadLayoutingSubviews()
	
	func contains(_ subview: UIView) -> Bool
	func index(of subview: UIView) -> Int?
	func setLayoutMethods(_ methods: [LayoutMethod], for subview: UIView)
	func setAlwaysTrueLayoutPosition(_ position: LayoutPosition, for subview: UIView)
	
}

extension LayoutControllable where Self: UIView {
	
	private func place(_ view: UIView, at position: LayoutPosition) {
		
		let rect = position.absoluteRect(in: self.bounds.size)
		view.bounds.size = rect.size
		view.center = rect.centerPosition
		
	}
	
	private func layout(_ viewTuple: SubviewTuple) {
		
		for method in viewTuple.layoutMethods {
			if method.condition(self.bounds.size) == true {
				self.place(viewTuple.view, at: method.position)
			}
		}
		
	}
	
	public func layoutControl() {
		
		self.layoutingSubviews.forEach { (tuple) in
			self.layout(tuple)
		}
		
	}
	
}

extension LayoutControllable where Self: UIView {
	
	private func removeAllSubviews() {
		self.subviews.forEach { (view) in
			view.removeFromSuperview()
		}
	}
	
	private func addLayoutingSubviews() {
		self.layoutingSubviews.forEach { (view, _) in
			self.addSubview(view)
		}
	}
	
	public func reloadLayoutingSubviews() {
		
		self.removeAllSubviews()
		self.addLayoutingSubviews()
		
	}
	
}

extension LayoutControllable where Self: UIView {
	
	public func contains(_ subview: UIView) -> Bool {
		
		let subviewTuple = self.layoutingSubviews.filter { (tuple) -> Bool in
			tuple.view === subview
		}
		
		return !subviewTuple.isEmpty
		
	}
	
	public func index(of subview: UIView) -> Int? {
		
		let tuple = self.layoutingSubviews.enumerated().first { (offset, tuple) -> Bool in
			return tuple.view === subview
		}
		
		return tuple?.offset
		
	}
	
	public func setLayoutMethods(_ methods: [LayoutMethod], for subview: UIView) {
		
		if let index = self.index(of: subview) {
			self.layoutingSubviews[index].layoutMethods = methods
			
		} else {
			self.layoutingSubviews.append((subview, methods))
		}
		
	}
	
	public func setAlwaysTrueLayoutPosition(_ position: LayoutPosition, for subview: UIView) {
		
		let method: LayoutMethod = ({ _ in true }, position)
		
		if let index = self.index(of: subview) {
			self.layoutingSubviews[index].layoutMethods = [method]
			
		} else {
			self.layoutingSubviews.append((subview, [method]))
		}
		
	}
	
	public func appendLayoutPosition(_ position: LayoutPosition, while condition: @escaping LayoutCondition, for subview: UIView) {
		
		let method: LayoutMethod = (condition, position)
		
		if let index = self.index(of: subview) {
			self.layoutingSubviews[index].layoutMethods.append(method)
			
		} else {
			self.layoutingSubviews.append((subview, [method]))
		}
		
	}
	
}
