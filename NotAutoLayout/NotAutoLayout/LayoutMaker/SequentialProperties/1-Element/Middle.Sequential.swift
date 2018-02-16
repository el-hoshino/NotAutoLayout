//
//  Middle.Sequential.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension SequentialProperty {
	
	public struct Middle<ParentView: UIView> {
		
		let middle: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension SequentialProperty.Middle: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Set A Size -
extension SequentialProperty.Middle: LayoutPropertyCanStoreSizeType {
	
	public typealias WillSetSizeProperty = SequentialProperty.MiddleSize<ParentView>
	
	public func storeSize(_ size: LayoutElement.Size<ParentView>, to maker: LayoutMaker<ParentView, SequentialProperty.Middle<ParentView>>) -> LayoutMaker<ParentView, SequentialProperty.MiddleSize<ParentView>> {
		
		let centerSize = SequentialProperty.MiddleSize(middle: self.middle,
													   subviewSize: size)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerSize)
		
		return maker
		
	}
	
}
