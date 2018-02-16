//
//  LeftBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftBottom {
		
		let left: LayoutElement.Horizontal
		
		let bottom: LayoutElement.Vertical
		
	}
	
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
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(left: left, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.LeftBottom: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.LeftBottomWidth
	
	public func storeWidth <ParentView> (_ width: LayoutElement.Length, to maker: LayoutMaker<ParentView, IndividualProperty.LeftBottom>) -> LayoutMaker<ParentView, IndividualProperty.LeftBottomWidth> {
		
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
	
	public typealias WillSetHeightProperty = IndividualProperty.LeftBottomHeight
	
	public func storeHeight <ParentView> (_ height: LayoutElement.Length, to maker: LayoutMaker<ParentView, IndividualProperty.LeftBottom>) -> LayoutMaker<ParentView, IndividualProperty.LeftBottomHeight> {
		
		let leftBottomHeight = IndividualProperty.LeftBottomHeight(left: self.left,
																	  bottom: self.bottom,
																	  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftBottomHeight)
		
		return maker
		
	}
	
}
