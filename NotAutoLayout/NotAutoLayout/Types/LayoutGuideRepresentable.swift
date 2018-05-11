//
//  LayoutGuideRepresentable.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/15.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

/// A protocol that shows the type conforms it is able to represent a layout guide as `ViewLayoutGuides`.
public protocol LayoutGuideRepresentable {
	
	/// The layout direction in the layout guide.
	var direction: UIUserInterfaceLayoutDirection { get }
	
	// MARK: - Horizontal Float
	
	/// The left position in the layout guide.
	var left: Float { get }
	
	/// The center position in the layout guide.
	var center: Float { get }
	
	/// The right position in the layout guide.
	var right: Float { get }
	
	/// The leading position in the layout guide, which is either left or right position according to the layout direction.
	var leading: Float { get }
	
	/// The trailing position in the layout guide, which is either left or right position according to the layout direction.
	var trailing: Float { get }
	
	/// The horizontal geometry position at the given coordinate position in the layout guide.
	///
	/// - Parameters:
	///   - coordinatePosition: The horizontal coordinate position in the layout guide.
	///
	/// - Returns: The horizontal geometry position at the given horizontal coordinate position in the layout guide.
	func horizontal(at coordinatePosition: Float) -> Float
	
	/// The directional horizontal geometry position at the given coordinate position in the layout guide.
	///
	/// - Parameters:
	///   - coordinatePosition: The horizontal coordinate position in the layout guide.
	///
	/// - Returns: The directional horizontal geometry position at the given horizontal coordinate position in the layout guide.
	func directionalHorizontal(at coordinatePosition: Float) -> Float
	
	// MARK: - Vertical Float
	
	/// The top position in the layout guide.
	var top: Float { get }
	
	/// The middle position in the layout guide.
	var middle: Float { get }
	
	/// The bottom position in the layout guide.
	var bottom: Float { get }
	
	/// The vertical geometry position at the given coordinate position in the layout guide.
	///
	/// - Parameters:
	///   - coordinatePosition: The vertical coordinate position in the layout guide.
	///
	/// - Returns: The vertical geometry position at the given vertical coordinate position in the layout guide.
	func vertical(at coordinatePosition: Float) -> Float
	
	// MARK: - Horizontal Span
	
	/// The span from left to center in the layout guide.
	var fromLeftToCenter: Span { get }
	
	/// The span from left to right in the layout guide.
	var fromLeftToRight: Span { get }
	
	/// The span from center to left in the layout guide.
	var fromCenterToLeft: Span { get }
	
	/// The span from center to right in the layout guide.
	var fromCenterToRight: Span { get }
	
	/// The span from right to left in the layout guide.
	var fromRightToLeft: Span { get }
	
	/// The span from right to center in the layout guide.
	var fromRightToCenter: Span { get }
	
	/// The span from leading to center in the layout guide.
	var fromLeadingToCenter: Span { get }
	
	/// The span from leading to trailing in the layout guide.
	var fromLeadingToTrailing: Span { get }
	
	/// The span from center to leading in the layout guide.
	var fromCenterToLeading: Span { get }
	
	/// The span from center to trailing in the layout guide.
	var fromCenterToTrailing: Span { get }
	
	/// The span from trailing to left in the layout guide.
	var fromTrailingToLeading: Span { get }
	
	/// The span from trailing to center in the layout guide.
	var fromTrailingToCenter: Span { get }
	
