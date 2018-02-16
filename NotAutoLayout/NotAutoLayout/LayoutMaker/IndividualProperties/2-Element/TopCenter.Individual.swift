//
//  TopCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct TopCenter<ParentView: UIView> {
		
		let topCenter: LayoutElement.Point<ParentView>
		
	}
	
}

extension IndividualProperty.TopCenter: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
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
	
	public func evaluateFrame(middleLeft: LayoutElement.Point<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let middleLeft = middleLeft.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleRight
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreMiddleRightToEvaluateFrameType {
	
	public func evaluateFrame(middleRight: LayoutElement.Point<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let middleRight = middleRight.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, middleRight: middleRight)
		
	}
	
}

// MARK: BottomLeft
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreBottomLeftToEvaluateFrameType {
	
	public func evaluateFrame(bottomLeft: LayoutElement.Point<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let bottomLeft = bottomLeft.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomRight
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func evaluateFrame(bottomRight: LayoutElement.Point<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let bottomRight = bottomRight.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = IndividualProperty.TopCenterLeft<ParentView>
	
	public func storeLeft(_ left: LayoutElement.Horizontal<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.TopCenter<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.TopCenterLeft<ParentView>> {
		
		let topCenterLeft = IndividualProperty.TopCenterLeft(topCenter: self.topCenter,
																left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterLeft)
		
		return maker
		
	}
	
}

// MARK: Right
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = IndividualProperty.TopCenterRight<ParentView>
	
	public func storeRight(_ right: LayoutElement.Horizontal<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.TopCenter<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.TopCenterRight<ParentView>> {
		
		let topCenterRight = IndividualProperty.TopCenterRight(topCenter: self.topCenter,
																  right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterRight)
		
		return maker
		
	}
	
}

// MARK: Middle
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreMiddleType {
	
	public typealias WillSetMiddleProperty = IndividualProperty.TopCenterMiddle<ParentView>
	
	public func storeMiddle(_ middle: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.TopCenter<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.TopCenterMiddle<ParentView>> {
		
		let topCenterMiddle = IndividualProperty.TopCenterMiddle(topCenter: self.topCenter,
																	middle: middle)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterMiddle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreBottomType {
	
	public typealias WillSetBottomProperty = IndividualProperty.TopCenterBottom<ParentView>
	
	public func storeBottom(_ bottom: LayoutElement.Vertical<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.TopCenter<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.TopCenterBottom<ParentView>> {
		
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
	
	public typealias WillSetWidthProperty = IndividualProperty.TopCenterWidth<ParentView>
	
	public func storeWidth(_ width: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.TopCenter<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.TopCenterWidth<ParentView>> {
		
		let topCenterWidth = IndividualProperty.TopCenterWidth(topCenter: self.topCenter,
																  width: width)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterWidth)
		
		return maker
		
	}
	
}

// MARK: Height
extension IndividualProperty.TopCenter: LayoutPropertyCanStoreHeightType {

	public typealias WillSetHeightProperty = IndividualProperty.TopCenterHeight<ParentView>
	
	public func storeHeight(_ height: LayoutElement.Length<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.TopCenter<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.TopCenterHeight<ParentView>> {
		
		let topCenterHeight = IndividualProperty.TopCenterHeight(topCenter: self.topCenter,
																	height: height)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenterHeight)
		
		return maker
		
	}
	
}
