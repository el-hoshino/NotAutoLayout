//
//  Span.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/12/23.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct Span {
	
	var start: CGFloat
	
	var width: CGFloat
	
}

extension Span {
	
	init(horizontalFrom cgRect: CGRect) {
		
		self.start = cgRect.x
		
		self.width = cgRect.width
		
	}
	
}

extension Span {
	
	init(verticalFrom cgRect: CGRect) {
		
		self.start = cgRect.y
		
		self.width = cgRect.height
		
	}
	
}

extension Span {
	
	static let zero: Span = .init(start: 0, width: 0)
	
}

extension Span {
	
	var half: CGFloat {
		return self.geometry(at: 0.5)
	}
	
	var end: CGFloat {
		return self.geometry(at: 1)
	}
	
	func geometry(at coordinate: CGFloat) -> CGFloat {
		return self.start + (self.width * coordinate)
	}
	
}
