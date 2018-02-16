//
//  MiddleCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleCenter<ParentView: UIView> {
		
		let middleCenter: LayoutElement.Point<ParentView>
		
	}
	
}

extension IndividualProperty.MiddleCenter: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleCenter {
	
	private func makeFrame(middleCenter: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - topLeft.x).doubled
		let height = (middleCenter.y - topLeft.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = (topRight.x - middleCenter.x).doubled
		let height = (middleCenter.y - topRight.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - bottomLeft.x).doubled
		let height = (bottomLeft.y - middleCenter.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - middleCenter.x).doubled
		let height = (bottomRight.y - middleCenter.y).doubled
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleCenter.x - size.width.halved
		let y = middleCenter.y - size.height.halved
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreTopLeftToEvaluateFrameType {
	
	public func evaluateFrame(topLeft: LayoutElement.Point<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let topLeft = topLeft.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, topLeft: topLeft)
		
	}
	
}

// MARK: TopRight
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreTopRightToEvaluateFrameType {
	
	public func evaluateFrame(topRight: LayoutElement.Point<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let topRight = topRight.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, topRight: topRight)
		
	}
	
}

// MARK: BottomLeft
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let bottomLeft = bottomLeft.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomRight
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func evaluateFrame(bottomRight: LayoutElement.Point<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let bottomRight = bottomRight.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = IndividualProperty.MiddleCenterLeft<ParentView>
	
	public func storeLeft(_ left: LayoutElement.Horizontal<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.MiddleCenter<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.MiddleCenterLeft<ParentView>> {
		
		let middleCenterLeft = IndividualProperty.MiddleCenterLeft(middleCenter: self.middleCenter,
																	  left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterLeft)
		
		return maker
		
	}
	
}

// MARK: Right
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = IndividualProperty.MiddleCenterRight<ParentView>
	
	public func storeRight(_ right: LayoutElement.Horizontal<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.MiddleCenter<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.MiddleCenterRight<ParentView>> {
		
		let middleCenterRight = IndividualProperty.MiddleCenterRight(middleCenter: self.middleCenter,
																		right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterRight)
		
		return maker
		
	}
	
}

// MARK: Top
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreTopType {
	
	public typealias WillSetTopProperty = IndividualProperty.MiddleCenterTop<ParentView>
	
	public func storeTop(_ top: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.MiddleCenter<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.MiddleCenterTop<ParentView>> {
		
		let middleCenterTop = IndividualProperty.MiddleCenterTop(middleCenter: self.middleCenter,
																	top: top)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterTop)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.MiddleCenterBottom<ParentView>
	
	public func storeBottom(_ bottom: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.MiddleCenter<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.MiddleCenterBottom<ParentView>> {
		
		let middleCenterBottom = IndividualProperty.MiddleCenterBottom(middleCenter: self.middleCenter,
																		  bottom: bottom)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterBottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreWidthType {
	
	public typealias WillSetWidthProperty = IndividualProperty.MiddleCenterWidth<ParentView>
	
	public func storeWidth(_ width: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.MiddleCenter<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.MiddleCenterWidth<ParentView>> {
		
		let middleCenterWidth = IndividualProperty.MiddleCenterWidth(middleCenter: self.middleCenter,
																		width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.MiddleCenter: LayoutPropertyCanStoreHeightType {
	
	public typealias WillSetHeightProperty = IndividualProperty.MiddleCenterHeight<ParentView>
	
	public func storeHeight(_ height: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.MiddleCenter<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.MiddleCenterHeight<ParentView>> {
		
		let middleCenterHeight = IndividualProperty.MiddleCenterHeight(middleCenter: self.middleCenter,
																		  height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenterHeight)
		
		return maker
		
	}
	
}
