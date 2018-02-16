//
//  TopCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopCenter {
		
		let topCenter: LayoutElement.Point
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.TopCenter {
	
	private func makeFrame(topCenter: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = (topCenter.x - middleLeft.x).doubled
		let height = (middleLeft.y - topCenter.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = (middleRight.x - topCenter.x).doubled
		let height = (middleRight.y - topCenter.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = (topCenter.x - bottomLeft.x).doubled
		let height = bottomLeft.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - topCenter.x).doubled
		let height = bottomRight.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = topCenter.x - size.width.halved
		let y = topCenter.y
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleLeft
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreMiddleLeftToEvaluateFrameType {
	
	public func evaluateFrame(middleLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let middleLeft = middleLeft.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleRight
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func evaluateFrame(middleRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let middleRight = middleRight.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, middleRight: middleRight)
		
	}
	
}

// MARK: BottomLeft
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let bottomLeft = bottomLeft.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomRight
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func evaluateFrame(bottomRight: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let bottomRight = bottomRight.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = IndividualProperty.TopCenterLeft
	
	public func storeLeft <ParentView> (_ left: LayoutElement.Horizontal, to maker: LayoutMaker<ParentView, IndividualProperty.TopCenter>) -> LayoutMaker<ParentView, IndividualProperty.TopCenterLeft> {
		
		let topCenterLeft = IndividualProperty.TopCenterLeft(topCenter: self.topCenter,
																left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterLeft)
		
		return maker
		
	}
	
}

// MARK: Right
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = IndividualProperty.TopCenterRight
	
	public func storeRight <ParentView> (_ right: LayoutElement.Horizontal, to maker: LayoutMaker<ParentView, IndividualProperty.TopCenter>) -> LayoutMaker<ParentView, IndividualProperty.TopCenterRight> {
		
		let topCenterRight = IndividualProperty.TopCenterRight(topCenter: self.topCenter,
																  right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterRight)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.TopCenterMiddle
	
	public func storeMiddle <ParentView> (_ middle: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.TopCenter>) -> LayoutMaker<ParentView, IndividualProperty.TopCenterMiddle> {
		
		let topCenterMiddle = IndividualProperty.TopCenterMiddle(topCenter: self.topCenter,
																	middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.TopCenterBottom
	
	public func storeBottom <ParentView> (_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<ParentView, IndividualProperty.TopCenter>) -> LayoutMaker<ParentView, IndividualProperty.TopCenterBottom> {
		
		let topCenterBottom = IndividualProperty.TopCenterBottom(topCenter: self.topCenter,
																	bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.TopCenterWidth
	
	public func storeWidth <ParentView> (_ width: LayoutElement.Length, to maker: LayoutMaker<ParentView, IndividualProperty.TopCenter>) -> LayoutMaker<ParentView, IndividualProperty.TopCenterWidth> {
		
		let topCenterWidth = IndividualProperty.TopCenterWidth(topCenter: self.topCenter,
																  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreHeightType {

	public typealias WillSetHeightProperty = IndividualProperty.TopCenterHeight
	
	public func storeHeight <ParentView> (_ height: LayoutElement.Length, to maker: LayoutMaker<ParentView, IndividualProperty.TopCenter>) -> LayoutMaker<ParentView, IndividualProperty.TopCenterHeight> {
		
		let topCenterHeight = IndividualProperty.TopCenterHeight(topCenter: self.topCenter,
																	height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterHeight)
		
		return maker
		
	}
	
}
