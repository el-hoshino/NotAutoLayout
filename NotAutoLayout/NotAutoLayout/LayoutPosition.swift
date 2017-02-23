//
//  LayoutPosition.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public enum LayoutPosition {
	
	public enum OffsetOrigin {
		
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
	
	case offset(value: UIOffset, from: OffsetOrigin, size: CGSize)
	
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
			
		case .offset(value: let value, from: let offsetOrigin, size: let objectSize):
			return size.absolutePosition(offsetBy: value, from: offsetOrigin, forObjectSize: objectSize)
			
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
