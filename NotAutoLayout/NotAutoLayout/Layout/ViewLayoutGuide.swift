//
//  ViewLayoutGuide.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/15.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

extension ViewLayoutGuides {
	
	public struct Guide {
		
		let _direction: UIUserInterfaceLayoutDirection
		let _rect: Rect
		
		init(direction: UIUserInterfaceLayoutDirection, rect: Rect) {
			self._direction = direction
			self._rect = rect
		}
		
		static let empty: ViewLayoutGuides.Guide = .init(direction: .leftToRight,
														 rect: .zero)
		
	}
	
}

extension ViewLayoutGuides.Guide: LayoutGuideRepresentable {
	
	public var direction: UIUserInterfaceLayoutDirection {
		return self._direction
	}
	
	public var left: Float {
		return self._rect.left
	}
	
	public var center: Float {
		return self._rect.center
	}
	
	public var right: Float {
		return self._rect.right
	}
	
	public var width: Float {
		return self._rect.width
	}
	
	public func horizontal(at coordinatePosition: Float) -> Float {
		return self.left + (self.width * coordinatePosition)
	}
	
	public var top: Float {
		return self._rect.top
	}
	
	public var middle: Float {
		return self._rect.middle
	}
	
	public var bottom: Float {
		return self._rect.bottom
	}
	
	public var height: Float {
		return self._rect.height
	}
	
	public func vertical(at coordinatePosition: Float) -> Float {
		return self.top + (self.height * coordinatePosition)
	}
	
	public var topLeft: Point {
		return self._rect.topLeft
	}
	
	public var topCenter: Point {
		return self._rect.topCenter
	}
	
	public var topRight: Point {
		return self._rect.topRight
	}
	
	public var middleLeft: Point {
		return self._rect.middleLeft
	}
	
	public var middleCenter: Point {
		return self._rect.middleCenter
	}
	
	public var middleRight: Point {
		return self._rect.middleRight
	}
	
	public var bottomLeft: Point {
		return self._rect.bottomLeft
	}
	
	public var bottomCenter: Point {
		return self._rect.bottomCenter
	}
	
	public var bottomRight: Point {
		return self._rect.bottomRight
	}
	
	public var size: Size {
		return self._rect.size
	}
	
	public func point(at coordinatePoint: Point) -> Point {
		return self._rect.pointGeometry(at: coordinatePoint)
	}
	
	public var frame: Rect {
		return self._rect
	}
	
	public func frame(inside insets: Insets) -> Rect {
		return self._rect.rect(inside: insets)
	}
	
	public var leading: Float {
		switch self.direction {
		case .leftToRight:
			return self.left
			
		case .rightToLeft:
			return self.right
			
		@unknown default:
			assertionFailure()
			return self.left
		}
	}
	
	public var trailing: Float {
		switch self.direction {
		case .leftToRight:
			return self.right
			
		case .rightToLeft:
			return self.left
			
		@unknown default:
			assertionFailure()
			return self.right
		}
	}
	
	public var topLeading: Point {
		switch self.direction {
		case .leftToRight:
			return self.topLeft
			
		case .rightToLeft:
			return self.topRight
			
		@unknown default:
			assertionFailure()
			return self.topLeft
		}
	}
	
	public var topTrailing: Point {
		switch self.direction {
		case .leftToRight:
			return self.topRight
			
		case .rightToLeft:
			return self.topLeft
			
		@unknown default:
			return self.topRight
		}
	}
	
	public var midddleLeading: Point {
		switch self.direction {
		case .leftToRight:
			return self.middleLeft
			
		case .rightToLeft:
			return self.middleRight
			
		@unknown default:
			assertionFailure()
			return self.middleLeft
		}
	}
	
	public var middleTrailing: Point {
		switch self.direction {
		case .leftToRight:
			return self.middleRight
			
		case .rightToLeft:
			return self.middleLeft
			
		@unknown default:
			assertionFailure()
			return self.middleRight
		}
	}
	
	public var bottomLeading: Point {
		switch self.direction {
		case .leftToRight:
			return self.bottomLeft
			
		case .rightToLeft:
			return self.bottomRight
			
		@unknown default:
			assertionFailure()
			return self.bottomLeft
		}
	}
	
	public var bottomTrailing: Point {
		switch self.direction {
		case .leftToRight:
			return self.bottomRight
			
		case .rightToLeft:
			return self.bottomLeft
			
		@unknown default:
			assertionFailure()
			return self.bottomRight
		}
	}
	
}
