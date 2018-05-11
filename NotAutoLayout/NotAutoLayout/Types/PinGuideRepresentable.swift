//
//  PinGuideRepresentable.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

/// A protocol that shows the type conforms it is able to represent a horizontal float pin guide as `ViewPinGuides.HorizontalFloat.Guide`.
@available(*, renamed: "HorizontalFloatPinGuideRepresentable")
typealias HorizontalPinGuideRepresentable = HorizontalFloatPinGuideRepresentable
public protocol HorizontalFloatPinGuideRepresentable {
	
	/// The layout direction in the pin guide.
	var direction: UIUserInterfaceLayoutDirection { get }
	
	/// The left position in the pin guide.
	var left: Float { get }
	
	/// The center position in the pin guide.
	var center: Float { get }
	
	/// The right position in the pin guide.
	var right: Float { get }
	
	/// The horizontal geometry position at the given coordinate position in the pin guide.
	///
	/// - Parameters:
	///   - coordinatePosition: The horizontal coordinate position in the pin guide.
	///
	/// - Returns: The horizontal geometry position at the given horizontal coordinate position in the pin guide.
	func horizontal(at coordinatePosition: Float) -> Float
	
	/// The leading position in the pin guide, which is either left or right position according to the layout direction.
	var leading: Float { get }
	
	/// The trailing position in the pin guide, which is either left or right position according to the layout direction.
	var trailing: Float { get }
	
	/// The directional horizontal geometry position at the given coordinate position in the pin guide.
	///
	/// - Parameters:
	///   - coordinatePosition: The directional horizontal coordinate position in the pin guide.
	///
	/// - Returns: The directional horizontal geometry position at the given directional horizontal coordinate position in the pin guide.
	func directionalHorizontal(at coordinatePosition: Float) -> Float
	
}

/// A protocol that shows the type conforms it is able to represent a vertical float pin guide as `ViewPinGuides.VerticalFloat.Guide`.
@available(*, renamed: "VerticalFloatPinGuideRepresentable")
typealias VerticalPinGuideRepresentable = VerticalFloatPinGuideRepresentable
public protocol VerticalFloatPinGuideRepresentable {
	
	/// The top position in the pin guide.
	var top: Float { get }
	
	/// The middle position in the pin guide.
	var middle: Float { get }
	
	/// The bottom position in the pin guide.
	var bottom: Float { get }
	
	/// The vertical geometry position at the given coordinate position in the pin guide.
	///
	/// - Parameters:
	///   - coordinatePosition: The vertical coordinate position in the pin guide.
	///
	/// - Returns: The vertical geometry position at the given vertical coordinate position in the pin guide.
	func vertical(at coordinatePosition: Float) -> Float
	
}

/// A protocol that shows the type conforms it is able to represent a point pin guide as `ViewPinGuides.Point.Guide`.
public protocol PointPinGuideRepresentable {
	
	/// The layout direction in the pin guide.
	var direction: UIUserInterfaceLayoutDirection { get }
	
	/// The top left point in the pin guide.
	var topLeft: Point { get }
	
	/// The top center point in the pin guide.
	var topCenter: Point { get }
	
	/// The top right point in the pin guide.
	var topRight: Point { get }
	
	/// The middle left point in the pin guide.
	var middleLeft: Point { get }
	
	/// The middle center point in the pin guide.
	var middleCenter: Point { get }
	
	/// The middle right point in the pin guide.
	var middleRight: Point { get }
	
	/// The bottom left point in the pin guide.
	var bottomLeft: Point { get }
	
	/// The bottom center point in the pin guide.
	var bottomCenter: Point { get }
	
	/// The bottom right point in the pin guide.
	var bottomRight: Point { get }
	
	/// The geometry point at the given coordinate point in the pin guide.
	///
	/// - Parameters:
	///   - coordinatePoint: The coordinate point in the pin guide.
	///
	/// - Returns: The geometry point at the given coordinate point in the pin guide.
	func point(at coordinatePoint: Point) -> Point
	
	/// The geometry point at the given coordinate point (produced from coordinateX and coordinateY) in the pin guide.
	///
	/// - Parameters:
	///   - coordinateX: The horizontal coordinate position in the pin guide.
	///   - coordinateY: The vertical coordinate position in the pin guide.
	///
	/// - Returns: The geometry point at the given coordinate point in the pin guide.
	func pointAt(x coordinateX: Float, y coordinateY: Float) -> Point
	
	/// The top leading point in the pin guide, which leading is either left or right position according to the layout direction.
	var topLeading: Point { get }
	
	/// The top trailing point in the pin guide, which trailing is either left or right position according to the layout direction.
	var topTrailing: Point { get }
	
	/// The middle leading point in the pin guide, which leading is either left or right position according to the layout direction.
	var midddleLeading: Point { get }
	
	/// The middle trailing point in the pin guide, which trailing is either left or right position according to the layout direction.
	var middleTrailing: Point { get }
	
	/// The bottom leading point in the pin guide, which leading is either left or right position according to the layout direction.
	var bottomLeading: Point { get }
	
	/// The bottom trailing point in the pin guide, which trailing is either left or right position according to the layout direction.
	var bottomTrailing: Point { get }
	
}
