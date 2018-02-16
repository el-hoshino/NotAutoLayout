//
//  BottomLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomLeft<ParentView: UIView> {
		
		let bottomLeft: LayoutElement.Point<ParentView>
		
	}
	
}

extension IndividualProperty.BottomLeft: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomLeft {
	
	private func makeFrame(bottomLeft: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (topCenter.x - bottomLeft.x).doubled
		let height = bottomLeft.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = topRight.x - bottomLeft.x
		let height = bottomLeft.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - bottomLeft.x).doubled
		let height = (bottomLeft.y - middleCenter.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = middleRight.x - bottomLeft.x
		let height = (bottomLeft.y - middleRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, size: CGSize) -> CGRect {
		
		let x = bottomLeft.x
		let y = bottomLeft.y - size.height
		let width = size.width
		let height = size.height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopCenter
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public func evaluateFrame(topCenter: LayoutElement.Point<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let topCenter = topCenter.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, topCenter: topCenter)
		
	}
	
}

// MARK: TopRight
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public func evaluateFrame(topRight: LayoutElement.Point<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let topRight = topRight.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, topRight: topRight)
		
	}
	
}

// MARK: MiddleCenter
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreMiddleCenterToEvaluateFrameType {
	
	public func evaluateFrame(middleCenter: LayoutElement.Point<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let middleCenter = middleCenter.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, middleCenter: middleCenter)
		
	}
	
}

// MARK: MiddleRight
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func evaluateFrame(middleRight: LayoutElement.Point<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let middleRight = middleRight.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, middleRight: middleRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(bottomLeft: bottomLeft, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = IndividualProperty.BottomLeftCenter<ParentView>
	
	public func storeCenter(_ center: LayoutElement.Horizontal<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.BottomLeft<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.BottomLeftCenter<ParentView>> {
		
		let bottomLeftCenter = IndividualProperty.BottomLeftCenter(bottomLeft: self.bottomLeft,
																	  center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftCenter)
		
		return maker
		
	}
	
}

// MARK: Right
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = IndividualProperty.BottomLeftRight<ParentView>
	
	public func storeRight(_ right: LayoutElement.Horizontal<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.BottomLeft<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.BottomLeftRight<ParentView>> {
		
		let bottomLeftRight = IndividualProperty.BottomLeftRight(bottomLeft: self.bottomLeft,
																	right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftRight)
		
		return maker
		
	}
	
}

// MARK: Top
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = IndividualProperty.BottomLeftTop<ParentView>
	
	public func storeTop(_ top: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.BottomLeft<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.BottomLeftTop<ParentView>> {
		
		let bottomLeftTop = IndividualProperty.BottomLeftTop(bottomLeft: self.bottomLeft,
																top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftTop)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.BottomLeftMiddle<ParentView>
	
	public func storeMiddle(_ middle: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.BottomLeft<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.BottomLeftMiddle<ParentView>> {
		
		let bottomLeftMiddle = IndividualProperty.BottomLeftMiddle(bottomLeft: self.bottomLeft,
																	  middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftMiddle)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.BottomLeftWidth<ParentView>
	
	public func storeWidth(_ width: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.BottomLeft<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.BottomLeftWidth<ParentView>> {
		
		let bottomLeftWidth = IndividualProperty.BottomLeftWidth(bottomLeft: self.bottomLeft,
																	width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.BottomLeft: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.BottomLeftHeight<ParentView>
	
	public func storeHeight(_ height: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.BottomLeft<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.BottomLeftHeight<ParentView>> {
		
		let bottomLeftHeight = IndividualProperty.BottomLeftHeight(bottomLeft: self.bottomLeft,
																	  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeftHeight)
		
		return maker
		
	}
	
}
