//
//  SequentialRestFrameEvaluation.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

enum SequentialRestFrameEvaluation {
	
	typealias FloatEvaluation = (_ frame: CGRect, _ parameter: LayoutControlParameter) -> CGFloat
	typealias PointEvaluation = (_ frame: CGRect, _ parameter: LayoutControlParameter) -> CGPoint
	typealias SizeEvaluation = (_ frame: CGRect, _ parameter: LayoutControlParameter) -> CGSize
	
	case movingXBy(FloatEvaluation)
	case movingYBy(FloatEvaluation)
	case movingOriginBy(PointEvaluation)
	
	case expandingWidthBy(FloatEvaluation, from: CGRect.HorizontalBaseLine)
	case expandingHeightBy(FloatEvaluation, from: CGRect.VerticalBaseLine)
	case expandingSizeBy(SizeEvaluation, from: CGRect.PlaneBasePoint)
	
	case fitWidthBy(FloatEvaluation, from: CGRect.HorizontalBaseLine)
	case fitHeightBy(FloatEvaluation, from: CGRect.VerticalBaseLine)
	case fitSizeBy(SizeEvaluation, from: CGRect.PlaneBasePoint)
	
}

extension SequentialRestFrameEvaluation {
	
	func evaluated(for view: UIView, from frame: CGRect, with parameter: LayoutControlParameter) -> CGRect {
		
		var frame = frame
		
		switch self {
		case .movingXBy(let xOffset):
			frame.moveX(by: xOffset(frame, parameter))
			
		case .movingYBy(let yOffset):
			frame.moveY(by: yOffset(frame, parameter))
			
		case .movingOriginBy(let offset):
			frame.moveOrigin(by: offset(frame, parameter))
			
		case .expandingWidthBy(let xDiff, from: let baseline):
			frame.expandWidth(by: xDiff(frame, parameter), from: baseline)
			
		case .expandingHeightBy(let yDiff, from: let baseline):
			frame.expandHeight(by: yDiff(frame, parameter), from: baseline)
			
		case .expandingSizeBy(let diff, from: let basepoint):
			frame.expandSize(by: diff(frame, parameter), from: basepoint)
			
		case .fitWidthBy(let fittingWidth, from: let baseline):
			let fittingSize = CGSize(width: fittingWidth(frame, parameter), height: frame.height)
			let fittedSize = view.sizeThatFits(fittingSize)
			frame.expandWidth(to: fittedSize.width, from: baseline)
			
		case .fitHeightBy(let fittingHeight, from: let baseline):
			let fittingSize = CGSize(width: frame.width, height: fittingHeight(frame, parameter))
			let fittedSize = view.sizeThatFits(fittingSize)
			frame.expandHeight(to: fittedSize.height, from: baseline)
			
		case .fitSizeBy(let fittingSize, from: let basepoint):
			let fittedSize = view.sizeThatFits(fittingSize(frame, parameter))
			frame.expandSize(to: fittedSize, from: basepoint)
		}
		
		return frame
		
	}
	
}
