//
//  MiddleCenterRight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleCenterRight<ParentView: UIView> {
		
		let middleCenter: LayoutElement.Point<ParentView>
		
		let right: LayoutElement.Horizontal<ParentView>
		
	}
	
}

extension IndividualProperty.MiddleCenterRight: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleCenterRight {
	
	private func makeFrame(middleCenter: CGPoint, right: CGFloat, top: CGFloat) -> CGRect {
		
		let height = (middleCenter.y - top).doubled
		
		return self.makeFrame(middleCenter: middleCenter, right: right, height: height)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, right: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middleCenter.y).doubled
		
		return self.makeFrame(middleCenter: middleCenter, right: right, height: height)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, right: CGFloat, height: CGFloat) -> CGRect {
		
		let width = (right - middleCenter.x).doubled
		let x = right - width
		let y = middleCenter.y - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.MiddleCenterRight: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, right: right, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleCenterRight: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, right: right, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.MiddleCenterRight: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let right = self.right.evaluated(from: parameters)
		let width = (right - middleCenter.x).doubled
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleCenter: middleCenter, right: right, height: height)
		
	}
	
}
