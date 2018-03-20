//
//  PinGuideRepresentable.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public protocol HorizontalPinGuideRepresentable {
	
	
	var left: Float { get }
	
	var center: Float { get }
	
	var right: Float { get }
	
	func horizontal(at relativePosition: Float) -> Float
	
	var leading: Float { get }
	
	var trailing: Float { get }
	
}

public protocol VerticalPinGuideRepresentable {
	
	var pinGuide: ViewPinGuides.Vertical.Guide { get }
	
	var top: Float { get }
	
	var middle: Float { get }
	
	var bottom: Float { get }
	
	func vertical(at relativePosition: Float) -> Float
	
}

public protocol PointPinGuideRepresentable {
	
	var pinGuide: ViewPinGuides.Point.Guide { get }
	
	var topLeft: Point { get }
	
	var topCenter: Point { get }
	
	var topRight: Point { get }
	
	var middleLeft: Point { get }
	
	var middleCenter: Point { get }
	
	var middleRight: Point { get }
	
	var bottomLeft: Point { get }
	
	var bottomCenter: Point { get }
	
	var bottomRight: Point { get }
	
	func point(at relativePosition: Point) -> Point
	
	func pointAt(x: Float, y: Float) -> Point
	
	var topLeading: Point { get }
	
	var topTrailing: Point { get }
	
	var midddleLeading: Point { get }
	
	var middleTrailing: Point { get }
	
	var bottomLeading: Point { get }
	
	var bottomTrailing: Point { get }
	
}