	/// The horizontal span from a horizontal geometry position at the given horizontal coordinate position to the other in the layout guide.
	///
	/// - Parameters:
	///   - coordinatePositionA: The start point of the horizontal coordinate position in the layout guide.
	///   - coordinatePositionB: The end point of the horizontal coordinate position in the layout guide.
	///
	/// - Returns: The horizontal span from a horizontal geometry position at the given horizontal coordinate position to the other in the layout guide.
	func horizontal(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span
	
	/// The directional horizontal span from a directional horizontal geometry position at the given horizontal coordinate position to the other in the layout guide.
	///
	/// - Parameters:
	///   - coordinatePositionA: The start point of the horizontal coordinate position in the layout guide.
	///   - coordinatePositionB: The end point of the horizontal coordinate position in the layout guide.
	///
	/// - Returns: The directional horizontal span from a directional horizontal geometry position at the given horizontal coordinate position to the other in the layout guide.
	func directionalHorizontal(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span
	
	// MARK: - Vertical Span
	
	/// The span from top to middle in the layout guide.
	var fromTopToMiddle: Span { get }
	
	/// The span from top to bottom in the layout guide.
	var fromTopToBottom: Span { get }
	
	/// The span from middle to top in the layout guide.
	var fromMiddleToTop: Span { get }
	
	/// The span from middle to bottom in the layout guide.
	var fromMiddleToBottom: Span { get }
	
	/// The span from bottom to top in the layout guide.
	var fromBottomToTop: Span { get }
	
	/// The span from bottom to middle in the layout guide.
	var fromBottomToMiddle: Span { get }
	
	/// The vertical geometry position at the given vertical coordinate position in the layout guide.
	///
	/// - Parameters:
	///   - coordinatePosition: The vertical coordinate position in the layout guide.
	///
	/// - Returns: The vertical geometry position at the given vertical coordinate position in the layout guide.
	func vertical(from coordinatePositionA: Float, to coordinatePositionB: Float) -> Span
	
	// MARK: - Point
	
	/// The top left point in the layout guide.
	var topLeft: Point { get }
	
	/// The top center point in the layout guide.
	var topCenter: Point { get }
	
	/// The top right point in the layout guide.
	var topRight: Point { get }
	
	/// The middle left point in the layout guide.
	var middleLeft: Point { get }
	
	/// The middle center point in the layout guide.
	var middleCenter: Point { get }
	
	/// The middle right point in the layout guide.
	var middleRight: Point { get }
	
	/// The bottom left point in the layout guide.
	var bottomLeft: Point { get }
	
	/// The bottom center point in the layout guide.
	var bottomCenter: Point { get }
	
	/// The bottom right point in the layout guide.
	var bottomRight: Point { get }
	
	/// The top leading point in the layout guide, which leading is either left or right position according to the layout direction.
	var topLeading: Point { get }
	
	/// The top trailing point in the layout guide, which trailing is either left or right position according to the layout direction.
	var topTrailing: Point { get }
	
	/// The middle leading point in the layout guide, which leading is either left or right position according to the layout direction.
	var midddleLeading: Point { get }
	
	/// The middle trailing point in the layout guide, which trailing is either left or right position according to the layout direction.
	var middleTrailing: Point { get }
	
	/// The bottom leading point in the layout guide, which leading is either left or right position according to the layout direction.
	var bottomLeading: Point { get }
	
	/// The bottom trailing point in the layout guide, which trailing is either left or right position according to the layout direction.
	var bottomTrailing: Point { get }
	
	/// The geometry point at the given coordinate point in the layout guide.
	///
	/// - Parameters:
	///   - coordinatePoint: The coordinate point in the layout guide.
	///
	/// - Returns: The geometry point at the given coordinate point in the layout guide.
	func point(at coordinatePoint: Point) -> Point
	
	/// The directional geometry point at the given coordinate point in the layout guide.
	///
	/// - Parameters:
	///   - coordinatePoint: The coordinate point in the layout guide.
	///
	/// - Returns: The geometry point at the given coordinate point in the layout guide.
	func directionalPoint(at coordinatePoint: Point) -> Point
	
	// MARK: - Length
	
	/// The width in the layout guide.
	var width: Float { get }
	
	/// The height in the layout guide.
	var height: Float { get }
	
	// MARK: - Size
	
	/// The size in the layout guide.
	var size: Size { get }
	
	// MARK: - Rect
	
	/// The frame in the layout guide.
	var frame: Rect { get }
	
	/// The frame inside the layout guide's frame with given insets.
	///
	/// - Parameters:
	///   - insets: The insets inside the layout guide's frame.
	///
	/// - Returns: A new frame inside the layout guide's frame with given insets.
	func frame(inside insets: Insets) -> Rect
	
}
