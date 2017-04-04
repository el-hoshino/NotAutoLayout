//
//  LayoutFrame.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/04/04.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public enum HorizontalReference {
	case left
	case center
	case right
}

public enum VerticalReference {
	case top
	case middle
	case bottom
}

public struct ReferencePoint {
	
	public var horizontal: HorizontalReference
	public var vertical: VerticalReference
	
	public init(horizontal: HorizontalReference, vertical: VerticalReference) {
		self.horizontal = horizontal
		self.vertical = vertical
	}
	
	public static let topLeft = ReferencePoint(horizontal: .left, vertical: .top)
	public static let topCenter = ReferencePoint(horizontal: .center, vertical: .top)
	public static let topRight = ReferencePoint(horizontal: .right, vertical: .top)
	
	public static let middleLeft = ReferencePoint(horizontal: .left, vertical: .middle)
	public static let middleCenter = ReferencePoint(horizontal: .center, vertical: .middle)
	public static let middleRight = ReferencePoint(horizontal: .right, vertical: .middle)
	
	public static let bottomLeft = ReferencePoint(horizontal: .left, vertical: .bottom)
	public static let bottomCenter = ReferencePoint(horizontal: .center, vertical: .bottom)
	public static let bottomRigt = ReferencePoint(horizontal: .right, vertical: .bottom)
	
}

public struct LayoutFrame {
	
	public var reference: ReferencePoint
	public var origin: CGPoint
	public var size: CGSize
	
	public init(reference: ReferencePoint, origin: CGPoint, size: CGSize) {
		self.reference = reference
		self.origin = origin
		self.size = size
	}
	
}

extension LayoutFrame {
	
	func position(in canvasSize: CGSize) -> Position {
		
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
		let position = Position(center: center, size: self.size)
		
		return position
		
	}
	
}
