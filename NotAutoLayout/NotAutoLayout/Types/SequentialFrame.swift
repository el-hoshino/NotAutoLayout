//
//  SequentialFrame.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

struct SequentialFrame<ParentView: UIView> {
	
	private let evaluation: SequentialFrameCalculation<ParentView>
	
}

extension SequentialFrame {
	
	init(_ frame: @escaping SequentialFrameCalculation<ParentView>) {
		self.evaluation = frame
	}
	
}

extension SequentialFrame {
	
	func evaluated(from parameters: SequentialFrameCalculationParameters<ParentView>) -> [CGRect] {
		
		return self.evaluation(parameters)
		
	}
	
}
