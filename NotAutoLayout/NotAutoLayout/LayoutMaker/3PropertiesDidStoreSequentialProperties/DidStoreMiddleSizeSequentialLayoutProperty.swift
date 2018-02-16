//
//  DidStoreMiddleSizeSequentialLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/14.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreMiddleSizeSequentialLayoutProperty {
	
	let middle: LayoutElement.Vertical
	let subviewSize: LayoutElement.Size
	
}

// MARK: - Make Frames
extension DidStoreMiddleSizeSequentialLayoutProperty {
	
	private func makeFrames(middle: CGFloat, subviewSizes: [CGSize], insets: CGFloat) -> [CGRect] {
		
		let frames = subviewSizes.indices.map { (index) -> CGRect in
			
			let size = subviewSizes[index]
			let x = (insets * CGFloat(index + 1)) + subviewSizes.map({ $0.width }).sum(ofFirst: index)
			let y = middle - size.height.halved
			let origin = CGPoint(x: x, y: y)
			let frame = CGRect(origin: origin, size: size)
			
			return frame
			
		}
		
		return frames
		
	}
	
}

extension DidStoreMiddleSizeSequentialLayoutProperty: LayoutPropertyCanStoreHorizontalInsetsToEvaluateFramesType {
	
	public func evaluateFrames(horizontalInsets: LayoutElement.Insets, parameters: SequentialFrameCalculationParameters) -> [CGRect] {
		
		let middle = self.middle.evaluated(from: parameters)
		let subviewSizes = self.subviewSize.evaluated(from: parameters)
		let totalWidth = parameters.property.boundWidth
		let insets = horizontalInsets.evaluated(from: parameters, totalWidth: totalWidth, viewWidths: subviewSizes.map({ $0.width }))
		
		return self.makeFrames(middle: middle, subviewSizes: subviewSizes, insets: insets)
		
	}
	
}
