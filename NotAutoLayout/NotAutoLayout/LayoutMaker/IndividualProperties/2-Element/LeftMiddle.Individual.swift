//
//  LeftMiddle.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftMiddle<ParentView: UIView> {
		
		let left: LayoutElement.Horizontal<ParentView>
		
		let middle: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.LeftMiddle: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.LeftMiddle {
	
	private func makeFrame(left: CGFloat, middle: CGFloat, size: CGSize) -> CGRect {
		
		let top = middle - size.height.halved
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.LeftMiddle: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let middle = self.middle.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(left: left, middle: middle, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Bottom
extension IndividualProperty.LeftMiddle: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.LeftMiddleBottom<ParentView>
	
	public func storeBottom(_ bottom: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.LeftMiddle<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.LeftMiddleBottom<ParentView>> {
		
		let leftMiddleBottom = IndividualProperty.LeftMiddleBottom(left: self.left,
																	  middle: self.middle,
																	  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftMiddleBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.LeftMiddle: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.LeftMiddleWidth<ParentView>
	
	public func storeWidth(_ width: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.LeftMiddle<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.LeftMiddleWidth<ParentView>> {
		
		let leftMiddleWidth = IndividualProperty.LeftMiddleWidth(left: self.left,
																	middle: self.middle,
																	width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftMiddleWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.LeftMiddle: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.LeftMiddleHeight<ParentView>
	
	public func storeHeight(_ height: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.LeftMiddle<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.LeftMiddleHeight<ParentView>> {
		
		let leftMiddleHeight = IndividualProperty.LeftMiddleHeight(left: self.left,
																	  middle: self.middle,
																	  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: leftMiddleHeight)
		
		return maker
		
	}
	
}
