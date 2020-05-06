//
//  Bounds.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/02/23.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation
import CoreGraphics

struct Bounds {
	
	var center: CGPoint
	var size: CGSize
	
}

extension Bounds {
	
	init(centerX: CGFloat, centerY: CGFloat, width: CGFloat, height: CGFloat) {
		let center = CGPoint(x: centerX, y: centerY)
		let size = CGSize(width: width, height: height)
		self.center = center
		self.size = size
	}
	
}

extension Bounds {
	
	init(frame: CGRect, anchorPoint: CGPoint) {
		let centerX = frame.origin.x + (frame.width * anchorPoint.x)
		let centerY = frame.origin.y + (frame.height * anchorPoint.y)
		let center = CGPoint(x: centerX, y: centerY)
		self.center = center
		self.size = frame.size
	}
	
}
