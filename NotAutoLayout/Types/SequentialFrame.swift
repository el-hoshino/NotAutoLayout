//
//  SequentialFrame.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

struct SequentialFrame {
	
	private let evaluation: SequentialFrameCalculation
	
}

extension SequentialFrame {
	
	init(_ frame: @escaping SequentialFrameCalculation) {
		self.evaluation = frame
	}
	
}

extension SequentialFrame {
	
	func evaluated(from parameters: SequentialFrameCalculationParameters) -> [Rect] {
		
		return self.evaluation(parameters)
		
	}
	
}
