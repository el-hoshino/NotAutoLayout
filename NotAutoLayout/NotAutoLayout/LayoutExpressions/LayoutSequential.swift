//
//  LayoutSequential.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/18.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct SequentialLayout {
	
	private var firstLayout: Layout
	
	private var restLayoutEvaluations: [FrameAdditionalEvaluation]
	
	private init(frame: CGRect, offset: CGPoint) {
		
		self.firstLayout = Layout.makeAbsolute(frame: frame)
		
		self.restLayoutEvaluations = Layout.dummy.editing({ $0.movingOrigin(by: offset) }).frameAdditionalEvaluations
		
	}
	
}
