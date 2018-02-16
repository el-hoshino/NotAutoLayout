//
//  CenterTop.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterTop<ParentView: UIView> {
		
		let center: LayoutElement.Horizontal<ParentView>
		
		let top: LayoutElement.Vertical<ParentView>
		
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
	
	public typealias WillSetMiddleProperty = IndividualProperty.CenterTopMiddle
	
	public func storeMiddle <ParentView> (_ middle: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.CenterTop>) -> LayoutMaker<ParentView, IndividualProperty.CenterTopMiddle> {
		
		let centerTopMiddle = IndividualProperty.CenterTopMiddle(center: self.center,
																	top: self.top,
																	middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerTopMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.CenterTop: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.CenterTopBottom
	
	public func storeBottom <ParentView> (_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.CenterTop>) -> LayoutMaker<ParentView, IndividualProperty.CenterTopBottom> {
		
		let centerTopBottom = IndividualProperty.CenterTopBottom(center: self.center,
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
	
	public typealias WillSetWidthProperty = IndividualProperty.CenterTopWidth
	
	public func storeWidth <ParentView> (_ width: LayoutElement.Length, to maker: LayoutMaker<ParentView, IndividualProperty.CenterTop>) -> LayoutMaker<ParentView, IndividualProperty.CenterTopWidth> {
		
		let centerTopWidth = IndividualProperty.CenterTopWidth(center: self.center,
																  top: self.top,
																  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerTopWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.CenterTop: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.CenterTopHeight
	
	public func storeHeight <ParentView> (_ height: LayoutElement.Length, to maker: LayoutMaker<ParentView, IndividualProperty.CenterTop>) -> LayoutMaker<ParentView, IndividualProperty.CenterTopHeight> {
		
		let centerTopHeight = IndividualProperty.CenterTopHeight(center: self.center,
																	top: self.top,
																	height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerTopHeight)
		
		return maker
		
	}
	
}
