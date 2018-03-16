//
//  Frame.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

struct IndividualFrame {
	
	private let evaluation: IndividualFrameCalculation
	
}

extension IndividualFrame {
	
	init(_ frame: Rect) {
		self.evaluation = { _ in frame }
	}
	
	init(_ frame: @escaping IndividualFrameCalculation) {
		self.evaluation = frame
	}
	
}

extension IndividualFrame {
	
	func evaluated(from parameters: IndividualFrameCalculationParameters) -> Rect {
		
		return self.evaluation(parameters)
		
	}
	
}
