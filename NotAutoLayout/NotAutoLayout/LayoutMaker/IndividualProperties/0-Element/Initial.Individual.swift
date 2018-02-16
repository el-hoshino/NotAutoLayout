//
//  Initial.Individual.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct Initial<ParentView: UIView> {
		
	}
	
}

extension IndividualProperty.Initial: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Set A Frame -
extension IndividualProperty.Initial: LayoutPropertyCanStoreFrameToEvaluateFrameType {
	
    public func evaluateFrame(frame: LayoutElement.Rect<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
        
        let frame = frame.evaluated(from: parameters)
        
        return frame
        
    }
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension IndividualProperty.Initial: LayoutPropertyCanStoreTopLeftType {
	
	public typealias WillSetTopLeftProperty = IndividualProperty.TopLeft<ParentView>
	
	public func storeTopLeft(_ topLeft: LayoutElement.Point<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Initial<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.TopLeft<ParentView>> {
		
		let topLeft = IndividualProperty.TopLeft(topLeft: topLeft)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topLeft)
		
		return maker
		
	}
	
}

// MARK: TopCenter
extension IndividualProperty.Initial: LayoutPropertyCanStoreTopCenterType {
	
	public typealias WillSetTopCenterProperty = IndividualProperty.TopCenter<ParentView>
	
	public func storeTopCenter(_ topCenter: LayoutElement.Point<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Initial<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.TopCenter<ParentView>> {
		
		let topCenter = IndividualProperty.TopCenter(topCenter: topCenter)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topCenter)
		
		return maker
		
	}
	
}

// MARK: TopRight
extension IndividualProperty.Initial: LayoutPropertyCanStoreTopRightType {
	
	public typealias WillSetTopRightProperty = IndividualProperty.TopRight<ParentView>
	
	public func storeTopRight(_ topRight: LayoutElement.Point<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Initial<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.TopRight<ParentView>> {
		
		let topRight = IndividualProperty.TopRight(topRight: topRight)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: topRight)
		
		return maker
		
	}
	
}

// MARK: MiddleLeft
extension IndividualProperty.Initial: LayoutPropertyCanStoreMiddleLeftType {
	
	public typealias WillSetMiddleLeftProperty = IndividualProperty.MiddleLeft<ParentView>
	
	public func storeMiddleLeft(_ middleLeft: LayoutElement.Point<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Initial<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.MiddleLeft<ParentView>> {
		
		let middleLeft = IndividualProperty.MiddleLeft(middleLeft: middleLeft)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleLeft)
		
		return maker
		
	}
	
}

// MARK: MiddleCenter
extension IndividualProperty.Initial: LayoutPropertyCanStoreMiddleCenterType {
	
	public typealias WillSetMiddleCenterProperty = IndividualProperty.MiddleCenter<ParentView>
	
	public func storeMiddleCenter(_ middleCenter: LayoutElement.Point<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Initial<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.MiddleCenter<ParentView>> {
		
		let middleCenter = IndividualProperty.MiddleCenter(middleCenter: middleCenter)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleCenter)
		
		return maker
		
	}
	
}

// MARK: MiddleRight
extension IndividualProperty.Initial: LayoutPropertyCanStoreMiddleRightType {
	
	public typealias WillSetMiddleRightProperty = IndividualProperty.MiddleRight<ParentView>
	
	public func storeMiddleRight(_ middleRight: LayoutElement.Point<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Initial<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.MiddleRight<ParentView>> {
		
		let middleRight = IndividualProperty.MiddleRight(middleRight: middleRight)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: middleRight)
		
		return maker
		
	}
	
}

// MARK: BottomLeft
extension IndividualProperty.Initial: LayoutPropertyCanStoreBottomLeftType {
	
	public typealias WillSetBottomLeftProperty = IndividualProperty.BottomLeft<ParentView>
	
	public func storeBottomLeft(_ bottomLeft: LayoutElement.Point<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Initial<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.BottomLeft<ParentView>> {
		
		let bottomLeft = IndividualProperty.BottomLeft(bottomLeft: bottomLeft)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomLeft)
		
		return maker
		
	}
	
}

// MARK: BottomCenter
extension IndividualProperty.Initial: LayoutPropertyCanStoreBottomCenterType {
	
	public typealias WillSetBottomCenterProperty = IndividualProperty.BottomCenter<ParentView>
	
	public func storeBottomCenter(_ bottomCenter: LayoutElement.Point<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Initial<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.BottomCenter<ParentView>> {
		
		let bottomCenter = IndividualProperty.BottomCenter(bottomCenter: bottomCenter)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomCenter)
		
		return maker
		
	}
	
}

// MARK: BottomRight
extension IndividualProperty.Initial: LayoutPropertyCanStoreBottomRightType {
	
	public typealias WillSetBottomRightProperty = IndividualProperty.BottomRight<ParentView>
	
	public func storeBottomRight(_ bottomRight: LayoutElement.Point<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Initial<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.BottomRight<ParentView>> {
		
		let bottomRight = IndividualProperty.BottomRight(bottomRight: bottomRight)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: bottomRight)
		
		return maker
		
	}
	
}

// MARK: - Set Horizontal -
// MARK: Left
extension IndividualProperty.Initial: LayoutPropertyCanStoreLeftType {
	
	public typealias WillSetLeftProperty = IndividualProperty.Left<ParentView>
	
	public func storeLeft(_ left: LayoutElement.Horizontal<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Initial<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.Left<ParentView>> {
		
		let left = IndividualProperty.Left(left: left)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: left)
		
		return maker
		
	}
	
}

// MARK: Center
extension IndividualProperty.Initial: LayoutPropertyCanStoreCenterType {
	
	public typealias WillSetCenterProperty = IndividualProperty.Center<ParentView>
	
	public func storeCenter(_ center: LayoutElement.Horizontal<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Initial<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.Center<ParentView>> {
		
		let center = IndividualProperty.Center(center: center)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: center)
		
		return maker
		
	}
	
}

// MARK: Right
extension IndividualProperty.Initial: LayoutPropertyCanStoreRightType {
	
	public typealias WillSetRightProperty = IndividualProperty.Right<ParentView>
	
	public func storeRight(_ right: LayoutElement.Horizontal<ParentView>, to maker: LayoutMaker<ParentView, IndividualProperty.Initial<ParentView>>) -> LayoutMaker<ParentView, IndividualProperty.Right<ParentView>> {
		
		let right = IndividualProperty.Right(right: right)
		let maker = LayoutMaker(parentView: maker.parentView,
								didSetProperty: right)
		
		return maker
		
	}
	
}
