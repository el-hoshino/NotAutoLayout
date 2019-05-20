//
//  RightMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.RightMiddle {
	
	private func makeFrame(right: Float, middle: Float, size: Size) -> Rect {
		
		let left = right - size.width
		let top = middle - size.height.half
		let origin = Point(x: left, y: top)
		let size = size
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.RightMiddle: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = self.right.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension IndividualProperty.RightMiddle: LayoutPropertyCanStoreBottomType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> IndividualProperty.RightMiddleBottom {
		
		let rightMiddleBottom = IndividualProperty.RightMiddleBottom(right: self.right,
																	 middle: self.middle,
																	 bottom: bottom)
		
		return rightMiddleBottom
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.RightMiddle: LayoutPropertyCanStoreWidthType {
	
	public func storeWidth(_ width: LayoutElement.Length) -> IndividualProperty.RightMiddleWidth {
		
		let rightMiddleWidth = IndividualProperty.RightMiddleWidth(right: self.right,
																   middle: self.middle,
																   width: width)
		
		return rightMiddleWidth
		
	}
	
}

// MARK: Height
extension IndividualProperty.RightMiddle: LayoutPropertyCanStoreHeightType {
	
	public func storeHeight(_ height: LayoutElement.Length) -> IndividualProperty.RightMiddleHeight {
		
		let rightMiddleHeight = IndividualProperty.RightMiddleHeight(right: self.right,
																	 middle: self.middle,
																	 height: height)
		
		return rightMiddleHeight
		
	}
	
}
