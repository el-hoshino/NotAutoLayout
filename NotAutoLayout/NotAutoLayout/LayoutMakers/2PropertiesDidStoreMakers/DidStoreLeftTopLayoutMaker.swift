//
//  DidStoreLeftTopLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreLeftTopLayoutProperty {
	
	let left: LayoutElement.Horizontal
	
	let top: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreLeftTopLayoutProperty {
	
	private func makeFrame(left: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension DidStoreLeftTopLayoutProperty: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty) -> CGRect {
		
		let left = self.left.evaluated(from: property)
		let top = self.top.evaluated(from: property)
		let size = size.evaluated(from: property)
		
		return self.makeFrame(left: left, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension DidStoreLeftTopLayoutProperty: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = DidStoreLeftTopMiddleLayoutProperty
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreLeftTopLayoutProperty>) -> LayoutMaker<DidStoreLeftTopMiddleLayoutProperty> {
		
		let leftTopMiddle = DidStoreLeftTopMiddleLayoutProperty(left: self.left,
																top: self.top,
																middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftTopMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension DidStoreLeftTopLayoutProperty: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = DidStoreLeftTopBottomLayoutProperty
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<DidStoreLeftTopLayoutProperty>) -> LayoutMaker<DidStoreLeftTopBottomLayoutProperty> {
		
		let leftTopBottom = DidStoreLeftTopBottomLayoutProperty(left: self.left,
																top: self.top,
																bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftTopBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreLeftTopLayoutProperty: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = DidStoreLeftTopWidthLayoutProperty
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<DidStoreLeftTopLayoutProperty>) -> LayoutMaker<DidStoreLeftTopWidthLayoutProperty> {
		
		let leftTopWidth = DidStoreLeftTopWidthLayoutProperty(left: self.left,
															  top: self.top,
															  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftTopWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension DidStoreLeftTopLayoutProperty: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = DidStoreLeftTopHeightLayoutProperty
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<DidStoreLeftTopLayoutProperty>) -> LayoutMaker<DidStoreLeftTopHeightLayoutProperty> {
		
		let leftTopHeight = DidStoreLeftTopHeightLayoutProperty(left: self.left,
																top: self.top,
																height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftTopHeight)
		
		return maker
		
	}
	
}
