//
//  CGRect.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/02/09.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension CGRect {
	
	func absoluteRectApplied(to size: CGSize) -> CGRect {
		return CGRect(x: self.origin.x * size.width, y: self.origin.y * size.height, width: self.width * size.width, height: self.height * size.height)
	}
	
}
