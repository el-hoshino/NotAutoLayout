//
//  Layout.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

/// An `enum` used to store the `Frame` value, or the closure(s) to retrieve the `Frame` value, from serveral ways available.
public enum Layout {
	
	/// Layout cases for individual subviews.
	case individual(Individual)
	
	/// Layout cases for sequential subviews.
	case sequential(Sequential)
	
	/// Layout cases for matrical subviews.
	case matrical(Matrical)
	
}

extension Layout {
	
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

// MARK: Individual Layout making methods
extension Layout {
	
	/// Make a `Layout` of individual absolute `Frame` value.
	///
	/// - Parameter frame: The absolute `Frame` value.
	/// - Returns: The `Layout` value that contains that individual absolute `Frame` value.
	public static func makeAbsolute(frame: Frame) -> Layout {
		return .individual(.absolute(frame))
	}
	
	/// Maket a `Layout` of individual absolute frame value in UIKit style `CGRect`.
	///
	/// - Parameter frame: The absolute frame value in `CGRect`.
	/// - Returns: The `Layout` value that contains that individual absolute frame value.
	public static func makeAbsolute(frame: CGRect) -> Layout {
		let layoutFrame = Frame(reference: .topLeft, origin: frame.origin, size: frame.size)
		return makeAbsolute(frame: layoutFrame)
	}
	
	/// Make a `Layout` of individual relative `Frame` value.
	///
	/// - Parameter frame: The relative `Frame` value.
	/// - Returns: The `Layout` value that contains that individual relative `Frame` value.
	public static func makeRelative(frame: Frame) -> Layout {
		return .individual(.relative(frame))
	}
	
	/// Make a `Layout` of individual relative frame value in UIKit style CGRect.
	///
	/// - Parameter frame: The relative frame value in `CGRect`.
	/// - Returns: The `Layout` value that contains that individual relative frame value.
	public static func makeRelative(frame: CGRect) -> Layout {
		let layoutFrame = Frame(reference: .topLeft, origin: frame.origin, size: frame.size)
		return makeRelative(frame: layoutFrame)
	}
	
	/// Make a `Layout` of individual insets value.
	///
	/// - Parameter insets: The insets value.
	/// - Returns: The `Layout` value that contains that insets value.
	public static func makeInsets(insets: UIEdgeInsets) -> Layout {
		return .individual(.insets(insets))
	}
	
	/// Make a `Layout` of individual `customByFrame` value.
	///
	/// - Parameter frame: The `Frame` value closure which will be produced from the bound size.
	/// - Returns: The `Layout` that contains that closure.
	public static func makeCustom(frame: @escaping Individual.SizeToFrame) -> Layout {
		return .individual(.customByFrame(frame: frame))
	}
	
	/// Make a `Layout` of individual `customByOriginSize` value.
	///
	/// - Parameters:
	///   - origin: The CGPoint origin value closure which will be produced from the bound size.
	///   - size: The CGSize size value closure which will be produced from the bound size.
	/// - Returns: The Layout value that contains those closures.
	public static func makeCustom(origin: @escaping Individual.SizeToPoint, size: @escaping Individual.SizeToSize) -> Layout {
		return .individual(.customByOriginSize(origin: origin, size: size))
	}
	
	/// Make a `Layout` of individual `customByXYWidthHeight` value.
	///
	/// - Parameters:
	///   - x: The `CGFloat` x value closure which will be produced from the bound size.
	///   - y: The `CGFloat` y value closure which will be produced from the bound size.
	///   - width: The `CGFloat` width value closure which will be produced from the bound size.
	///   - height: The `CGFloat` height value closure which will be produced from the bound size.
	/// - Returns: The `Layout` value that contains those closures.
	public static func makeCustom(x: @escaping Individual.SizeToFloat, y: @escaping Individual.SizeToFloat, width: @escaping Individual.SizeToFloat, height: @escaping Individual.SizeToFloat) -> Layout {
		return .individual(.customByXYWidthHeight(x: x, y: y, width: width, height: height))
	}
	
	/// Make a `Layout` of individual `customByFittingSizeFrame` value.
	///
	/// - Parameters:
	///   - fittingSize: The `CGSize` value that will be used as the parameter in `UIView#sizeThatFits(_ size: CGSize)`.
	///   - frame: The `Frame` value closure which will be produced from the fitted size retrieved from `linkedSubview.sizeThatFits(fittingSize)` and the bound size.
	/// - Returns: The `Layout` value that contains that Frame closure.
	public static func makeCustome(thatFits fittingSize: @escaping Individual.BoundSizeToFittingSize, frame: @escaping Individual.FittedSizeBoundSizeToFrame) -> Layout {
		return .individual(.customByFittingSizeFrame(fittingSize: fittingSize, frame: frame))
	}
	
}

// MARK: Sequential Layout making methods
extension Layout {
	
