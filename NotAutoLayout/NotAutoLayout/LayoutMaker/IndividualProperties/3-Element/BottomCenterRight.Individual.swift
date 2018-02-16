//
//  BottomCenterRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomCenterRight<ParentView: UIView> {
		
		let bottomCenter: LayoutElement.Point<ParentView>
		
		let right: LayoutElement.Horizontal<ParentView>
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomCenterRight {
	
	private func makeFrame(bottomCenter: CGPoint, right: CGFloat, top: CGFloat) -> CGRect {
		
		let height = bottomCenter.y - top
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, height: height)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, right: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (bottomCenter.y - middle).doubled
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, height: height)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, right: CGFloat, height: CGFloat) -> CGRect {
		
		let width = (right - bottomCenter.x).doubled
		let x = right - width
		let y = bottomCenter.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.BottomCenterRight: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, top: top)
		
	}
	
}

// MARK: Middle
extension IndividualProperty.BottomCenterRight: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.BottomCenterRight: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = (right - bottomCenter.x).doubled
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomCenter: bottomCenter, right: right, height: height)
		
	}
	
}
