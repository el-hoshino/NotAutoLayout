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
		
		public typealias SizeToFrame = (CGSize) -> CGRect
		public typealias SizeToPoint = (CGSize) -> CGPoint
		public typealias SizeToSize = (CGSize) -> CGSize
		public typealias SizeToFloat = (CGSize) -> CGFloat
		
		case absolute(CGRect)
		case relative(CGRect)
		
		case insets(UIEdgeInsets)
		
		case offset(value: UIOffset, from: OffsetOrigin, size: CGSize)
		
		case customByFrame(frame: SizeToFrame)
		case customByOriginSize(origin: SizeToPoint, size: SizeToSize)
		case customByXYWidthHeight(x: SizeToFloat, y: SizeToFloat, width: SizeToFloat, height: SizeToFloat)
		
		@available(*, deprecated: 0.6, message: "Use customByFrame, customByOriginSize or customByXYWidthHeight instead")
		case custom((CGSize) -> CGRect)
		
	}
	
	public enum Sequential {
		
		public typealias SizeToFrame = (CGSize) -> CGRect
		public typealias PreviousFrameAndSizeToFrame = (_ previousFrame: CGRect, _ boundSize: CGSize) -> CGRect
		
		case horizontallyEqualSizedAbsolute(initial: CGRect, margin: CGFloat)
		case verticallyEqualSizedAbsolute(initial: CGRect, margin: CGFloat)
		
		case horizontallyEqualSizedRelative(initial: CGRect, margin: CGFloat)
		case verticallyEqualSizedRelative(initial: CGRect, margin: CGFloat)
		
		case customByFrame(initial: SizeToFrame, rest: PreviousFrameAndSizeToFrame)
		
	}
	
	public enum Matrical {
		
		public typealias SizeToFrame = (CGSize) -> CGRect
		public typealias PreviousColFrameAndSizeToFrame = (_ previousColFrame: CGRect, _ boundSize: CGSize) -> CGRect
		public typealias PreviousRowFrameAndSizeToFrame = (_ previousRowFrame: CGRect, _ boundSize: CGSize) -> CGRect
		public typealias PreviousRowColFrameAndSizeToFrame = (_ previousRowFrame: CGRect, _ previousColFrame: CGRect, _ boundSize: CGSize) -> CGRect
		
		case horizontallyEqualSizedAbsolute(initial: CGRect, margin: CGVector)
		case verticallyEqualSizedAbsolute(initial: CGRect, margin: CGVector)
		
		case horizontallyEqualSizedRelative(initial: CGRect, margin: CGVector)
		case verticallyEqualSizedRelative(initial: CGRect, margin: CGVector)
		
		case customByFrame(initial: SizeToFrame, firstInCol: PreviousColFrameAndSizeToFrame, firstInRow: PreviousRowFrameAndSizeToFrame, rest: PreviousRowColFrameAndSizeToFrame)
		
	}
	
	case individual(Individual)
	case sequential(Sequential)
	case matrical(Matrical)
	
}

extension LayoutPosition {
	
	var isSequential: Bool {
		switch self {
		case .sequential:
			return true
			
		case _:
			return false
		}
	}
	
	var isMatrical: Bool {
		switch self {
		case .matrical:
			return true
			
		case _:
			return false
		}
	}
	
}

extension LayoutPosition {
	
	public typealias IndividualSizeToFrame = Individual.SizeToFrame
	public typealias IndividualSizeToPoint = Individual.SizeToPoint
	public typealias IndividualSizeToSize = Individual.SizeToSize
	public typealias IndividualSizeToFloat = Individual.SizeToFloat
	
	public static func makeAbsolute(frame: CGRect) -> LayoutPosition {
		return .individual(.absolute(frame))
	}
	
	public static func makeRelative(frame: CGRect) -> LayoutPosition {
		return .individual(.relative(frame))
	}
	
	public static func makeInsets(insets: UIEdgeInsets) -> LayoutPosition {
		return .individual(.insets(insets))
	}
	
	public static func makeOffset(value: UIOffset, from base: OffsetOrigin, size: CGSize) -> LayoutPosition {
		return .individual(.offset(value: value, from: base, size: size))
	}
	