	/// Make a `Layout` of sequential absolute `Frame` value.
	///
	/// - Parameters:
	///   - initialFrame: The absolute `Frame` value if the linked subview is the first in the subviews sequence.
	///   - margin: The margin distance between the linked subview and the subview before it, if it's not the first in the subviews sequence.
	///   - direction: The margin direction between the linked subview and the subview before it, if it's not the first in the subviews sequence.
	/// - Returns: The `Layout` value that contains this sequential absolute `Frame` value.
	public static func makeAbsolute(initialFrame: Frame, margin: CGFloat, direction: Layout.Sequential.Direction) -> Layout {
		switch direction {
		case .horizontal:
			return .sequential(.horizontallyEqualSizedAbsolute(initial: initialFrame, margin: margin))
			
		case .vertical:
			return .sequential(.verticallyEqualSizedAbsolute(initial: initialFrame, margin: margin))
		}
	}
	
	/// Make a `Layout` of sequential absolute frame value in UIKit style `CGRect`.
	///
	/// - Parameters:
	///   - initialFrame: The absolute frame value in `CGRect` if the linked subview is the first in the subviews sequence.
	///   - margin: The margin distance between the linked subview and the subview before it, if it's not the first in the subviews sequence.
	///   - direction: The margin direction between the linked subview and the subview before it, if it's not the first in the subviews sequence.
	/// - Returns: The `Layout` value that contains that sequential absolute frame value.
	public static func makeAbsolute(initialFrame: CGRect, margin: CGFloat, direction: Layout.Sequential.Direction) -> Layout {
		let layoutFrame = Frame(reference: .topLeft, origin: initialFrame.origin, size: initialFrame.size)
		return makeAbsolute(initialFrame: layoutFrame, margin: margin, direction: direction)
	}
	
	/// Make a `Layout` of sequential relative `Frame` value.
	///
	/// - Parameters:
	///   - initialFrame: The relative `Frame` value if the linked subview is the first in the subviews sequence.
	///   - margin: The margin distance between the linked subview and the subview before it, if it's not the first in the subviews sequence.
	///   - direction: The margin direction between the linked subview and the subview before it, if it's not the first in the subviews sequence.
	/// - Returns: The `Layout` value that contains that sequential relative `Frame` value.
	public static func makeRelative(initialFrame: Frame, margin: CGFloat, direction: Layout.Sequential.Direction) -> Layout {
		switch direction {
		case .horizontal:
			return .sequential(.horizontallyEqualSizedRelative(initial: initialFrame, margin: margin))
			
		case .vertical:
			return .sequential(.verticallyEqualSizedRelative(initial: initialFrame, margin: margin))
		}
	}
	
	/// Make a `Layout` of sequential relative frame value in UIKit style `CGRect`.
	///
	/// - Parameters:
	///   - initialFrame: The relative frame value in UIKit style `CGRect` if the linked subview is the first in the subviews sequence.
	///   - margin: The margin distance between the linked subview and the subview before it, if it's not the first in the subviews sequence.
	///   - direction: The margin direction between the linked subview and the subview before it, if it's not the first in the subviews sequence.
	/// - Returns: The `Layout` value that contains that sequential relative frame value.
	public static func makeRelative(initialFrame: CGRect, margin: CGFloat, direction: Layout.Sequential.Direction) -> Layout {
		let layoutFrame = Frame(reference: .topLeft, origin: initialFrame.origin, size: initialFrame.size)
		return makeRelative(initialFrame: layoutFrame, margin: margin, direction: direction)
	}
	
	/// Make a `Layout` of sequential `customByFrame` value.
	///
	/// - Parameters:
	///   - initialFrame: The `Frame` value closure which will be produced from the bound size, if the linked subview is the first in the subviews sequence.
	///   - restFrame: The `Frame` value closure which will be produced from the frame in `CGRect` of the subview before the linked subview, and the bound size, if the linked subview is not the first in the subviews sequence.
	/// - Returns: The `Layout` value that contains those closures.
	public static func makeCustom(initialFrame: @escaping Sequential.SizeToFrame, restFrame: @escaping Sequential.PreviousFrameAndSizeToFrame) -> Layout {
		return .sequential(.customByFrame(initial: initialFrame, rest: restFrame))
	}
	
