//
//  Middle.Sequential.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension SequentialProperty {
	
	public struct Middle {
		
		let middle: LayoutElement.Vertical
		
	}
	
}

// MARK: - Set A Size -
extension SequentialProperty.Middle: LayoutPropertyCanStoreSizeType {
	
	public func storeSize(_ size: LayoutElement.Size) -> SequentialProperty.MiddleSize {
		
		let centerSize = SequentialProperty.MiddleSize(middle: self.middle,
													   subviewSize: size)
		
		return centerSize
		
	}
	
}
