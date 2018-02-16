//
//  LeftMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftMiddle {
		
		let left: LayoutElement.Horizontal
		
		let middle: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.LeftMiddle {
	
	private func makeFrame(left: CGFloat, middle: CGFloat, size: CGSize) -> CGRect {
		
		let top = middle - size.height.halved
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.LeftMiddle: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(left: left, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension IndividualProperty.LeftMiddle: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.LeftMiddleBottom
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.LeftMiddle>) -> LayoutMaker<IndividualProperty.LeftMiddleBottom> {
		
		let leftMiddleBottom = IndividualProperty.LeftMiddleBottom(left: self.left,
																	  middle: self.middle,
																	  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftMiddleBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.LeftMiddle: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.LeftMiddleWidth
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.LeftMiddle>) -> LayoutMaker<IndividualProperty.LeftMiddleWidth> {
		
		let leftMiddleWidth = IndividualProperty.LeftMiddleWidth(left: self.left,
																	middle: self.middle,
																	width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftMiddleWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.LeftMiddle: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.LeftMiddleHeight
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.LeftMiddle>) -> LayoutMaker<IndividualProperty.LeftMiddleHeight> {
		
		let leftMiddleHeight = IndividualProperty.LeftMiddleHeight(left: self.left,
																	  middle: self.middle,
																	  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftMiddleHeight)
		
		return maker
		
	}
	
}
