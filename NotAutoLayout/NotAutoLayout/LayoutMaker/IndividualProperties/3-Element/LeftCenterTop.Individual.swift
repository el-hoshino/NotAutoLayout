//
//  LeftCenterTop.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftCenterTop<ParentView: UIView> {
		
		let left: LayoutElement.Horizontal<ParentView>
		
		let center: LayoutElement.Horizontal<ParentView>
		
		let top: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.LeftCenterTop: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.LeftCenterTop {
	
	private func makeFrame(left: CGFloat, center: CGFloat, top: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (middle - top).doubled
		
		return self.makeFrame(left: left, center: center, top: top, height: height)
		
	}
	
	private func makeFrame(left: CGFloat, center: CGFloat, top: CGFloat, bottom: CGFloat) -> CGRect {
		
		let height = bottom - top
		
		return self.makeFrame(left: left, center: center, top: top, height: height)
		
	}
	
	private func makeFrame(left: CGFloat, center: CGFloat, top: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let width = (center - left).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Middle
extension IndividualProperty.LeftCenterTop: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public func evaluateFrame(middle: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let middle = middle.evaluated(from: parameters)
		
		return self.makeFrame(left: left, center: center, top: top, middle: middle)
		
	}
	
}

// MARK: Bottom
extension IndividualProperty.LeftCenterTop: LayoutPropertyCanStoreBottomToEvaluateFrameType {
	
	public func evaluateFrame(bottom: LayoutElement.Vertical<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let bottom = bottom.evaluated(from: parameters)
		
		return self.makeFrame(left: left, center: center, top: top, bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.LeftCenterTop: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let left = self.left.evaluated(from: parameters)
		let center = self.center.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let width = (center - left).doubled
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(left: left, center: center, top: top, height: height)
		
	}
	
}
