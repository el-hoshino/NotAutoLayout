//
//  UIView.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/05/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public struct NotAutoLayoutContainer<Containee> {
	
	///
	public let body: Containee
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	typealias Hash = Int
	
	var hash: Hash {
		return self.body.hash
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView {
	
	public var viewFrameProperty: ViewFrameProperty {
		return ViewFrameProperty(parentView: self.body, currentView: nil)
	}
	
	public func viewFrameProperty(forChild childView: UIView?) -> ViewFrameProperty {
		return ViewFrameProperty(parentView: self.body, currentView: childView)
	}
	
	/// The bound size.
	public var boundSize: CGSize {
		return self.viewFrameProperty.boundSize
	}
	
	@available(iOS 11.0, *)
	public var safeAreaInsets: UIEdgeInsets {
		return self.viewFrameProperty.safeAreaInsets
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
	
	public func frame(thatIgnoresTransform ignoresTransform: Bool) -> CGRect {
		
		if ignoresTransform {
			return self.identityFrame
			
		} else {
			return self.body.frame
		}
		
	}
	
}