	/// Make a `Layout` of sequential `customByFittingSizeFrame` value.
	///
	/// - Parameters:
	///   - fittingSize: The `CGSize` value that will be used as the parameter in `UIView#sizeThatFits(_ size: CGSize)`.
	///   - initialFrame: The `Frame` value closure which will be produced from the fitted size retrieved from `linkedSubview.sizeThatFits(fittingSize)` and the bound size, if the linked subview is the first in the subviews sequence.
	///   - restFrame: The `Frame` value closure which will be produced from the fitted size retrieved from the `linkedSubview.sizeThatFits(fittingSize)`, the frame in `CGRect` of subview before the linked subview, and the bound size, if the linked subview is not the first in the subviews sequence.
	/// - Returns: The `Layout` value that contains those `Frame` closures.
	public static func makeCustom(thatFits fittingSize: CGSize, initialFrame: @escaping Sequential.FittedSizeBoundSizeToFrame, restFrame: @escaping Sequential.PreviousFrameFittedSizeAndSizeToFrame) -> Layout {
		return .sequential(.customByFittingSizeFrame(fittingSize: fittingSize, initial: initialFrame, rest: restFrame))
	}
	
}

// MARK: Matrical Layout making methods
extension Layout {
	
	/// Make a `Layout` of matrical absolute Frame value.
	///
	/// - Parameters:
	///   - initialFrame: The absolute `Frame` value if the linked subview is the first in the subviews matrix.
	///   - margin: The margin in `CGVector`, which `dx` represents the distance between the linked subview and the subview horizontally before it, if it's not horizontally the first in the subviews matrix, and `dy` represents the distance between the linked subview and the subview vertically before it, if it's not vertically the first in the subviews matrix.
	///   - direction: The first priority margin direction between the linked subview and the subview before it in that direction, if it't not the first in the subviews matrix.
	/// - Returns: The `Layout` value that contains this matrical absolute `Frame` value.
	public static func makeAbsolute(initialFrame: Frame, margin: CGVector, direction: Layout.Matrical.Direction) -> Layout {
		switch direction {
		case .horizontalBeforeVertical:
			return .matrical(.horizontallyBeforeVerticallyEqualSizedAbsolute(initial: initialFrame, margin: margin))
			
		case .verticalBeforeHorizontal:
			return .matrical(.verticallyBeforeHorizontallyEqualSizedAbsolute(initial: initialFrame, margin: margin))
		}
	}
	
	/// Make a `Layout` of matrical absolute frame value in UIKit style `CGRect`.
	///
	/// - Parameters:
	///   - initialFrame: The absolute frame value in `CGRect` if the linked subview is the first in the subviews matrix.
	///   - margin: The margin in `CGVector`, which `dx` represents the distance between the linked subview and the subview horizontally before it, if it's not horizontally the first in the subviews matrix, and `dy` represents the distance between the linked subview and the subview vertically before it, if it's not vertically the first in the subviews matrix.
	///   - direction: The first priority margin direction between the linked subview and the subview before it in that direction, if it't not the first in the subviews matrix.
	/// - Returns: The `Layout` value that contains this matrical absolute frame value.
	public static func makeAbsolute(initialFrame: CGRect, margin: CGVector, direction: Layout.Matrical.Direction) -> Layout {
		let layoutFrame = Frame(reference: .topLeft, origin: initialFrame.origin, size: initialFrame.size)
		return makeAbsolute(initialFrame: layoutFrame, margin: margin, direction: direction)
	}
	
	/// Make a `Layout` of matrical relative Frame value.
	///
	/// - Parameters:
	///   - initialFrame: The relative `Frame` value if the linked subview is the first in the subviews matrix.
	///   - margin: The margin in `CGVector`, which `dx` represents the distance between the linked subview and the subview horizontally before it, if it's not horizontally the first in the subviews matrix, and `dy` represents the distance between the linked subview and the subview vertically before it, if it's not vertically the first in the subviews matrix.
	///   - direction: The first priority margin direction between the linked subview and the subview before it in that direction, if it't not the first in the subviews matrix.
	/// - Returns: The `Layout` value that contains this matrical relative `Frame` value.
	public static func makeRelative(initialFrame: Frame, margin: CGVector, direction: Layout.Matrical.Direction) -> Layout {
		switch direction {
		case .horizontalBeforeVertical:
			return .matrical(.horizontallyBeforeVerticallyEqualSizedRelative(initial: initialFrame, margin: margin))
			
		case .verticalBeforeHorizontal:
			return .matrical(.verticallyBeforeHorizontallyEqualSizedRelative(initial: initialFrame, margin: margin))
		}
	}
	
