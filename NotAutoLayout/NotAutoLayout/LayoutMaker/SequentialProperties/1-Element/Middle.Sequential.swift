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
	
	public typealias WillSetSizeProperty = SequentialProperty.MiddleSize
	
	public func storeSize(_ size: LayoutElement.Size, to maker: LayoutMaker<SequentialProperty.Middle>) -> LayoutMaker<SequentialProperty.MiddleSize> {
		
		let centerSize = SequentialProperty.MiddleSize(middle: self.middle,
													   subviewSize: size)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerSize)
		
		return maker
		
	}
	
}
