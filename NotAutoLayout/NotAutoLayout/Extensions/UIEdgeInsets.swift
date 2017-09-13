//
//  UIEdgeInsets.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/13.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension UIEdgeInsets {
	
	var width: CGFloat {
		return self.left + self.right
	}
	
	var height: CGFloat {
		return self.top + self.bottom
	}
	
}