	/// Make a `Layout` of matrical relative frame value in UIKit style `CGRect`.
	///
	/// - Parameters:
	///   - initialFrame: The relative frame value in `CGRect` if the linked subview is the first in the subviews matrix.
	///   - margin: The margin in `CGVector`, which `dx` represents the distance between the linked subview and the subview horizontally before it, if it's not horizontally the first in the subviews matrix, and `dy` represents the distance between the linked subview and the subview vertically before it, if it's not vertically the first in the subviews matrix.
	///   - direction: The first priority margin direction between the linked subview and the subview before it in that direction, if it't not the first in the subviews matrix.
	/// - Returns: The `Layout` value that contains this matrical relative frame value.
	public static func makeRelative(initialFrame: CGRect, margin: CGVector, direction: Layout.Matrical.Direction) -> Layout {
		let layoutFrame = Frame(reference: .topLeft, origin: initialFrame.origin, size: initialFrame.size)
		return makeRelative(initialFrame: layoutFrame, margin: margin, direction: direction)
	}
	
	/// Make a `Layout` of matrical `customByFrame` value.
	///
	/// - Parameters:
	///   - initialFrame: The `Frame` value closure which will be produced from the bound size, if the linked subview is the first in the subviews matrix.
	///   - firstInColFrame: The `Frame` value closure which will be produced from the frame in `CGRect` of the subview before the linked view in row, and the bound size, if the linked subview is the first in the column but not the first in the row of the subviews matrix.
	///   - firstInRowFrame: The `Frame` value closure which will be produced from the frame in `CGRect` of the subview before the linked view in column, and the bound size, if the linked subview is the first in the row but not the first in the column of the subviews matrix.
	///   - restFrame: The `Frame` value closure which will be produced from the frame in `CGRect` of the subview before the linked subview in row, the subview before the linked view in column, and the bound size, if the linked subview is not the first in neither column nor row of the subviews matrix.
	/// - Returns: The `Layout` value that contains those closures.
	public static func makeCustom(initialFrame: @escaping Matrical.SizeToFrame, firstInColFrame: @escaping Matrical.PreviousColFrameAndSizeToFrame, firstInRowFrame: @escaping Matrical.PreviousRowFrameAndSizeToFrame, restFrame: @escaping Matrical.PreviousColRowFrameAndSizeToFrame) -> Layout {
		return .matrical(.customByFrame(initial: initialFrame, firstInCol: firstInColFrame, firstInRow: firstInRowFrame, rest: restFrame))
	}
	
	/// Make a `Layout` of matrical `customByFittingSizeFrame` value.
	///
	/// - Parameters:
	///   - fittingSize: The `CGSize` value that will be used as the parameter in `UIView#sizeThatFits(_ size: CGSize)`.
	///   - initialFrame: The `Frame` value closure which will be produced from the fitted size retrieved from `linkedSubview.sizeThatFits(fittingSize)` and the bound size, if the linked subview is the first in the subviews matrix.
	///   - firstInColFrame: The `Frame` value closure which will be produced from the fitted size retrieved from `linkedSubview.sizeThatFits(fittingSize)`, the frame in `CGRect` of the subview before the linked view in row, and the bound size, if the linked subview is the first in the column but not the first in the row of the subviews matrix.
	///   - firstInRowFrame: The `Frame` value closure which will be produced from the fitted size retrieved from `linkedSubview.sizeThatFits(fittingSize)`, the frame in `CGRect` of the subview before the linked view in column, and the bound size, if the linked subview is the first in the row but not the first in the column of the subviews matrix.
	///   - restFrame: The `Frame` value closure which will be produced from the fitted size retrieved from `linkedSubview.sizeThatFits(fittingSize)`, the frame in `CGRect` of the subview before the linked subview in row, the subview before the linked view in column, and the bound size, if the linked subview is not the first in neither column nor row of the subviews matrix.
	/// - Returns: The `Layout` value that contains those closures.
	public static func makeCustom(thatFits fittingSize: CGSize, initialFrame: @escaping Matrical.FittedSizeBoundSizeToFrame, firstInColFrame: @escaping Matrical.PreviousColFrameFittedSizeAndSizeToFrame, firstInRowFrame: @escaping Matrical.PreviousRowFrameFittedSizeAndSizeToFrame, restFrame: @escaping Matrical.PreviousColRowFrameFittedSizeAndSizeToFrame) -> Layout {
		return .matrical(.customByFittingSizeFrame(fittingSize: fittingSize, initial: initialFrame, firstInCol: firstInColFrame, firstInRow: firstInRowFrame, rest: restFrame))
	}
	
}
