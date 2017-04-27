//
//  Frame.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/04/04.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

/// Horizontal reference line.
///
/// - left: The left boundary line of a view.
/// - center: The horizontally center line of a view.
/// - right: The right boundary line of a view.
public enum HorizontalReference {
	case left
	case center
	case right
}

/// Vertical reference line.
///
/// - top: The top boundary line of a view.
/// - middle: The vertically center line of a view.
/// - bottom: The bottom boundary line of a view.
public enum VerticalReference {
	case top
	case middle
	case bottom
}

/// Reference point, made up from the cross point of horizontal reference line and vertical reference line.
public struct ReferencePoint {
	
	/// Horizontal reference line.
	public var horizontal: HorizontalReference
	/// Vertical reference line.
	public var vertical: VerticalReference
	
	/// Initialize a reference point.
	///
	/// - Parameters:
	///   - horizontal: horizontal reference point.
	///   - vertical: vertical reference point.
	public init(horizontal: HorizontalReference, vertical: VerticalReference) {
		self.horizontal = horizontal
		self.vertical = vertical
	}
	
}

extension ReferencePoint {
	
	/// A reference point made up from horizontally left and vertically top reference line.
	public static let topLeft = ReferencePoint(horizontal: .left, vertical: .top)
	
	/// A reference point made up from horizontally center and vertically top reference line.
	public static let topCenter = ReferencePoint(horizontal: .center, vertical: .top)
	
	/// A reference point made up from horizontally right and vertically top reference line.
	public static let topRight = ReferencePoint(horizontal: .right, vertical: .top)
	
	
	/// A reference point made up from horizontally left and vertically middle reference line.
	public static let middleLeft = ReferencePoint(horizontal: .left, vertical: .middle)
	
	/// A reference point made up from horizontally center and vertically middle reference line.
	public static let middleCenter = ReferencePoint(horizontal: .center, vertical: .middle)
	
	/// A reference point made up from horizontally right and vertically middle reference line.
	public static let middleRight = ReferencePoint(horizontal: .right, vertical: .middle)
	
	
	/// A reference point made up from horizontally left and vertically bottom reference line.
	public static let bottomLeft = ReferencePoint(horizontal: .left, vertical: .bottom)
	
	/// A reference point made up from horizontally center and vertically bottom reference line.
	public static let bottomCenter = ReferencePoint(horizontal: .center, vertical: .bottom)
	
	/// A reference point made up from horizontally right and vertically bottom reference line.
	public static let bottomRight = ReferencePoint(horizontal: .right, vertical: .bottom)
	
}

/// A struct used to store the frame information for a view.
public struct Frame {
	
	/// The reference point of both current view and linked child view which is used to calculate the origin.
	public var reference: ReferencePoint
	/// The distance point from the reference point of current view to the reference point of linked child view.
	public var origin: CGPoint
	/// The bound size of the linked child view.
	public var size: CGSize
	
	/// Initialize a Frame.
	///
	/// - Parameters:
	///   - reference: reference point.
	///   - origin: origin point.
	///   - size: bound size.
	public init(reference: ReferencePoint, origin: CGPoint, size: CGSize) {
		self.reference = reference
		self.origin = origin
		self.size = size
	}
	
}

extension Frame {
	
	/// Initialize a Frame
	///
	/// - Parameters:
	///   - x: The distance from the horizontal reference line of the current view to the horizontal reference line of the linked child view.
	///   - xReference: The horizontal reference line of the current view and the linked child view.
	///   - y: The distance from the vertical reference line of current view to the vertical reference line of linked child view.
	///   - yReference: The vertical reference line of the current view and the linked child view.
	///   - width: The width of linked child view.
	///   - height: The height of linked child view.
	public init(x: CGFloat, from xReference: HorizontalReference = .left, y: CGFloat, from yReference: VerticalReference = .top, width: CGFloat, height: CGFloat) {
		
		let reference = ReferencePoint(horizontal: xReference, vertical: yReference)
		let origin = CGPoint(x: x, y: y)
		let size = CGSize(width: width, height: height)
		
		self.reference = reference
		self.origin = origin
		self.size = size
		
	}
	
}

extension Frame {
	
	/// The distance from the horizontal reference line of the current view to the horizontal reference line of the linked child view.
	public var x: CGFloat {
		return self.origin.x
	}
	
	/// The distance from the vertical reference line of current view to the vertical reference line of linked child view.
	public var y: CGFloat {
		return self.origin.y
	}
	
	/// The width of linked child view.
	public var width: CGFloat {
		return self.size.width
	}
	
	/// The height of linked child view.
	public var height: CGFloat {
		return self.size.height
	}
	
}

extension Frame {
	
	func bounds(in canvasSize: CGSize) -> Bounds {
		
		let x: CGFloat
		let y: CGFloat
		
		switch self.reference.horizontal {
		case .left:
			x = self.origin.x + (self.size.width / 2)
			
		case .center:
			x = self.origin.x + (canvasSize.width / 2)
			
		case .right:
			x = self.origin.x + canvasSize.width - (self.size.width / 2)
		}
		
		switch self.reference.vertical {
		case .top:
			y = self.origin.y + (self.size.height / 2)
			
		case .middle:
			y = self.origin.y + (canvasSize.height / 2)
			
		case .bottom:
			y = self.origin.y + canvasSize.height - (self.size.height / 2)
		}
		
		let center = CGPoint(x: x, y: y)
		let bounds = Bounds(center: center, size: self.size)
		
		return bounds
		
	}
	
}

/// Multiply a Frame with a CGFloat.
///
/// - Parameters:
///   - lhs: Frame.
///   - rhs: Scale in scalar value.
/// - Returns: The multiplied Frame value.
public func * (lhs: Frame, rhs: CGFloat) -> Frame {
	
	let x = lhs.x * rhs
	let y = lhs.y * rhs
	let width = lhs.width * rhs
	let height = lhs.height * rhs
	
	let origin = CGPoint(x: x, y: y)
	let size = CGSize(width: width, height: height)
	
	let frame = Frame(reference: lhs.reference, origin: origin, size: size)
	
	return frame
	
}

/// Multiply a Frame by a CGFloat.
///
/// - Parameters:
///   - lhs: Frame.
///   - rhs: Scale in scalar value.
public func *= (lhs: inout Frame, rhs: CGFloat) {
	lhs = lhs * rhs
}

/// Deevide a Frame with a CGFloat.
///
/// - Parameters:
///   - lhs: Frame.
///   - rhs: Scale in scalar value.
/// - Returns: The devided Frame value.
public func / (lhs: Frame, rhs: CGFloat) -> Frame {
	
	let x = lhs.x / rhs
	let y = lhs.y / rhs
	let width = lhs.width / rhs
	let height = lhs.height / rhs
	
	let origin = CGPoint(x: x, y: y)
	let size = CGSize(width: width, height: height)
	
	let frame = Frame(reference: lhs.reference, origin: origin, size: size)
	
	return frame
	
}

/// Deevide a Frame by a CGFloat.
///
/// - Parameters:
///   - lhs: Frame.
///   - rhs: Scale in scalar value.
public func /= (lhs: inout Frame, rhs: CGFloat) {
	lhs = lhs / rhs
}
