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
	
	func absolutePosition(in size: CGSize) -> PositionRect {
		switch self {
		case .absolute(let rect):
			return PositionRect(frame: rect)
			
		case .relative(let rect):
			return size.absolutePosition(relatedTo: rect)
			
		case .insets(let insets):
			return size.absolutePosition(withinInsets: insets)
			
		case .offset(value: let value, type: let type, size: let objectSize):
			return size.absolutePosition(offsetBy: value, from: type, forObjectSize: objectSize)
			
		case .custom(let transform):
			return size.absolutePosition(appliedTo: transform)
		}
	}
	
}

extension LayoutPosition.OffsetType {
	
	func getCenter(offset: UIOffset, boundSize: CGSize, objectSize: CGSize) -> CGPoint {
		
		let boundHorizontalCenter = boundSize.width / 2
		let boundVerticalCenter = boundSize.height / 2
		
		let objectHorizontalCenter = objectSize.width / 2
		let objectVerticalCenter = objectSize.height / 2
		
		let horizontalCenterDiff = boundHorizontalCenter - objectHorizontalCenter
		let verticalCenterDiff = boundVerticalCenter - objectVerticalCenter
		
		let centerX: CGFloat
		let centerY: CGFloat
		
		switch self {
		case .topLeft:
			centerX = offset.horizontal - horizontalCenterDiff
			centerY = offset.vertical - verticalCenterDiff
			
		case .topCenter:
			centerX = offset.horizontal
			centerY = offset.vertical - verticalCenterDiff
			
		case .topRight:
			centerX = offset.horizontal + horizontalCenterDiff
			centerY = offset.vertical - verticalCenterDiff
			
		case .middleLeft:
			centerX = offset.horizontal - horizontalCenterDiff
			centerY = offset.vertical
			
		case .middleCenter:
			centerX = offset.horizontal
			centerY = offset.vertical
			
		case .middleRight:
			centerX = offset.horizontal + horizontalCenterDiff
			centerY = offset.vertical
			
		case .bottomLeft:
			centerX = offset.horizontal - horizontalCenterDiff
			centerY = offset.vertical + verticalCenterDiff
			
		case .bottomCenter:
			centerX = offset.horizontal
			centerY = offset.vertical + verticalCenterDiff
			
		case .bottomRight:
			centerX = offset.horizontal + horizontalCenterDiff
			centerY = offset.vertical + verticalCenterDiff
		}
		
		return CGPoint(x: centerX, y: centerY)
		
	}
	
}
