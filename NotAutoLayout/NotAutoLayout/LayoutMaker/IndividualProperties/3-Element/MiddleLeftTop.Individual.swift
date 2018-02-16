//
//  MiddleLeftTop.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct MiddleLeftTop<ParentView: UIView> {
		
		let middleLeft: LayoutElement.Point<ParentView>
		
		let top: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.MiddleLeftTop: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.MiddleLeftTop {
	
	private func makeFrame(middleLeft: CGPoint, top: CGFloat, width: CGFloat) -> CGRect {
		
		let x = middleLeft.x
		let y = top
		let height = (middleLeft.y - top).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.MiddleLeftTop: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		
		let middleLeft = self.middleLeft.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let height = (middleLeft.y - top).doubled
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(middleLeft: middleLeft, top: top, width: width)
		
	}
	
}
