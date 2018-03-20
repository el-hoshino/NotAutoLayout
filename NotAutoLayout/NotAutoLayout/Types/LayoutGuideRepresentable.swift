//
//  LayoutGuideRepresentable.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/15.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutGuideRepresentable {
	
	
	var left: Float { get }
	
	var center: Float { get }
	
	var right: Float { get }
	
	var width: Float { get }
	
	func horizontal(at relativePosition: Float) -> Float
	
	var top: Float { get }
	
	var middle: Float { get }
	
	var bottom: Float { get }
	
	var height: Float { get }
	
	func vertical(at relativePosition: Float) -> Float
	
	var topLeft: Point { get }
	
	var topCenter: Point { get }
	
	var topRight: Point { get }
	
	var middleLeft: Point { get }
	
	var middleCenter: Point { get }
	
	var middleRight: Point { get }
	
	var bottomLeft: Point { get }
	
	var bottomCenter: Point { get }
	
	var bottomRight: Point { get }
	
	var size: Size { get }
	
	func point(at relativePoint: Point) -> Point
	
	var frame: Rect { get }
	
	func frame(inside insets: Insets) -> Rect
	
	var leading: Float { get }
	
	var trailing: Float { get }

	
	
	
	
	
	
}
