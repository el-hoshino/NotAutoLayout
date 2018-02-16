//
//  MiddleCenterLeft.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleCenterLeft<ParentView: UIView> {
		
		let middleCenter: LayoutElement.Point<ParentView>
		
		let left: LayoutElement.Horizontal<ParentView>
		
	}
	
}

extension IndividualProperty.MiddleCenterLeft: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleCenterLeft {
	
	private func makeFrame(middleCenter: CGPoint, left: CGFloat, top: CGFloat) -> CGRect {
		
		let height = (middleCenter.y - top).doubled
		
		return self.makeFrame(middleCenter: middleCenter, left: left, height: height)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, left: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middleCenter.y).doubled
		
		return self.makeFrame(middleCenter: middleCenter, left: left, height: height)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = middleCenter.y - height.halved
		let width = (middleCenter.x - left).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.MiddleCenterLeft: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, left: left, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleCenterLeft: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(middleCenter: middleCenter, left: left, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.MiddleCenterLeft: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameters)
		let left = self.left.evaluated(from: parameters)
		let width = (middleCenter.x - left).doubled
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleCenter: middleCenter, left: left, height: height)
		
	}
	
}
