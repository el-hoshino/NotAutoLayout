//
//  Frame.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

struct Frame {
	
	private let evaluation: (_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ parameter: LayoutControlParameter) -> CGRect
	
}

extension Frame {
	
	init(_ frame: CGRect) {
		self.evaluation = { _, _ in frame }
	}
	
	init(_ frame: @escaping (_ parameter: LayoutControlParameter) -> CGRect) {
		self.evaluation = { _, parameter in frame(parameter) }
	}
	
	init(_ frame: @escaping (_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ parameter: LayoutControlParameter) -> CGRect) {
		self.evaluation = frame
	}
	
}

extension Frame {
	
	func frame(fittedBy fitting: (_ fittingSize: CGSize) -> CGSize, with parameter: LayoutControlParameter) -> CGRect {
		
		return self.evaluation(fitting, parameter)
		
	}
	
}
