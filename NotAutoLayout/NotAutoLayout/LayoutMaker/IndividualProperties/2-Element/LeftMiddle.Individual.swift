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
	
	private func makeFrame(left: Float, middle: Float, size: Size) -> Rect {
		
		let top = middle - size.height.half
		let origin = Point(x: left, y: top)
		let size = size
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.LeftMiddle: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(left: left, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension IndividualProperty.LeftMiddle: LayoutPropertyCanStoreBottomType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> IndividualProperty.LeftMiddleBottom {
		
		let leftMiddleBottom = IndividualProperty.LeftMiddleBottom(left: self.left,
																   middle: self.middle,
																   bottom: bottom)
		
		return leftMiddleBottom
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.LeftMiddle: LayoutPropertyCanStoreWidthType {
	
	public func storeWidth(_ width: LayoutElement.Length) -> IndividualProperty.LeftMiddleWidth {
		
		let leftMiddleWidth = IndividualProperty.LeftMiddleWidth(left: self.left,
																 middle: self.middle,
																 width: width)
		
		return leftMiddleWidth
		
	}
	
}

// MARK: Height
extension IndividualProperty.LeftMiddle: LayoutPropertyCanStoreHeightType {
	
	public func storeHeight(_ height: LayoutElement.Length) -> IndividualProperty.LeftMiddleHeight {
		
		let leftMiddleHeight = IndividualProperty.LeftMiddleHeight(left: self.left,
																   middle: self.middle,
																   height: height)
		
		return leftMiddleHeight
		
	}
	
}
