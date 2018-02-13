//
//  Frame.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

struct Frame {
	
	private let evaluation: FrameCalculation
	
}

extension Frame {
	
	init(_ frame: CGRect) {
		self.evaluation = { _ in frame }
	}
	
	init(_ frame: @escaping FrameCalculation) {
		self.evaluation = frame
	}
	
}

extension Frame {
	
	func evaluated(from parameters: CalculationParameters) -> CGRect {
		
		return self.evaluation(parameters)
		
	}
	
}
