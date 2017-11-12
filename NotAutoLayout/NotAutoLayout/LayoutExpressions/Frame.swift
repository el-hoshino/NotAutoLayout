//
//  Frame.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

struct Frame {
	
	private let evaluation: (_ parameter: LayoutControlParameter, _ fittingCalculation: (CGSize) -> CGSize) -> CGRect
	
}

extension Frame {
	
	init(_ frame: CGRect) {
		self.evaluation = { _, _ in frame }
	}
	
	init(_ frame: @escaping (_ parameter: LayoutControlParameter) -> CGRect) {
		self.evaluation = { parameter, _ in frame(parameter) }
	}
	
	init(_ frame: @escaping (_ parameter: LayoutControlParameter, _ fitting: (CGSize) -> CGSize) -> CGRect) {
		self.evaluation = { parameter, fitting in frame(parameter, fitting) }
	}
	
}

extension Frame {
	
	func evaluated(from parameter: LayoutControlParameter, fitting: (CGSize) -> CGSize) -> CGRect {
		
		return self.evaluation(parameter, fitting)
		
	}
	
}
