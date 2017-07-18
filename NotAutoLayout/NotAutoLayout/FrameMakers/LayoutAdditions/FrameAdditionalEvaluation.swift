//
//  FrameAdditionalEvaluation.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

enum FrameAdditionalEvaluation {
	
	typealias FloatEvaluation = Layout.Individual.AdditionalFloatEvaluation
	typealias PointEvaluation = Layout.Individual.AdditionalPointEvaluation
	typealias SizeEvaluation = Layout.Individual.AdditionalSizeEvaluation
	
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
			let leftGoal = evaluation(frame, boundSize)
			frame.moveLeft(to: leftGoal)
			
		case .moveCenterTo(let evaluation):
			let centerGoal = evaluation(frame, boundSize)
			frame.moveCenter(to: centerGoal)
			
		case .moveRightTo(let evaluation):
			let rightGoal = evaluation(frame, boundSize)
			frame.moveRight(to: rightGoal)
			
		case .moveTopTo(let evaluation):
			let topGoal = evaluation(frame, boundSize)
			frame.moveTop(to: topGoal)
			
		case .moveMiddleTo(let evaluation):
			let middleGoal = evaluation(frame, boundSize)
			frame.moveMiddle(to: middleGoal)
			
		case .moveBottomTo(let evaluation):
			let bottomGoal = evaluation(frame, boundSize)
			frame.moveBottom(to: bottomGoal)
			
		case .moveXBy(let evaluation):
			let xOffset = evaluation(frame, boundSize)
			frame.moveX(by: xOffset)
			
		case .moveYBy(let evaluation):
			let yOffset = evaluation(frame, boundSize)
			frame.moveY(by: yOffset)
			
		case .moveOriginBy(let evaluation):
			let originOffset = evaluation(frame, boundSize)
			frame.moveOrigin(by: originOffset)
			
		case .pinchLeftTo(let evaluation):
			let leftGoal = evaluation(frame, boundSize)
			frame.pinchLeft(to: leftGoal)
			
		case .pinchLeftBy(let evaluation):
			let leftOffset = evaluation(frame, boundSize)
			frame.pinchLeft(by: leftOffset)
			
		case .pinchRightTo(let evaluation):
			let rightGoal = evaluation(frame, boundSize)
			frame.pinchRight(to: rightGoal)
			
		case .pinchRightBy(let evaluation):
			let rightOffset = evaluation(frame, boundSize)
			frame.pinchRight(by: rightOffset)
			
		case .pinchTopTo(let evaluation):
			let topGoal = evaluation(frame, boundSize)
			frame.pinchTop(to: topGoal)
			
		case .pinchTopBy(let evaluation):
			let topOffset = evaluation(frame, boundSize)
			frame.pinchTop(by: topOffset)
			
		case .pinchBottomTo(let evaluation):
			let bottomGoal = evaluation(frame, boundSize)
			frame.pinchBottom(to: bottomGoal)
			
		case .pinchBottomBy(let evaluation):
			let bottomOffset = evaluation(frame, boundSize)
			frame.pinchBottom(by: bottomOffset)
			
		case .expandWidthTo(let evaluation, from: let baseline):
			let widthGoal = evaluation(frame, boundSize)
			frame.expandWidth(to: widthGoal, from: baseline)
			
		case .expandWidthBy(let evaluation, from: let baseline):
			let widthDiff = evaluation(frame, boundSize)
			frame.expandWidth(by: widthDiff, from: baseline)
			
		case .expandHeightTo(let evaluation, from: let baseline):
			let heightGoal = evaluation(frame, boundSize)
			frame.expandHeight(to: heightGoal, from: baseline)
			
		case .expandHeightBy(let evaluation, from: let baseline):
			let heightDiff = evaluation(frame, boundSize)
			frame.expandHeight(by: heightDiff, from: baseline)
			
		case .expandSizeTo(let evaluation, from: let basepoint):
			let sizeDiff = evaluation(frame, boundSize)
			frame.expandSize(by: sizeDiff, from: basepoint)
			
		case .expandSizeBy(let evaluation, from: let basepoint):
			let sizeGoal = evaluation(frame, boundSize)
			frame.expandSize(to: sizeGoal, from: basepoint)
		}
		
		return frame
		
	}
	
}
