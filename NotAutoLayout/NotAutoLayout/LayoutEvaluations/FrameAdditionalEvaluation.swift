//
//  FrameAdditionalEvaluation.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

enum FrameAdditionalEvaluation {
	
	typealias FloatEvaluation = (_ frame: CGRect, _ property: ViewFrameProperty) -> CGFloat
	typealias PointEvaluation = (_ frame: CGRect, _ property: ViewFrameProperty) -> CGPoint
	typealias SizeEvaluation = (_ frame: CGRect, _ property: ViewFrameProperty) -> CGSize
	
	typealias Process = (_ view: UIView, _ frame: CGRect, _ layourProperty: ViewFrameProperty) -> Void
	
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
	
	case expandWidthTo(FloatEvaluation, from: CGRect.HorizontalBaseLine)
	case expandWidthBy(FloatEvaluation, from: CGRect.HorizontalBaseLine)
	
	case expandHeightTo(FloatEvaluation, from: CGRect.VerticalBaseLine)
	case expandHeightBy(FloatEvaluation, from: CGRect.VerticalBaseLine)
	
	case expandSizeTo(SizeEvaluation, from: CGRect.PlaneBasePoint)
	case expandSizeBy(SizeEvaluation, from: CGRect.PlaneBasePoint)
	
	case addotionalProcess(Process)
	
}

extension FrameAdditionalEvaluation {
	
	func evaluated(from frame: CGRect, with property: ViewFrameProperty) -> CGRect {
		
		var frame = frame
		
		switch self {
		case .moveLeftTo(let evaluation):
			let leftGoal = evaluation(frame, property)
			frame.moveLeft(to: leftGoal)
			
		case .moveCenterTo(let evaluation):
			let centerGoal = evaluation(frame, property)
			frame.moveCenter(to: centerGoal)
			
		case .moveRightTo(let evaluation):
			let rightGoal = evaluation(frame, property)
			frame.moveRight(to: rightGoal)
			
		case .moveTopTo(let evaluation):
			let topGoal = evaluation(frame, property)
			frame.moveTop(to: topGoal)
			
		case .moveMiddleTo(let evaluation):
			let middleGoal = evaluation(frame, property)
			frame.moveMiddle(to: middleGoal)
			
		case .moveBottomTo(let evaluation):
			let bottomGoal = evaluation(frame, property)
			frame.moveBottom(to: bottomGoal)
			
		case .moveXBy(let evaluation):
			let xOffset = evaluation(frame, property)
			frame.moveX(by: xOffset)
			
		case .moveYBy(let evaluation):
			let yOffset = evaluation(frame, property)
			frame.moveY(by: yOffset)
			
		case .moveOriginBy(let evaluation):
			let originOffset = evaluation(frame, property)
			frame.moveOrigin(by: originOffset)
			
		case .pinchLeftTo(let evaluation):
			let leftGoal = evaluation(frame, property)
			frame.pinchLeft(to: leftGoal)
			
		case .pinchLeftBy(let evaluation):
			let leftOffset = evaluation(frame, property)
			frame.pinchLeft(by: leftOffset)
			
		case .pinchRightTo(let evaluation):
			let rightGoal = evaluation(frame, property)
			frame.pinchRight(to: rightGoal)
			
		case .pinchRightBy(let evaluation):
			let rightOffset = evaluation(frame, property)
			frame.pinchRight(by: rightOffset)
			
		case .pinchTopTo(let evaluation):
			let topGoal = evaluation(frame, property)
			frame.pinchTop(to: topGoal)
			
		case .pinchTopBy(let evaluation):
			let topOffset = evaluation(frame, property)
			frame.pinchTop(by: topOffset)
			
		case .pinchBottomTo(let evaluation):
			let bottomGoal = evaluation(frame, property)
			frame.pinchBottom(to: bottomGoal)
			
		case .pinchBottomBy(let evaluation):
			let bottomOffset = evaluation(frame, property)
			frame.pinchBottom(by: bottomOffset)
			
		case .expandWidthTo(let evaluation, from: let baseline):
			let widthGoal = evaluation(frame, property)
			frame.expandWidth(to: widthGoal, from: baseline)
			
		case .expandWidthBy(let evaluation, from: let baseline):
			let widthDiff = evaluation(frame, property)
			frame.expandWidth(by: widthDiff, from: baseline)
			
		case .expandHeightTo(let evaluation, from: let baseline):
			let heightGoal = evaluation(frame, property)
			frame.expandHeight(to: heightGoal, from: baseline)
			
		case .expandHeightBy(let evaluation, from: let baseline):
			let heightDiff = evaluation(frame, property)
			frame.expandHeight(by: heightDiff, from: baseline)
			
		case .expandSizeTo(let evaluation, from: let basepoint):
			let sizeDiff = evaluation(frame, property)
			frame.expandSize(by: sizeDiff, from: basepoint)
			
		case .expandSizeBy(let evaluation, from: let basepoint):
			let sizeGoal = evaluation(frame, property)
			frame.expandSize(to: sizeGoal, from: basepoint)
			
		case .addotionalProcess(let process):
			let view = property.currentView ?? { assertionFailure("Failed to get current view"); return UIView() }()
			process(view, frame, property)
		}
		
		return frame
		
	}
	
}
