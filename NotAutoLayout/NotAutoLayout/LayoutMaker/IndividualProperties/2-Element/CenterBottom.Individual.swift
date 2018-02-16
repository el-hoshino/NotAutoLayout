//
//  CenterBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterBottom<ParentView: UIView> {
		
		let center: LayoutElement.Horizontal<ParentView>
		
		let bottom: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.CenterBottom: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.CenterBottom {
	
	private func makeFrame(center: CGFloat, bottom: CGFloat, size: CGSize) -> CGRect {
		
		let left = center - size.width.halved
		let top = bottom - size.height
		let origin = CGPoint(x: left, y: top)
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.CenterBottom: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let center = self.center.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(center: center, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.CenterBottom: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.CenterBottomWidth<ParentView>
	
	public func storeWidth(_ width: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.CenterBottom<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.CenterBottomWidth<ParentView>> {
		
		let centerBottomWidth = IndividualProperty.CenterBottomWidth(center: self.center,
																		bottom: self.bottom,
																		width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerBottomWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.CenterBottom: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.CenterBottomHeight<ParentView>
	
	public func storeHeight(_ height: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.CenterBottom<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.CenterBottomHeight<ParentView>> {
		
		let centerBottomHeight = IndividualProperty.CenterBottomHeight(center: self.center,
																		  bottom: self.bottom,
																		  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: centerBottomHeight)
		
		return maker
		
	}
	
}
