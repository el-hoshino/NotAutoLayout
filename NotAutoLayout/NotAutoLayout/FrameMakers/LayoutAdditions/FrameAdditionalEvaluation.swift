//
//  FrameAdditionalEvaluation.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

enum FrameAdditionalEvaluation {
	
	typealias FloatEvaluation = (_ boundSize: CGSize) -> CGFloat
	typealias PointEvaluation = (_ boundSize: CGSize) -> CGPoint
	typealias SizeEvaluation = (_ boundSize: CGSize) -> CGSize
	
	case moveLeftTo(FloatEvaluation)
	case moveCenterTo(FloatEvaluation)
	case moveRightTo(FloatEvaluation)
	
	case moveTopTo(FloatEvaluation)
	case moveMiddleTo(FloatEvaluation)
	case moveBottomTo(FloatEvaluation)
	
	case moveXBy(FloatEvaluation)
	case moveYBy(FloatEvaluation)
	case moveOriginBy(PointEvaluation)
	
	case pinchLeftTo(FloatEvaluation)
	case pinchLeftBy(FloatEvaluation)
	
	case pinchRightTo(FloatEvaluation)
	case pinchRightBy(FloatEvaluation)
	
	case pinchTopTo(FloatEvaluation)
	case pinchTopBy(FloatEvaluation)
	
	case pinchBottomTo(FloatEvaluation)
	case pinchBottomBy(FloatEvaluation)
	
	case expandWidthTo(FloatEvaluation, from: CGRect.HorizontalBasePoint)
	case expandWidthBy(FloatEvaluation, from: CGRect.HorizontalBasePoint)
	
	case expandHeightTo(FloatEvaluation, from: CGRect.VerticalBasePoint)
	case expandHeightBy(FloatEvaluation, from: CGRect.VerticalBasePoint)
	
	case expandSizeTo(SizeEvaluation, from: CGRect.PlaneBasePoint)
	case expandSizeBy(SizeEvaluation, from: CGRect.PlaneBasePoint)
	
}

extension FrameAdditionalEvaluation {
	
	func evaluated(from frame: CGRect, in boundSize: CGSize) -> CGRect {
		
		var frame = frame
		
		switch self {
		case .moveLeftTo(let evaluation):
			let leftGoal = evaluation(boundSize)
			frame.moveLeft(to: leftGoal)
			
		case .moveCenterTo(let evaluation):
			let centerGoal = evaluation(boundSize)
			frame.moveCenter(to: centerGoal)
			
		case .moveRightTo(let evaluation):
			let rightGoal = evaluation(boundSize)
			frame.moveRight(to: rightGoal)
			
		case .moveTopTo(let evaluation):
			let topGoal = evaluation(boundSize)
			frame.moveTop(to: topGoal)
			
		case .moveMiddleTo(let evaluation):
			let middleGoal = evaluation(boundSize)
			frame.moveMiddle(to: middleGoal)
			
		case .moveBottomTo(let evaluation):
			let bottomGoal = evaluation(boundSize)
			frame.moveBottom(to: bottomGoal)
			
		case .moveXBy(let evaluation):
			let xOffset = evaluation(boundSize)
			frame.moveX(by: xOffset)
			
		case .moveYBy(let evaluation):
			let yOffset = evaluation(boundSize)
			frame.moveY(by: yOffset)
			
		case .moveOriginBy(let evaluation):
			let originOffset = evaluation(boundSize)
			frame.moveOrigin(by: originOffset)
			
		case .pinchLeftTo(let evaluation):
			let leftGoal = evaluation(boundSize)
			frame.pinchLeft(to: leftGoal)
			
		case .pinchLeftBy(let evaluation):
			let leftOffset = evaluation(boundSize)
			frame.pinchLeft(by: leftOffset)
			
		case .pinchRightTo(let evaluation):
			let rightGoal = evaluation(boundSize)
			frame.pinchRight(to: rightGoal)
			
		case .pinchRightBy(let evaluation):
			let rightOffset = evaluation(boundSize)
			frame.pinchRight(by: rightOffset)
			
		case .pinchTopTo(let evaluation):
			let topGoal = evaluation(boundSize)
			frame.pinchTop(to: topGoal)
			
		case .pinchTopBy(let evaluation):
			let topOffset = evaluation(boundSize)
			frame.pinchTop(by: topOffset)
			
		case .pinchBottomTo(let evaluation):
			let bottomGoal = evaluation(boundSize)
			frame.pinchBottom(to: bottomGoal)
			
		case .pinchBottomBy(let evaluation):
			let bottomOffset = evaluation(boundSize)
			frame.pinchBottom(by: bottomOffset)
			
		case .expandWidthTo(let evaluation, from: let baseline):
			let widthGoal = evaluation(boundSize)
			frame.expandWidth(to: widthGoal, from: baseline)
			
		case .expandWidthBy(let evaluation, from: let baseline):
			let widthDiff = evaluation(boundSize)
			frame.expandWidth(by: widthDiff, from: baseline)
			
		case .expandHeightTo(let evaluation, from: let baseline):
			let heightGoal = evaluation(boundSize)
			frame.expandHeight(to: heightGoal, from: baseline)
			
		case .expandHeightBy(let evaluation, from: let baseline):
			let heightDiff = evaluation(boundSize)
			frame.expandHeight(by: heightDiff, from: baseline)
			
		case .expandSizeTo(let evaluation, from: let basepoint):
			let sizeDiff = evaluation(boundSize)
			frame.expandSize(by: sizeDiff, from: basepoint)
			
		case .expandSizeBy(let evaluation, from: let basepoint):
			let sizeGoal = evaluation(boundSize)
			frame.expandSize(to: sizeGoal, from: basepoint)
		}
		
		return frame
		
	}
	
}
