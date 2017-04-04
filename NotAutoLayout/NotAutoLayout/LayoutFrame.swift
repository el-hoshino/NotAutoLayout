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
