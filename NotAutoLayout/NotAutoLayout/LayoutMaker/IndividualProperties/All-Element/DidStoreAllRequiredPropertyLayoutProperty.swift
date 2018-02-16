//
//  DidStoreAllRequiredPropertyLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/01/21.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

typealias DidStoreAllRequiredPropertyLayoutMaker = IndividualLayout

extension DidStoreAllRequiredPropertyLayoutMaker: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func addEvaluation <ParentView> (_ evaluation: FrameAdditionalEvaluation, to maker: LayoutMaker<ParentView, IndividualLayout>) -> LayoutMaker<ParentView, IndividualLayout> {
		
		var property = self
		property.addAdditionalEvaluation(evaluation)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: property)
		
		return maker
		
	}
	
}
