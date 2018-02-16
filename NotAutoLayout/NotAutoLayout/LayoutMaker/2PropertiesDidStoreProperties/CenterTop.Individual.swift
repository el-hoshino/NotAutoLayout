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
	
	private func makeFrame(center: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let left = center - size.width.halved
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.CenterTop: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let center = self.center.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(center: center, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.CenterTop: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreCenterTopMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.CenterTop>) -> LayoutMaker<DidStoreCenterTopMiddleLayoutProperty> {
		
		let centerTopMiddle = DidStoreCenterTopMiddleLayoutProperty(center: self.center,
																	top: self.top,
																	middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerTopMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.CenterTop: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreCenterTopBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.CenterTop>) -> LayoutMaker<DidStoreCenterTopBottomLayoutProperty> {
		
		let centerTopBottom = DidStoreCenterTopBottomLayoutProperty(center: self.center,
																	top: self.top,
																	bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerTopBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.CenterTop: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreCenterTopWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.CenterTop>) -> LayoutMaker<DidStoreCenterTopWidthLayoutProperty> {
		
		let centerTopWidth = DidStoreCenterTopWidthLayoutProperty(center: self.center,
																  top: self.top,
																  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerTopWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.CenterTop: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreCenterTopHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.CenterTop>) -> LayoutMaker<DidStoreCenterTopHeightLayoutProperty> {
		
		let centerTopHeight = DidStoreCenterTopHeightLayoutProperty(center: self.center,
																	top: self.top,
																	height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerTopHeight)
		
		return maker
		
	}
	
}
