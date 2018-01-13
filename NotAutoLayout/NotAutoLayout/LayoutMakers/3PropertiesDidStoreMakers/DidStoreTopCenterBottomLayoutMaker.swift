//
//  DidStoreTopCenterBottomLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreTopCenterBottomLayoutProperty {
	
	let topCenter: LayoutElement.Point
	
	let bottom: LayoutElement.Vertical
	
}

// MARK: - Make Frame
extension DidStoreTopCenterBottomLayoutProperty {
	
	private func makeFrame(topCenter: CGPoint, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let x = topCenter.x - width.halved
		let y = topCenter.y
		let height = bottom - topCenter.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension DidStoreTopCenterBottomLayoutProperty: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public typealias WillSetWidthProperty = LayoutEditor
	
	public func evaluateFrame(width: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let topCenter = self.topCenter.evaluated(from: property)
		let bottom = self.bottom.evaluated(from: property)
		let height = bottom - topCenter.y
		let width = width.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .height(height))
		return self.makeFrame(topCenter: topCenter, bottom: bottom, width: width)
		
	}
	
}
