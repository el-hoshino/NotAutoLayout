//
//  BottomCenterHeight.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomCenterHeight<ParentView: UIView> {
		
		let bottomCenter: LayoutElement.Point<ParentView>
		
		let height: LayoutElement.Length<ParentView>
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomCenterHeight {
	
	private func makeFrame(bottomCenter: CGPoint, height: CGFloat, width: CGFloat) -> CGRect {
		
		let x = bottomCenter.x - width.halved
		let y = bottomCenter.y - height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.BottomCenterHeight: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let height = self.height.evaluated(from: parameters, withTheOtherAxis: .width(0))
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		
		return self.makeFrame(bottomCenter: bottomCenter, height: height, width: width)
		
	}
	
}
