//
//  RightBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.RightBottom {
	
	private func makeFrame(right: Float, bottom: Float, size: Size) -> Rect {
		
		let left = right - size.width
		let top = bottom - size.height
		let origin = Point(x: left, y: top)
		let size = size
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.RightBottom: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = self.right.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.RightBottom: LayoutPropertyCanStoreWidthType {
	
	public func storeWidth(_ width: LayoutElement.Length) -> IndividualProperty.RightBottomWidth {
		
		let rightBottomWidth = IndividualProperty.RightBottomWidth(right: self.right,
																   bottom: self.bottom,
																   width: width)
		
		return rightBottomWidth
		
	}
	
}

// MARK: Height
extension IndividualProperty.RightBottom: LayoutPropertyCanStoreHeightType {
	
	public func storeHeight(_ height: LayoutElement.Length) -> IndividualProperty.RightBottomHeight {
		
		let rightBottomHeight = IndividualProperty.RightBottomHeight(right: self.right,
																	 bottom: self.bottom,
																	 height: height)
		
		return rightBottomHeight
		
	}
	
}
