//
//  RightTop.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct RightTop {
		
		let right: LayoutElement.Horizontal
		
		let top: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.RightTop {
	
	private func makeFrame(right: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let left = right - size.width
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.RightTop: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let right = self.right.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(right: right, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.RightTop: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.RightTopMiddle
	
	public func storeMiddle(_ middle: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.RightTop>) -> LayoutMaker<IndividualProperty.RightTopMiddle> {
		
		let rightTopMiddle = IndividualProperty.RightTopMiddle(right: self.right,
																  top: self.top,
																  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightTopMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.RightTop: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.RightTopBottom
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.RightTop>) -> LayoutMaker<IndividualProperty.RightTopBottom> {
		
		let rightTopBottom = IndividualProperty.RightTopBottom(right: self.right,
																  top: self.top,
																  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightTopBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.RightTop: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.RightTopWidth
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.RightTop>) -> LayoutMaker<IndividualProperty.RightTopWidth> {
		
		let rightTopWidth = IndividualProperty.RightTopWidth(right: self.right,
																top: self.top,
																width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightTopWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.RightTop: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.RightTopHeight
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.RightTop>) -> LayoutMaker<IndividualProperty.RightTopHeight> {
		
		let rightTopHeight = IndividualProperty.RightTopHeight(right: self.right,
																  top: self.top,
																  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: rightTopHeight)
		
		return maker
		
	}
	
}
