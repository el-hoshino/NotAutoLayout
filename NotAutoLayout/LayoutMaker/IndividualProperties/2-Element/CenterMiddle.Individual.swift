//
//  CenterMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.CenterMiddle {
	
	private func makeFrame(center: Float, middle: Float, size: Size) -> Rect {
		
		let left = center - size.width.half
		let top = middle - size.height.half
		let origin = Point(x: left, y: top)
		let size = size
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.CenterMiddle: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(center: center, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension IndividualProperty.CenterMiddle: LayoutPropertyCanStoreBottomType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> IndividualProperty.CenterMiddleBottom {
		
		let centerMiddleBottom = IndividualProperty.CenterMiddleBottom(center: self.center,
																	   middle: self.middle,
																	   bottom: bottom)
		
		return centerMiddleBottom
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.CenterMiddle: LayoutPropertyCanStoreWidthType {
	
	public func storeWidth(_ width: LayoutElement.Length) -> IndividualProperty.CenterMiddleWidth {
		
		let centerMiddleWidth = IndividualProperty.CenterMiddleWidth(center: self.center,
																	 middle: self.middle,
																	 width: width)
		
		return centerMiddleWidth
		
	}
	
}

// MARK: Height
extension IndividualProperty.CenterMiddle: LayoutPropertyCanStoreHeightType {
	
	public func storeHeight(_ height: LayoutElement.Length) -> IndividualProperty.CenterMiddleHeight {
		
		let centerMiddleHeight = IndividualProperty.CenterMiddleHeight(center: self.center,
																	   middle: self.middle,
																	   height: height)
		
		return centerMiddleHeight
		
	}
	
}
