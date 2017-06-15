//
//  UIView.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/05/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

extension UIView {
	
	public var identityTransformedFrame: CGRect {
		
		if self.transform.isIdentity {
			return self.frame
			
		} else {
			let anchorPoint = self.layer.anchorPoint
			let x = self.center.x - (self.bounds.width * anchorPoint.x)
			let y = self.center.y - (self.bounds.height * anchorPoint.y)
			let origin = CGPoint(x: x, y: y)
			let size = self.bounds.size
			let frame = CGRect(origin: origin, size: size)
			return frame
			
		}
		
	}
	
}
