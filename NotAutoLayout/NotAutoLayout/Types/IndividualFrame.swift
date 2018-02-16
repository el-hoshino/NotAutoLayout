//
//  Frame.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

struct IndividualFrame<ParentView: UIView> {
	
	private let evaluation: IndividualFrameCalculation<ParentView>
	
}

extension IndividualFrame {
	
	init(_ frame: CGRect) {
		self.evaluation = { _ in frame }
	}
	
	init(_ frame: @escaping IndividualFrameCalculation<ParentView>) {
		self.evaluation = frame
	}
	
}

extension IndividualFrame {
	
	func evaluated(from parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		return self.evaluation(parameters)
		
	}
	
}
