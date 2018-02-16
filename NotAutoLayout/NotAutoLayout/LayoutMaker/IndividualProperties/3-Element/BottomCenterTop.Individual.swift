//
//  BottomCenterTop.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct BottomCenterTop {
		
		let bottomCenter: LayoutElement.Point
		
		let top: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.BottomCenterTop {
	
	private func makeFrame(bottomCenter: CGPoint, top: CGFloat, width: CGFloat) -> CGRect {
		
		let x = bottomCenter.x - width.halved
		let y = top
		let height = bottomCenter.y - top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.BottomCenterTop: LayoutPropertyCanStoreWidthToEvaluateFrameType {
	
	public func evaluateFrame(width: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> CGRect {
		
		let bottomCenter = self.bottomCenter.evaluated(from: parameters)
		let top = self.top.evaluated(from: parameters)
		let height = bottomCenter.y - top
		let width = width.evaluated(from: parameters, withTheOtherAxis: .height(height))
		
		return self.makeFrame(bottomCenter: bottomCenter, top: top, width: width)
		
	}
	
}
