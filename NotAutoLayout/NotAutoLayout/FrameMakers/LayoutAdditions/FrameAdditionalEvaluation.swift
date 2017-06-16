//
//  FrameAdditionalEvaluation.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

enum FrameAdditionalEvaluation {
	
	typealias Evaluation = (_ boundSize: CGSize) -> CGFloat
	
	case moveLeftTo(Evaluation)
	case moveCenterTo(Evaluation)
	case moveRightTo(Evaluation)
	
	case moveTopTo(Evaluation)
	case moveMiddleTo(Evaluation)
	case moveBottomTo(Evaluation)
	
	case moveHorizontallyBy(Evaluation)
	case moveVerticallyBy(Evaluation)
	
	case pinchLeftTo(Evaluation)
	case pinchLeftBy(Evaluation)
	
	case pinchRightTo(Evaluation)
	case pinchRightBy(Evaluation)
	
	case pinchTopTo(Evaluation)
	case pinchTopBy(Evaluation)
	
	case pinchBottomTo(Evaluation)
	case pinchBottomBy(Evaluation)
	
	case expandWidthTo(Evaluation, from: CGRect.HorizontalBaseline)
	case expandWidthBy(Evaluation, from: CGRect.HorizontalBaseline)
	
	case expandHeightTo(Evaluation, from: CGRect.VerticalBaseline)
	case expandHeightBy(Evaluation, from: CGRect.VerticalBaseline)
	
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
			
		case .moveHorizontallyBy(let evaluation):
			let xOffset = evaluation(boundSize)
			frame.moveHorizontally(by: xOffset)
			
		case .moveVerticallyBy(let evaluation):
			let yOffset = evaluation(boundSize)
			frame.moveVertically(by: yOffset)
			
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
		}
		
		return frame
		
	}
	
}
