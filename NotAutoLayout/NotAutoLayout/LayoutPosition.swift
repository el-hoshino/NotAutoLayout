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
	
	public enum Individual {
		
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
	
	public enum Sequential {
		
		case horizontallyEqualSizedAbsolute(initial: CGRect, margin: CGFloat)
		case verticallyEqualSizedAbsolute(initial: CGRect, margin: CGFloat)
		
		case horizontallyEqualSizedRelative(initial: CGRect, margin: CGFloat)
		case verticallyEqualSizedRelative(initial: CGRect, margin: CGFloat)
		
		case customByFrame(
			initial: (CGSize) -> CGRect,
			rest: (_ previousFrame: CGRect, _ boundSize: CGSize)
			-> CGRect)
		
	}
	
	public enum Matrical {
		
		case rowByRowEqualSizedAbsolute(initial: CGRect, colMargin: CGFloat, rowMargin: CGFloat)
		case colByColEqualSizedAbsolute(initial: CGRect, colMargin: CGFloat, rowMargin: CGFloat)
		
		case rowByRowEqualSizedRelative(initial: CGRect, colMargin: CGFloat, rowMargin: CGFloat)
		case colByColEqualSizedRelative(initial: CGRect, colMargin: CGFloat, rowMargin: CGFloat)
		
		case customByFrame(
			initial: (CGSize) -> CGRect,
			firstInRow: (_ previousColFrame: CGRect, _ boundSize: CGSize) -> CGRect,
			firstInCol: (_ previousRowFrame: CGRect, _ boundSize: CGSize) -> CGRect,
			rest: (_ previousColFrame: CGRect, _ previousRowFrame: CGRect, _ boundSize: CGSize)
			-> CGRect)
		
	}
	
	case individual(Individual)
	case sequential(Sequential)
	case matrical(Matrical)
	
}

extension LayoutPosition.Individual {
	
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

extension LayoutPosition.Sequential {
	
	private func getRect(after previousView: UIView, withHorizontalMargin margin: CGFloat) -> PositionRect {
		
		let size = previousView.frame.size
		let previousMaxX = previousView.frame.maxX
		let x = previousMaxX + margin
		let origin = CGPoint(x: x, y: previousView.frame.minY)
		let frame = CGRect(origin: origin, size: size)
		let rect = PositionRect(frame: frame)
		
		return rect
		
	}
	
	private func getRect(after previousView: UIView, withVerticalMargin margin: CGFloat) -> PositionRect {
		
		let size = previousView.frame.size
		let previousMaxY = previousView.frame.maxY
		let y = previousMaxY + margin
		let origin = CGPoint(x: previousView.frame.minX, y: y)
		let frame = CGRect(origin: origin, size: size)
		let rect = PositionRect(frame: frame)
		
		return rect
		
	}
	
	private enum PositioningMethod {
		
		case absolutely
		case relatively
		
		func absoluteValue(_ value: CGFloat, by comparingValue: CGFloat) -> CGFloat {
			
			switch self {
			case .absolutely:
				return value
				
			case .relatively:
				return comparingValue * value
			}
			
		}
		
		func absoluteRect(_ rect: CGRect, by comparingSize: CGSize) -> PositionRect {
			
			switch self {
			case .absolutely:
				return PositionRect(frame: rect)
				
			case .relatively:
				return comparingSize.absolutePosition(relatedTo: rect)
			}
			
		}
		
	}
	
	private func getHorizontalRect(after previousView: UIView?, in boundSize: CGSize, initialRect: CGRect, margin: CGFloat, _ method: PositioningMethod) -> PositionRect {
		
		if let previousView = previousView {
			let margin = method.absoluteValue(margin, by: boundSize.width)
			let rect = self.getRect(after: previousView, withHorizontalMargin: margin)
			return rect
			
		} else {
			let rect = method.absoluteRect(initialRect, by: boundSize)
			return rect
		}
		
	}
	
	private func getVerticalRect(after previousView: UIView?, in boundSize: CGSize, initialRect: CGRect, margin: CGFloat, _ method: PositioningMethod) -> PositionRect {
		
		if let previousView = previousView {
			
			let rect = self.getRect(after: previousView, withVerticalMargin: margin)
			return rect
			
		} else {
			let rect = PositionRect(frame: initialRect)
			return rect
		}
		
	}
	
	private func getRect(after previousView: UIView?, in boundSize: CGSize, initial: (CGSize) -> CGRect, rest: (_ previousFrame: CGRect, _ boundSize: CGSize) -> CGRect) -> PositionRect {
		
		if let previousView = previousView {
			let frame = rest(previousView.frame, boundSize)
			let rect = PositionRect(frame: frame)
			return rect
			
		} else {
			let frame = initial(boundSize)
			let rect = PositionRect(frame: frame)
			return rect
		}
		
	}
	
	func absolutePosition(after previousView: UIView? = nil, in boundSize: CGSize) -> PositionRect {
		
		switch self {
		case .horizontallyEqualSizedAbsolute(initial: let initialRect, margin: let margin):
			return self.getHorizontalRect(after: previousView, in: boundSize, initialRect: initialRect, margin: margin, .absolutely)
			
		case .verticallyEqualSizedAbsolute(initial: let initialRect, margin: let margin):
			return self.getVerticalRect(after: previousView, in: boundSize, initialRect: initialRect, margin: margin, .absolutely)
			
		case .horizontallyEqualSizedRelative(initial: let initialRect, margin: let margin):
			return self.getHorizontalRect(after: previousView, in: boundSize, initialRect: initialRect, margin: margin, .relatively)
			
		case .verticallyEqualSizedRelative(initial: let initialRect, margin: let margin):
			return self.getVerticalRect(after: previousView, in: boundSize, initialRect: initialRect, margin: margin, .relatively)
			
		case .customByFrame(initial: let initialRectClosure, rest: let restRectClosure):
			return self.getRect(after: previousView, in: boundSize, initial: initialRectClosure, rest: restRectClosure)
			
		}
		
	}
	
}
