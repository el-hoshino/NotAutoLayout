//
//  RightBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct RightBottom<ParentView: UIView> {
		
		let right: LayoutElement.Horizontal<ParentView>
		
		let bottom: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.RightBottom: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.RightBottom {
	
	private func makeFrame(right: CGFloat, bottom: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let top = bottom - size.height
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.RightBottom: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let right = self.right.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.RightBottom: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.RightBottomWidth<ParentView>
	
	public func storeWidth(_ width: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.RightBottom<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.RightBottomWidth<ParentView>> {
		
		let rightBottomWidth = IndividualProperty.RightBottomWidth(right: self.right,
																	  bottom: self.bottom,
																	  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightBottomWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.RightBottom: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.RightBottomHeight<ParentView>
	
	public func storeHeight(_ height: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.RightBottom<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.RightBottomHeight<ParentView>> {
		
		let rightBottomHeight = IndividualProperty.RightBottomHeight(right: self.right,
																		bottom: self.bottom,
																		height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightBottomHeight)
		
		return maker
		
	}
	
}
