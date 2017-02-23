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
	
	case customByFrame(frame: (CGSize) -> CGRect)
	case customByOriginSize(origin: (CGSize) -> CGPoint, size: (CGSize) -> CGSize)
	case customByXYWidthHeight(x: (CGSize) -> CGFloat, y: (CGSize) -> CGFloat, width: (CGSize) -> CGFloat, height: (CGSize) -> CGFloat)
	
	@available(*, deprecated: 0.6, message: "Use customByFrame, customByOriginSize or customByXYWidthHeight instead")
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
			
		case .customByFrame(frame: let frameTransform):
			return size.absolutePositionAppliedTo(frame: frameTransform)
			
		case .customByOriginSize(origin: let originTransform, size: let sizeTransform):
			return size.absolutePositionAppliedTo(origin: originTransform, size: sizeTransform)
			
		case .customByXYWidthHeight(x: let xTransform, y: let yTransform, width: let widthTransform, height: let heightTransform):
			return size.absolutePositionAppliedTo(x: xTransform, y: yTransform, width: widthTransform, height: heightTransform)
			
		case .custom(let transform):
			return size.absolutePositionAppliedTo(frame: transform)
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
