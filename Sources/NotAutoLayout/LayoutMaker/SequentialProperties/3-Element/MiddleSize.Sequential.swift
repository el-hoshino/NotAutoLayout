//
//  MiddleSize.Sequential.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension SequentialProperty {
	
	public struct MiddleSize {
		
		let middle: LayoutElement.Vertical
		
		let subviewSize: LayoutElement.Size
		
	}
	
}

// MARK: - Make Frames
extension SequentialProperty.MiddleSize {
	
	private func makeFrames(middle: Float, subviewSizes: [Size], insets: Float) -> [Rect] {
		
		let frames = subviewSizes.indices.map { (index) -> Rect in
			
			let size = subviewSizes[index]
			let x = (insets * Float(index + 1)) + subviewSizes.map({ $0.width }).sum(ofFirst: index)
			let y = middle - size.height.half
			let origin = Point(x: x, y: y)
			let frame = Rect(origin: origin, size: size)
			
			return frame
			
		}
		
		return frames
		
	}
	
}

extension SequentialProperty.MiddleSize: LayoutPropertyCanStoreHorizontalInsetsToEvaluateFramesType {
	
	public func evaluateFrames(horizontalInsets: LayoutElement.Insets, parameters: SequentialFrameCalculationParameters) -> [Rect] {
		
		let middle = self.middle.evaluated(from: parameters)
		let subviewSizes = self.subviewSize.evaluated(from: parameters)
		let totalWidth = parameters.guides.width
		let insets = horizontalInsets.evaluated(from: parameters, totalWidth: totalWidth, viewWidths: subviewSizes.map({ $0.width }))
		
		return self.makeFrames(middle: middle, subviewSizes: subviewSizes, insets: insets)
		
	}
	
}
