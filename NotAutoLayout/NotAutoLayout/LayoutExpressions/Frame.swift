//
//  Frame.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

enum Frame {
	
	case constant(CGRect)
	case basicEvaluation((_ parameter: LayoutControlParameter) -> CGRect)
	case fittingEvaluation((_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ parameter: LayoutControlParameter) -> CGRect)
	
}

extension Frame {
	
	func frame(fittedBy fitting: (_ fittingSize: CGSize) -> CGSize, with parameter: LayoutControlParameter) -> CGRect {
		
		switch self {
		case .constant(let frame):
			return frame
			
		case .basicEvaluation(let frame):
			return frame(parameter)
			
		case .fittingEvaluation(let frame):
			return frame(fitting, parameter)
		}
		
	}
	
}
