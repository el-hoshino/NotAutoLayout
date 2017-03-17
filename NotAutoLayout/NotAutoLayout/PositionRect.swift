//
//  PositionRect.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/02/23.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

struct PositionRect {
	
	var center: CGPoint
	var size: CGSize
	
}

extension PositionRect {
	
	init(centerX: CGFloat, centerY: CGFloat, width: CGFloat, height: CGFloat) {
		let center = CGPoint(x: centerX, y: centerY)
		let size = CGSize(width: width, height: height)
		self.center = center
		self.size = size
	}
	
}

extension PositionRect {
	
	init(frame: CGRect) {
		let centerX = frame.midX
		let centerY = frame.midY
		let center = CGPoint(x: centerX, y: centerY)
		self.center = center
		self.size = frame.size
	}
	
}
