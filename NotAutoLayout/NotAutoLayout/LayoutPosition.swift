//
//  LayoutPosition.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public enum LayoutPosition {
	
	public enum OffsetType {
		
		case topLeft
		case topCenter
		case topRight
		
		case middleLeft
		case middleCenter
		case middleRight
		
		case bottomLeft
		case bottomCenter
		case bottomRight
		
	}
	
	case absolute(CGRect)
	case relative(CGRect)
	
	case insets(UIEdgeInsets)
	
	case offset(value: UIOffset, type: OffsetType, size: CGSize)
	
	case custom((CGSize) -> CGRect)
	
}

extension LayoutPosition {
	
	func absoluteRect(in size: CGSize) -> CGRect {
		switch self {
		case .absolute(let rect):
			return rect
			
		case .relative(let rect):
			return size.absoluteRect(relatedTo: rect)
			
		case .insets(let insets):
			return size.absoluteRect(withinInsets: insets)
			
		case .offset(value: let value, type: let type, size: let objectSize):
			return size.absoluteRect(offsetBy: value, from: type, for: objectSize)
			
		case .custom(let transform):
			return size.absoluteRect(appliedTo: transform)
		}
	}
	
}

extension LayoutPosition.OffsetType {
	
	func getOrigin(offset: UIOffset, canvasSize: CGSize, objectSize: CGSize) -> CGPoint {
		
		let originX: CGFloat
		let originY: CGFloat
		
		switch self {
		case .topLeft:
			originX = offset.horizontal
			originY = offset.vertical
			
		case .topCenter:
			let canvasCenter = canvasSize.width / 2
			let offsetCenter = canvasCenter + offset.horizontal
			originX = offsetCenter - (objectSize.width / 2)
			originY = offset.vertical
			
		case .topRight:
			let offsetRight = canvasSize.width + offset.horizontal
			originX = offsetRight - objectSize.width
			originY = offset.vertical
			
		case .middleLeft:
			let canvasMiddle = canvasSize.height / 2
			let offsetMiddle = canvasMiddle + offset.vertical
			originX = offset.horizontal
			originY = offsetMiddle - (objectSize.height / 2)
			
		case .middleCenter:
			let canvasCenter = canvasSize.width / 2
			let offsetCenter = canvasCenter + offset.horizontal
			let canvasMiddle = canvasSize.height / 2
			let offsetMiddle = canvasMiddle + offset.vertical
			originX = offsetCenter - (objectSize.width / 2)
			originY = offsetMiddle - (objectSize.height / 2)
			
		case .middleRight:
			let offsetRight = canvasSize.width + offset.horizontal
			let canvasMiddle = canvasSize.height / 2
			let offsetMiddle = canvasMiddle + offset.vertical
			originX = offsetRight - (objectSize.width)
			originY = offsetMiddle - (objectSize.height / 2)
			
		case .bottomLeft:
			let offsetBottom = canvasSize.height + offset.vertical
			originX = offset.horizontal
			originY = offsetBottom - objectSize.height
			
		case .bottomCenter:
			let canvasCenter = canvasSize.width / 2
			let offsetCenter = canvasCenter + offset.horizontal
			let offsetBottom = canvasSize.height + offset.vertical
			originX = offsetCenter - (objectSize.width / 2)
			originY = offsetBottom - objectSize.height
			
		case .bottomRight:
			let offsetRight = canvasSize.width + offset.horizontal
			let offsetBottom = canvasSize.height + offset.vertical
			originX = offsetRight - objectSize.width
			originY = offsetBottom - objectSize.height
		}
		
		return CGPoint(x: originX, y: originY)
		
	}
	
}
