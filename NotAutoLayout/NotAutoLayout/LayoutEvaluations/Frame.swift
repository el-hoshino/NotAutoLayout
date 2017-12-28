//
//  Frame.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

struct Frame {
	
	private let evaluation: (_ property: ViewFrameProperty, _ fittingCalculation: (CGSize) -> CGSize) -> CGRect
	
}

extension Frame {
	
	init(_ frame: CGRect) {
		self.evaluation = { _, _ in frame }
	}
	
	init(_ frame: @escaping (_ property: ViewFrameProperty) -> CGRect) {
		self.evaluation = { property, _ in frame(property) }
	}
	
	init(_ frame: @escaping (_ property: ViewFrameProperty, _ fitting: (CGSize) -> CGSize) -> CGRect) {
		self.evaluation = { property, fitting in frame(property, fitting) }
	}
	
}

extension Frame {
	
	func evaluated(from property: ViewFrameProperty, fitting: (CGSize) -> CGSize) -> CGRect {
		
		return self.evaluation(property, fitting)
		
	}
	
}
