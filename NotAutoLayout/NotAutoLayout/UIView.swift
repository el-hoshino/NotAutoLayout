//
//  UIView.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/05/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit


extension NotAutoLayoutContainer where Containee: UIView {
	
	public var identityFrame: CGRect {
		
		let body = self.body
		
		if body.transform.isIdentity {
			return body.frame
			
		} else {
			let anchorPoint = body.layer.anchorPoint
			let x = body.center.x - (body.bounds.width * anchorPoint.x)
			let y = body.center.y - (body.bounds.height * anchorPoint.y)
			let origin = CGPoint(x: x, y: y)
			let size = body.bounds.size
			let frame = CGRect(origin: origin, size: size)
			return frame
			
		}
		
	}
	
}

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

