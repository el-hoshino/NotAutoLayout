//
//  DidStoreAllRequiredPropertyLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/01/21.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

typealias DidStoreAllRequiredPropertyLayoutMaker = Layout

extension DidStoreAllRequiredPropertyLayoutMaker: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func addEvaluation(_ evaluation: FrameAdditionalEvaluation, to maker: LayoutMaker<Layout>) -> LayoutMaker<Layout> {
		
		var property = self
		property.addAdditionalEvaluation(evaluation)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: property)
		
		return maker
		
	}
	
}
