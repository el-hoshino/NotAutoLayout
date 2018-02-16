//
//  LeftBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftBottom<ParentView: UIView> {
		
		let left: LayoutElement.Horizontal<ParentView>
		
		let bottom: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.LeftBottom: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.LeftBottom {
	
	private func makeFrame(left: CGFloat, bottom: CGFloat, size: CGSize) -> CGRect {
		
		let top = bottom - size.height
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.LeftBottom: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(left: left, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.LeftBottom: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.LeftBottomWidth<ParentView>
	
	public func storeWidth(_ width: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.LeftBottom<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.LeftBottomWidth<ParentView>> {
		
		let leftBottomWidth = IndividualProperty.LeftBottomWidth(left: self.left,
																	bottom: self.bottom,
																	width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftBottomWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.LeftBottom: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.LeftBottomHeight<ParentView>
	
	public func storeHeight(_ height: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.LeftBottom<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.LeftBottomHeight<ParentView>> {
		
		let leftBottomHeight = IndividualProperty.LeftBottomHeight(left: self.left,
																	  bottom: self.bottom,
																	  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftBottomHeight)
		
		return maker
		
	}
	
}
