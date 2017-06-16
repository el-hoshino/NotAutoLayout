//
//  UIView.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/05/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

extension NotAutoLayoutContainer where Containee: UIView {
	
	public typealias Hash = Int
	
	public var hash: Hash {
		return self.body.hash
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	/// The bound size.
	public var boundSize: CGSize {
		return self.body.bounds.size
	}
	
}

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
	
	func layout(in layoutInfo: LayoutInfo) -> Layout.Individual? {
		return layoutInfo[self.hash]
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	func order(in orderInfo: OrderInfo) -> Int? {
		return orderInfo[self.hash]
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	func zIndex(in zIndexInfo: ZIndexInfo) -> Int? {
		return zIndexInfo[self.hash]
	}
	
}
