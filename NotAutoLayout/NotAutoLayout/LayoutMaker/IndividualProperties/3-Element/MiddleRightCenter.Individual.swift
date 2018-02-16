//
//  MiddleRightCenter.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleRightCenter<ParentView: UIView> {
		
		let middleRight: LayoutElement.Point<ParentView>
		
		let center: LayoutElement.Horizontal<ParentView>
		
	}
	
}

extension IndividualProperty.MiddleRightCenter: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleRightCenter {
	
	private func makeFrame(middleRight: CGPoint, center: CGFloat, top: CGFloat) -> CGRect {
		
		let height = (middleRight.y - top).doubled
		
		return self.makeFrame(middleRight: middleRight, center: center, height: height)
		
	}
	
	private func makeFrame(middleRight: CGPoint, center: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = (bottom - middleRight.y).doubled
		
		return self.makeFrame(middleRight: middleRight, center: center, height: height)
		
	}
	
	private func makeFrame(middleRight: CGPoint, center: CGFloat, height: CGFloat) -> CGRect {
		
		let width = (middleRight.x - center).doubled
		let x = middleRight.x - width
		let y = middleRight.y - height.halved
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension IndividualProperty.MiddleRightCenter: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func evaluateFrame(top: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let top = top.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, center: center, top: top)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.MiddleRightCenter: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(middleRight: middleRight, center: center, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.MiddleRightCenter: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleRight = self.middleRight.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let width = (middleRight.x - center).doubled
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(middleRight: middleRight, center: center, height: height)
		
	}
	
}
