//
//  CenterTop.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterTop {
		
		let center: LayoutElement.Horizontal
		
		let top: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.CenterTop {
	
	private func makeFrame(center: Float, top: Float, size: Size) -> Rect {
		
		let left = center - size.width.half
		let origin = Point(x: left, y: top)
		let size = size
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.CenterTop: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let center = self.center.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(center: center, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.CenterTop: LayoutPropertyCanStoreMiddleType {
	
	public func storeMiddle(_ middle: LayoutElement.Vertical) -> IndividualProperty.CenterTopMiddle {
		
		let centerTopMiddle = IndividualProperty.CenterTopMiddle(center: self.center,
																 top: self.top,
																 middle: middle)
		
		return centerTopMiddle
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.CenterTop: LayoutPropertyCanStoreBottomType {
	
	public func storeBottom(_ bottom: LayoutElement.Vertical) -> IndividualProperty.CenterTopBottom {
		
		let centerTopBottom = IndividualProperty.CenterTopBottom(center: self.center,
																 top: self.top,
																 bottom: bottom)
		
		return centerTopBottom
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.CenterTop: LayoutPropertyCanStoreWidthType {
	
	public func storeWidth(_ width: LayoutElement.Length) -> IndividualProperty.CenterTopWidth {
		
		let centerTopWidth = IndividualProperty.CenterTopWidth(center: self.center,
															   top: self.top,
															   width: width)
		
		return centerTopWidth
		
	}
	
}

// MARK: Height
extension IndividualProperty.CenterTop: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.CenterTopHeight
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.CenterTop>) -> LayoutMaker<IndividualProperty.CenterTopHeight> {
		
		let centerTopHeight = IndividualProperty.CenterTopHeight(center: self.center,
																	top: self.top,
																	height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerTopHeight)
		
		return maker
		
	}
	
}
