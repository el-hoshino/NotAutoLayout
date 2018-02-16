//
//  CenterMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterMiddle<ParentView: UIView> {
		
		let center: LayoutElement.Horizontal<ParentView>
		
		let middle: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.CenterMiddle: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.CenterMiddle {
	
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
extension IndividualProperty.CenterMiddle: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let center = self.center.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(center: center, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension IndividualProperty.CenterMiddle: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.CenterMiddleBottom<ParentView>
	
	public func storeBottom(_ bottom: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.CenterMiddle<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.CenterMiddleBottom<ParentView>> {
		
		let centerMiddleBottom = IndividualProperty.CenterMiddleBottom(center: self.center,
																		  middle: self.middle,
																		  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerMiddleBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.CenterMiddle: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.CenterMiddleWidth<ParentView>
	
	public func storeWidth(_ width: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.CenterMiddle<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.CenterMiddleWidth<ParentView>> {
		
		let centerMiddleWidth = IndividualProperty.CenterMiddleWidth(center: self.center,
																		middle: self.middle,
																		width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerMiddleWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.CenterMiddle: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.CenterMiddleHeight<ParentView>
	
	public func storeHeight(_ height: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.CenterMiddle<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.CenterMiddleHeight<ParentView>> {
		
		let centerMiddleHeight = IndividualProperty.CenterMiddleHeight(center: self.center,
																		  middle: self.middle,
																		  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerMiddleHeight)
		
		return maker
		
	}
	
}
