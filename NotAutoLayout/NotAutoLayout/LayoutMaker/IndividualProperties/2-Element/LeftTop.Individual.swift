//
//  LeftTop.Individual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftTop<ParentView: UIView> {
		
		let left: LayoutElement.Horizontal<ParentView>
		
		let top: LayoutElement.Vertical<ParentView>
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.LeftTop {
	
	private func makeFrame(left: CGFloat, top: CGFloat, size: CGSize) -> CGRect {
		
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.LeftTop: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(left: left, top: top, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.LeftTop: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.LeftTopMiddle
	
	public func storeMiddle <ParentView> (_ middle: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.LeftTop>) -> LayoutMaker<ParentView, IndividualProperty.LeftTopMiddle> {
		
		let leftTopMiddle = IndividualProperty.LeftTopMiddle(left: self.left,
																top: self.top,
																middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftTopMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.LeftTop: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.LeftTopBottom
	
	public func storeBottom <ParentView> (_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.LeftTop>) -> LayoutMaker<ParentView, IndividualProperty.LeftTopBottom> {
		
		let leftTopBottom = IndividualProperty.LeftTopBottom(left: self.left,
																top: self.top,
																bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftTopBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.LeftTop: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.LeftTopWidth
	
	public func storeWidth <ParentView> (_ width: LayoutElement.Length, to maker: LayoutMaker<ParentView, IndividualProperty.LeftTop>) -> LayoutMaker<ParentView, IndividualProperty.LeftTopWidth> {
		
		let leftTopWidth = IndividualProperty.LeftTopWidth(left: self.left,
															  top: self.top,
															  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftTopWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.LeftTop: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.LeftTopHeight
	
	public func storeHeight <ParentView> (_ height: LayoutElement.Length, to maker: LayoutMaker<ParentView, IndividualProperty.LeftTop>) -> LayoutMaker<ParentView, IndividualProperty.LeftTopHeight> {
		
		let leftTopHeight = IndividualProperty.LeftTopHeight(left: self.left,
																top: self.top,
																height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftTopHeight)
		
		return maker
		
	}
	
}
