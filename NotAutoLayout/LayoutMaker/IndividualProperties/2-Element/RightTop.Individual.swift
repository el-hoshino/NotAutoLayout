//
//  RightTop.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// MARK: - Make Frame
extension IndividualProperty.RightTop {
	
	private func makeFrame(right: Float, top: Float, size: Size) -> Rect {
		
		let left = right - size.width
		let origin = Point(x: left, y: top)
		let size = size
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.RightTop: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = self.right.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.RightTop: LayoutPropertyCanStoreMiddleType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> IndividualProperty.RightTopMiddle {
		
		let rightTopMiddle = IndividualProperty.RightTopMiddle(right: self.right,
															   top: self.top,
															   middle: middle)
		
		return rightTopMiddle
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.RightTop: LayoutPropertyCanStoreBottomType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> IndividualProperty.RightTopBottom {
		
		let rightTopBottom = IndividualProperty.RightTopBottom(right: self.right,
															   top: self.top,
															   bottom: bottom)
		
		return rightTopBottom
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.RightTop: LayoutPropertyCanStoreWidthType {
	
	public func storeWidth(_ width: LayoutElement.Length) -> IndividualProperty.RightTopWidth {
		
		let rightTopWidth = IndividualProperty.RightTopWidth(right: self.right,
															 top: self.top,
															 width: width)
		
		return rightTopWidth
		
	}
	
}

// MARK: Height
extension IndividualProperty.RightTop: LayoutPropertyCanStoreHeightType {
	
	public func storeHeight(_ height: LayoutElement.Length) -> IndividualProperty.RightTopHeight {
		
		let rightTopHeight = IndividualProperty.RightTopHeight(right: self.right,
															   top: self.top,
															   height: height)
		
		return rightTopHeight
		
	}
	
}
