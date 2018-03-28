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
	
	/// The left position in the layout guide.
	var left: Float { get }
	
	/// The center position in the layout guide.
	var center: Float { get }
	
	/// The right position in the layout guide.
	var right: Float { get }
	
	/// The width in the layout guide.
	var width: Float { get }
	
	/// The horizontal geometry position at the given coordinate position in the layout guide.
	///
	/// - Parameters:
	///   - coordinatePosition: The horizontal coordinate position in the layout guide.
	///
	/// - Returns: The horizontal geometry position at the given horizontal coordinate position in the layout guide.
	func horizontal(at coordinatePosition: Float) -> Float
	
	/// The top position in the layout guide.
	var top: Float { get }
	
	/// The middle position in the layout guide.
	var middle: Float { get }
	
	/// The bottom position in the layout guide.
	var bottom: Float { get }
	
	/// The height in the layout guide.
	var height: Float { get }
	
	/// The vertical geometry position at the given coordinate position in the layout guide.
	///
	/// - Parameters:
	///   - coordinatePosition: The vertical coordinate position in the layout guide.
	///
	/// - Returns: The vertical geometry position at the given vertical coordinate position in the layout guide.
	func vertical(at coordinatePosition: Float) -> Float
	
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
	
	/// The size in the layout guide.
	var size: Size { get }
	
	/// The geometry point at the given coordinate point in the layout guide.
	///
	/// - Parameters:
	///   - coordinatePoint: The coordinate point in the layout guide.
	///
	/// - Returns: The geometry point at the given coordinate point in the layout guide.
	func point(at coordinatePoint: Point) -> Point
	
	/// The frame in the layout guide.
	var frame: Rect { get }
	
	/// The frame inside the layout guide's frame with given insets.
	///
	/// - Parameters:
	///   - insets: The insets inside the layout guide's frame.
	///
	/// - Returns: A new frame inside the layout guide's frame with given insets.
	func frame(inside insets: Insets) -> Rect
	
	/// The leading position in the layout guide, which is either left or right position according to the layout direction.
	var leading: Float { get }
	
	/// The trailing position in the layout guide, which is either left or right position according to the layout direction.
	var trailing: Float { get }

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
	
}
