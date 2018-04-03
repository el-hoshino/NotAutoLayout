//
//  DidStoreAllRequiredPropertyLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/01/21.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

typealias DidStoreAllRequiredPropertyLayoutProperty = IndividualProperty.Layout

extension DidStoreAllRequiredPropertyLayoutProperty: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func addEvaluation(_ evaluation: FrameAdditionalEvaluation) -> IndividualProperty.Layout {
		
		var property = self
		property.addAdditionalEvaluation(evaluation)
		
		return property
		
	}
	
}
