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
		
		let directionGetter: () -> UIUserInterfaceLayoutDirection?
		let rect: Rect
		
		static let empty: ViewLayoutGuides.Guide = .init(directionGetter: { nil },
														 rect: .zero)
		
	}
	
}

extension ViewLayoutGuides.Guide {
	
	var direction: UIUserInterfaceLayoutDirection {
		return self.directionGetter() ?? .leftToRight
	}
	
}

extension ViewLayoutGuides.Guide: LayoutGuideRepresentable {
    
    public var layoutGuide: ViewLayoutGuides.Guide {
        return self
    }
    
}

extension ViewLayoutGuides.Guide {
    
    public var left: Float {
        return self.rect.left
    }
    
    public var center: Float {
        return self.rect.center
    }
    
    public var right: Float {
        return self.rect.right
    }
    
    public var width: Float {
        return self.rect.width
    }
    
    public func horizontal(at relativePosition: Float) -> Float {
        return self.left + (self.width * relativePosition)
    }
    
}

extension ViewLayoutGuides.Guide {
    
    public var top: Float {
        return self.rect.top
    }
    
    public var middle: Float {
        return self.rect.middle
    }
    
    public var bottom: Float {
        return self.rect.bottom
    }
    
    public var height: Float {
        return self.rect.height
    }
    
    public func vertical(at relativePosition: Float) -> Float {
        return self.top + (self.height * relativePosition)
    }
    
}

extension ViewLayoutGuides.Guide {
    
    public var topLeft: Point {
        return self.rect.topLeft
    }
    
    public var topCenter: Point {
        return self.rect.topCenter
    }
    
    public var topRight: Point {
        return self.rect.topRight
    }
    
    public var middleLeft: Point {
        return self.rect.middleLeft
    }
    
    public var middleCenter: Point {
        return self.rect.middleCenter
    }
    
    public var middleRight: Point {
        return self.rect.middleRight
    }
    
    public var bottomLeft: Point {
        return self.rect.bottomLeft
    }
    
    public var bottomCenter: Point {
        return self.rect.bottomCenter
    }
    
    public var bottomRight: Point {
        return self.rect.bottomRight
    }
    
    public var size: Size {
        return self.rect.size
    }
    
    public func point(at relativePoint: Point) -> Point {
        let x = self.horizontal(at: relativePoint.x)
        let y = self.vertical(at: relativePoint.y)
        return .init(x: x, y: y)
    }
    
}

extension ViewLayoutGuides.Guide {
    
    public var frame: Rect {
        return self.rect
    }
    
    public func frame(inside insets: Insets) -> Rect {
        return self.rect.rect(inside: insets)
    }
    
}

extension ViewLayoutGuides.Guide {
    
    public var leading: Float {
        switch self.direction {
        case .leftToRight:
            return self.left
            
        case .rightToLeft:
            return self.right
        }
    }
    
    public var trailing: Float {
        switch self.direction {
        case .leftToRight:
            return self.right
            
        case .rightToLeft:
            return self.left
        }
    }
    
}
