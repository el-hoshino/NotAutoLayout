//
//  Initial.Individual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct Initial {
		
	}
	
}

// MARK: - Set A Frame -
extension IndividualProperty.Initial: LayoutPropertyCanStoreFrameToEvaluateFrameType {
		
	public func evaluateFrame(frame: LayoutElement.Rect, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let frame = frame.evaluated(from: parameters)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension IndividualProperty.Initial: LayoutPropertyCanStoreTopLeftType {
	
	public func storeTopLeft(_ topLeft: LayoutElement.Point) -> IndividualProperty.TopLeft {
		
		let topLeft = IndividualProperty.TopLeft(topLeft: topLeft)
        
		return topLeft
		
	}
	
}

// MARK: TopCenter
extension IndividualProperty.Initial: LayoutPropertyCanStoreTopCenterType {
	
	public func storeTopCenter(_ topCenter: LayoutElement.Point) -> IndividualProperty.TopCenter {
		
		let topCenter = IndividualProperty.TopCenter(topCenter: topCenter)
		
		return topCenter
		
	}
	
}

// MARK: TopRight
extension IndividualProperty.Initial: LayoutPropertyCanStoreTopRightType {
	
	public func storeTopRight(_ topRight: LayoutElement.Point) -> IndividualProperty.TopRight {
		
		let topRight = IndividualProperty.TopRight(topRight: topRight)
		
		return topRight
		
	}
	
}

// MARK: MiddleLeft
extension IndividualProperty.Initial: LayoutPropertyCanStoreMiddleLeftType {
	
	public func storeMiddleLeft(_ middleLeft: LayoutElement.Point) -> IndividualProperty.MiddleLeft {
		
		let middleLeft = IndividualProperty.MiddleLeft(middleLeft: middleLeft)
		
		return middleLeft
		
	}
	
}

// MARK: MiddleCenter
extension IndividualProperty.Initial: LayoutPropertyCanStoreMiddleCenterType {
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point) -> IndividualProperty.MiddleCenter {
		
		let middleCenter = IndividualProperty.MiddleCenter(middleCenter: middleCenter)
		
		return middleCenter
		
	}
	
}

// MARK: MiddleRight
extension IndividualProperty.Initial: LayoutPropertyCanStoreMiddleRightType {
	
	public func storeMiddleRight(_ middleRight: LayoutElement.Point) -> IndividualProperty.MiddleRight {
		
		let middleRight = IndividualProperty.MiddleRight(middleRight: middleRight)
		
		return middleRight
		
	}
	
}

// MARK: BottomLeft
extension IndividualProperty.Initial: LayoutPropertyCanStoreBottomLeftType {
	
	public func storeBottomLeft(_ bottomLeft: LayoutElement.Point) -> IndividualProperty.BottomLeft {
		
		let bottomLeft = IndividualProperty.BottomLeft(bottomLeft: bottomLeft)
		
		return bottomLeft
		
	}
	
}

// MARK: BottomCenter
extension IndividualProperty.Initial: LayoutPropertyCanStoreBottomCenterType {
	
	public func storeBottomCenter(_ bottomCenter: LayoutElement.Point) -> IndividualProperty.BottomCenter {
		
		let bottomCenter = IndividualProperty.BottomCenter(bottomCenter: bottomCenter)
		
		return bottomCenter
		
	}
	
}

// MARK: BottomRight
extension IndividualProperty.Initial: LayoutPropertyCanStoreBottomRightType {
	
	public func storeBottomRight(_ bottomRight: LayoutElement.Point) -> IndividualProperty.BottomRight {
		
		let bottomRight = IndividualProperty.BottomRight(bottomRight: bottomRight)
		
		return bottomRight
		
	}
	
}

// MARK: - Set Horizontal -
// MARK: Left
extension IndividualProperty.Initial: LayoutPropertyCanStoreLeftType {
	
	public func storeLeft(_ left: LayoutElement.Horizontal) -> IndividualProperty.Left {
		
		let left = IndividualProperty.Left(left: left)
		
		return left
		
	}
	
}

// MARK: Center
extension IndividualProperty.Initial: LayoutPropertyCanStoreCenterType {
	
	public func storeCenter(_ center: LayoutElement.Horizontal) -> IndividualProperty.Center {
		
		let center = IndividualProperty.Center(center: center)
		
		return center
		
	}
	
}

// MARK: Right
extension IndividualProperty.Initial: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = IndividualProperty.Right
	
	public func storeRight(_ right: LayoutElement.Horizontal, to maker: LayoutMaker<IndividualProperty.Initial>) -> LayoutMaker<IndividualProperty.Right> {
		
		let right = IndividualProperty.Right(right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: right)
		
		return maker
		
	}
	
}