	public static func makeCustom(frame: @escaping IndividualSizeToFrame) -> LayoutPosition {
		return .individual(.customByFrame(frame: frame))
	}
	
	public static func makeCustom(origin: @escaping IndividualSizeToPoint, size: @escaping IndividualSizeToSize) -> LayoutPosition {
		return .individual(.customByOriginSize(origin: origin, size: size))
	}
	
	public static func makeCustom(x: @escaping IndividualSizeToFloat, y: @escaping IndividualSizeToFloat, width: @escaping IndividualSizeToFloat, height: @escaping IndividualSizeToFloat) -> LayoutPosition {
		return .individual(.customByXYWidthHeight(x: x, y: y, width: width, height: height))
	}
	
}

extension LayoutPosition.Sequential {
	
	public enum Direction {
		case horizontal
		case vertical
	}
	
}

extension LayoutPosition {
	
	public typealias SequentialSizeToFrame = Sequential.SizeToFrame
	public typealias SequentialPreviousFrameAndSizeToFrame = Sequential.PreviousFrameAndSizeToFrame
	
	public static func makeAbsolute(initialFrame: CGRect, margin: CGFloat, direction: LayoutPosition.Sequential.Direction) -> LayoutPosition {
		switch direction {
		case .horizontal:
			return .sequential(.horizontallyEqualSizedAbsolute(initial: initialFrame, margin: margin))
			
		case .vertical:
			return .sequential(.verticallyEqualSizedAbsolute(initial: initialFrame, margin: margin))
		}
	}
	
	public static func makeRelative(initialFrame: CGRect, margin: CGFloat, direction: LayoutPosition.Sequential.Direction) -> LayoutPosition {
		switch direction {
		case .horizontal:
			return .sequential(.horizontallyEqualSizedRelative(initial: initialFrame, margin: margin))
			
		case .vertical:
			return .sequential(.verticallyEqualSizedRelative(initial: initialFrame, margin: margin))
		}
	}
	
	public static func makeCustom(initialFrame: @escaping SequentialSizeToFrame, restFrame: @escaping SequentialPreviousFrameAndSizeToFrame) -> LayoutPosition {
		return .sequential(.customByFrame(initial: initialFrame, rest: restFrame))
	}
	
}

extension LayoutPosition.Matrical {
	
	public enum Direction {
		case horizontal
		case vertical
	}
	
}

extension LayoutPosition {
	
	public typealias MatricalSizeToFrame = Matrical.SizeToFrame
	public typealias MatricalPreviousColFrameAndSizeToFrame = Matrical.PreviousColFrameAndSizeToFrame
	public typealias MatricalPreviousRowFrameAndSizeToFrame = Matrical.PreviousRowFrameAndSizeToFrame
	public typealias MatricalPreviousRowColFrameAndSizeToFrame = Matrical.PreviousRowColFrameAndSizeToFrame
	
	public static func makeAbsolute(initialFrame: CGRect, margin: CGVector, direction: LayoutPosition.Matrical.Direction) -> LayoutPosition {
		switch direction {
		case .horizontal:
			return .matrical(.horizontallyEqualSizedAbsolute(initial: initialFrame, margin: margin))
			
		case .vertical:
			return .matrical(.verticallyEqualSizedAbsolute(initial: initialFrame, margin: margin))
		}
	}
	
	public static func makeRelative(initialFrame: CGRect, margin: CGVector, direction: LayoutPosition.Matrical.Direction) -> LayoutPosition {
		switch direction {
		case .horizontal:
			return .matrical(.horizontallyEqualSizedRelative(initial: initialFrame, margin: margin))
			
		case .vertical:
			return .matrical(.verticallyEqualSizedRelative(initial: initialFrame, margin: margin))
		}
	}
	
	public static func makeCustom(initialFrame: @escaping MatricalSizeToFrame, firstInCol: @escaping MatricalPreviousColFrameAndSizeToFrame, firstInRow: @escaping MatricalPreviousRowFrameAndSizeToFrame, rest: @escaping MatricalPreviousRowColFrameAndSizeToFrame) -> LayoutPosition {
		return .matrical(.customByFrame(initial: initialFrame, firstInCol: firstInCol, firstInRow: firstInRow, rest: rest))
	}
	
}
