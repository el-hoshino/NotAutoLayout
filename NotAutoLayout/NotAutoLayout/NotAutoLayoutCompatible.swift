//
//  LayoutContainer.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/14.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol NotAutoLayoutCompatible {
	
	///
	associatedtype NAL
	
	///
	var nal: NAL { get }
	
}

public struct NotAutoLayoutContainer<Containee> {
	
	///
	public let body: Containee
	
}

extension NotAutoLayoutCompatible where Self: UIView {
	
	///
	public var nal: NotAutoLayoutContainer<Self> {
		return NotAutoLayoutContainer(body: self)
	}
	
}

extension UIView: NotAutoLayoutCompatible { }

extension NotAutoLayoutContainer where Containee: UIView {
	
	public enum FrameSetError: Swift.Error {
		case noSuperviewFound
		case superviewIsNotLayoutControllable
	}
	
	public func setFrame(_ frameClosure: @escaping (_ boundSize: CGSize) -> Frame) throws {
		
		guard let superview = self.body.superview else {
			throw FrameSetError.noSuperviewFound
		}
		
		guard let layoutView = superview as? LayoutControllable else {
			throw FrameSetError.superviewIsNotLayoutControllable
		}
		
		let layout = Layout.makeCustom { (boundSize) -> Frame in
			return frameClosure(boundSize)
		}
		
		layoutView.setConstantLayout(layout, for: self.body)
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	public func addSubview(_ subview: UIView, withConstantLayout layout: Layout) {
		self.body.addSubview(subview, constantLayout: layout)
	}
	
}
