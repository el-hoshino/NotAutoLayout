//
//  RightMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct RightMiddle {
		
		let right: LayoutElement.Horizontal
		
		let middle: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.RightMiddle {
	
	private func makeFrame(right: CGFloat, middle: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let top = middle - size.height.halved
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.RightMiddle: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let right = self.right.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension IndividualProperty.RightMiddle: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreRightMiddleBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.RightMiddle>) -> LayoutMaker<DidStoreRightMiddleBottomLayoutProperty> {
		
		let rightMiddleBottom = DidStoreRightMiddleBottomLayoutProperty(right: self.right,
																		middle: self.middle,
																		bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightMiddleBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.RightMiddle: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreRightMiddleWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.RightMiddle>) -> LayoutMaker<DidStoreRightMiddleWidthLayoutProperty> {
		
		let rightMiddleWidth = DidStoreRightMiddleWidthLayoutProperty(right: self.right,
																	  middle: self.middle,
																	  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightMiddleWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.RightMiddle: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreRightMiddleHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.RightMiddle>) -> LayoutMaker<DidStoreRightMiddleHeightLayoutProperty> {
		
		let rightMiddleHeight = DidStoreRightMiddleHeightLayoutProperty(right: self.right,
																		middle: self.middle,
																		height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightMiddleHeight)
		
		return maker
		
	}
	
}
