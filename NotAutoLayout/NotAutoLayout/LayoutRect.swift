//
//  LayoutRect.swift
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
	
}

public struct LayoutRect {
	
	public var reference: ReferencePoint
	public var origin: CGPoint
	public var size: CGSize
	
	public init(reference: ReferencePoint, origin: CGPoint, size: CGSize) {
		self.reference = reference
		self.origin = origin
		self.size = size
	}
	
}
