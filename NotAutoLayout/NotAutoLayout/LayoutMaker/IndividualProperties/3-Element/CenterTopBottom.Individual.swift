//
//  CenterTopBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct CenterTopBottom<ParentView: UIView> {
		
		let center: LayoutElement.Horizontal<ParentView>
		
		let top: LayoutElement.Vertical<ParentView>
		
		let bottom: LayoutElement.Vertical<ParentView>
		
	}
	
}

extension IndividualProperty.CenterTopBottom: LayoutMakerPropertyType {
	
	public typealias _ParentView = ParentView
	
}

// MARK: - Make Frame
extension IndividualProperty.CenterTopBottom {
	
	private func makeFrame(center: CGFloat, top: CGFloat, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let x = center - width.halved
		let y = top
		let height = bottom - top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.CenterTopBottom: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length<ParentView>, parameters: IndividualFrameCalculationParameters<ParentView>) -> CGRect {
		let center = self.center.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let height = bottom - top
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(center: center, top: top, bottom: bottom, width: width)
		
	}
	
}
