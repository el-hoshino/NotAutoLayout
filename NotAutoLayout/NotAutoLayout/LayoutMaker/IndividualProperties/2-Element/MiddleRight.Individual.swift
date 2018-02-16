//
//  MiddleRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleRight {
		
		let middleRight: LayoutElement.Point
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleRight {
	
	private func makeFrame(middleRight: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = middleRight.x - topLeft.x
		let height = (middleRight.y - topLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (middleRight.x - topCenter.x).doubled
		let height = (middleRight.y - topCenter.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = middleRight.x - bottomLeft.x
		let height = (bottomLeft.y - middleRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (middleRight.x - bottomCenter.x).doubled
		let height = (bottomCenter.y - middleRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
	private func makeFrame(middleRight: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleRight.x - size.width
		let y = middleRight.y - size.height.halved
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
		
	public func evaluateFrame(topLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let topLeft = topLeft.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, topLeft: topLeft)
		
	}
	
}

// MARK: TopCenter
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreTopCenterToEvaluateFrameType {
	
	public func evaluateFrame(topCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let topCenter = topCenter.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, topCenter: topCenter)
		
	}
	
}

// MARK: BottomLeft
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let bottomLeft = bottomLeft.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomCenter
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreBottomCenterToEvaluateFrameType {
	
	public func evaluateFrame(bottomCenter: LayoutElement.Point, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let bottomCenter = bottomCenter.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, bottomCenter: bottomCenter)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = IndividualProperty.MiddleRightLeft
	
	public func storeLeft(_ left: LayoutElement.Horizontal, to maker: LayoutMaker<IndividualProperty.MiddleRight>) -> LayoutMaker<IndividualProperty.MiddleRightLeft> {
		
		let middleRightLeft = IndividualProperty.MiddleRightLeft(middleRight: self.middleRight,
																	left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRightLeft)
		
		return maker
		
	}
	
}

// MARK: Center
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = IndividualProperty.MiddleRightCenter
	
	public func storeCenter(_ center: LayoutElement.Horizontal, to maker: LayoutMaker<IndividualProperty.MiddleRight>) -> LayoutMaker<IndividualProperty.MiddleRightCenter> {
		
		let middleRightCenter = IndividualProperty.MiddleRightCenter(middleRight: self.middleRight,
																		center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRightCenter)
		
		return maker
		
	}
	
}

// MARK: Top
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = IndividualProperty.MiddleRightTop
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.MiddleRight>) -> LayoutMaker<IndividualProperty.MiddleRightTop> {
		
		let middleRightTop = IndividualProperty.MiddleRightTop(middleRight: self.middleRight,
																  top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRightTop)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.MiddleRightBottom
	
	public func storeBottom(_ bottom: LayoutElement.Vertical, to maker: LayoutMaker<IndividualProperty.MiddleRight>) -> LayoutMaker<IndividualProperty.MiddleRightBottom> {
		
		let middleRightBottom = IndividualProperty.MiddleRightBottom(middleRight: self.middleRight,
																		bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRightBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.MiddleRightWidth
	
	public func storeWidth(_ width: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.MiddleRight>) -> LayoutMaker<IndividualProperty.MiddleRightWidth> {
		
		let middleRightWidth = IndividualProperty.MiddleRightWidth(middleRight: self.middleRight,
																	  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRightWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.MiddleRight: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.MiddleRightHeight
	
	public func storeHeight(_ height: LayoutElement.Length, to maker: LayoutMaker<IndividualProperty.MiddleRight>) -> LayoutMaker<IndividualProperty.MiddleRightHeight> {
		
		let middleRightHeight = IndividualProperty.MiddleRightHeight(middleRight: self.middleRight,
																		height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRightHeight)
		
		return maker
		
	}
	
}
