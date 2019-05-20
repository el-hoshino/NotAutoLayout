//
//  Initial.Sequential.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension SequentialProperty {
	
	public struct Initial {
		
	}
	
}

// MARK: - Set A Point -
extension SequentialProperty.Initial: LayoutPropertyCanStoreMiddleType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> SequentialProperty.Middle {
		
		let middle = SequentialProperty.Middle(middle: middle)
		
		return middle
		
	}
	
}
