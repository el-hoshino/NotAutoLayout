//
//  LayoutViewPosition.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/02/09.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension LayoutView {
	
	public enum Position {
		case absolute(CGRect)
		case relative(CGRect)
	}
	
}

extension LayoutView.Position {
	
	func absoluteRect(in size: CGSize) -> CGRect {
		
		switch self {
		case .absolute(let rect):
			return rect
			
		case .relative(let rect):
			return rect.absoluteRectApplied(to: size)
		}
		
	}
	
}
