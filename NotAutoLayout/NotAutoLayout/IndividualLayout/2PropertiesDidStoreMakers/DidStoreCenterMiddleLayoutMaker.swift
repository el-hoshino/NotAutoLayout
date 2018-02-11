//
//  DidStoreCenterMiddleLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreCenterMiddleLayoutProperty {
	
	let center: LayoutElement.Horizontal
	
	let middle: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreCenterMiddleLayoutProperty {
	
	private func makeFrame(center: CGFloat, middle: CGFloat, size: CGSize) -> CGRect {
		
		let left = center - size.width.halved
		let top = middle - size.height.halved
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreCenterMiddleLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty) -> CGRect {
		
		let center = self.center.evaluated(from: property)
		let middle = self.middle.evaluated(from: property)
		let size = size.evaluated(from: property)
		
		return self.makeFrame(center: center, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension DidStoreCenterMiddleLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreCenterMiddleBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreCenterMiddleLayoutProperty>) -> LayoutMaker<DidStoreCenterMiddleBottomLayoutProperty> {
		
		let centerMiddleBottom = DidStoreCenterMiddleBottomLayoutProperty(center: self.center,
																		  middle: self.middle,
																		  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerMiddleBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreCenterMiddleLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreCenterMiddleWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<DidStoreCenterMiddleLayoutProperty>) -> LayoutMaker<DidStoreCenterMiddleWidthLayoutProperty> {
		
		let centerMiddleWidth = DidStoreCenterMiddleWidthLayoutProperty(center: self.center,
																		middle: self.middle,
																		width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerMiddleWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension DidStoreCenterMiddleLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreCenterMiddleHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<DidStoreCenterMiddleLayoutProperty>) -> LayoutMaker<DidStoreCenterMiddleHeightLayoutProperty> {
		
		let centerMiddleHeight = DidStoreCenterMiddleHeightLayoutProperty(center: self.center,
																		  middle: self.middle,
																		  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerMiddleHeight)
		
		return maker
		
	}
	
}
