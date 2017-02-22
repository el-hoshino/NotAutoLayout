//
//  CGRect.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension CGRect {
	
	var centerPosition: CGPoint {
		
		let x = self.origin.x + (self.width / 2)
		let y = self.origin.y + (self.height / 2)
		
		return CGPoint(x: x, y: y)
		
	}
	
}
