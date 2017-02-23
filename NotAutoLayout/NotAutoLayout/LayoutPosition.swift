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
	
	func getPosition(offset: UIOffset, boundSize: CGSize, objectSize: CGSize) -> PositionRect {
		
		let boundHorizontalCenter = boundSize.width / 2
		let boundVerticalCenter = boundSize.height / 2
		
		let objectHorizontalCenter = objectSize.width / 2
		let objectVerticalCenter = objectSize.height / 2
		
		let horizontalCenterDiff = boundHorizontalCenter - objectHorizontalCenter
		let verticalCenterDiff = boundVerticalCenter - objectVerticalCenter
		
		let baseX: CGFloat
		let baseY: CGFloat
		
		switch self {
		case .topLeft:
			baseX = offset.horizontal - horizontalCenterDiff
			baseY = offset.vertical - verticalCenterDiff
			
		case .topCenter:
			baseX = offset.horizontal
			baseY = offset.vertical - verticalCenterDiff
			
		case .topRight:
			baseX = offset.horizontal + horizontalCenterDiff
			baseY = offset.vertical - verticalCenterDiff
			
		case .middleLeft:
			baseX = offset.horizontal - horizontalCenterDiff
			baseY = offset.vertical
			
		case .middleCenter:
			baseX = offset.horizontal
			baseY = offset.vertical
			
		case .middleRight:
			baseX = offset.horizontal + horizontalCenterDiff
			baseY = offset.vertical
			
		case .bottomLeft:
			baseX = offset.horizontal - horizontalCenterDiff
			baseY = offset.vertical + verticalCenterDiff
			
		case .bottomCenter:
			baseX = offset.horizontal
			baseY = offset.vertical + verticalCenterDiff
			
		case .bottomRight:
			baseX = offset.horizontal + horizontalCenterDiff
			baseY = offset.vertical + verticalCenterDiff
		}
		
		let centerX = baseX + boundHorizontalCenter
		let centerY = baseY + boundVerticalCenter
		let center = CGPoint(x: centerX, y: centerY)
		
		return PositionRect(center: center, size: objectSize)
		
	}
	
}
