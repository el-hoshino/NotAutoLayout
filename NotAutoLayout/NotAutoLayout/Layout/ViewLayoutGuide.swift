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
    
    public var left: CGFloat {
        return self.rect.left
    }
    
    public var center: CGFloat {
        return self.rect.center
    }
    
    public var right: CGFloat {
        return self.rect.right
    }
    
    public var width: CGFloat {
        return self.rect.width
    }
    
    public func horizontal(at relativePosition: CGFloat) -> CGFloat {
        return self.left + (self.width * relativePosition)
    }
    
}

extension ViewLayoutGuides.Guide {
    
    public var top: CGFloat {
        return self.rect.top
    }
    
    public var middle: CGFloat {
        return self.rect.middle
    }
    
    public var bottom: CGFloat {
        return self.rect.bottom
    }
    
    public var height: CGFloat {
        return self.rect.height
    }
    
    public func vertical(at relativePosition: CGFloat) -> CGFloat {
        return self.top + (self.height * relativePosition)
    }
    
}

extension ViewLayoutGuides.Guide {
    
    public var topLeft: CGPoint {
        return self.rect.topLeft
    }
    
    public var topCenter: CGPoint {
        return self.rect.topCenter
    }
    
    public var topRight: CGPoint {
        return self.rect.topRight
    }
    
    public var middleLeft: CGPoint {
        return self.rect.middleLeft
    }
    
    public var middleCenter: CGPoint {
        return self.rect.middleCenter
    }
    
    public var middleRight: CGPoint {
        return self.rect.middleRight
    }
    
    public var bottomLeft: CGPoint {
        return self.rect.bottomLeft
    }
    
    public var bottomCenter: CGPoint {
        return self.rect.bottomCenter
    }
    
    public var bottomRight: CGPoint {
        return self.rect.bottomRight
    }
    
    public var size: CGSize {
        return self.rect.size
    }
    
    public func point(at relativePoint: CGPoint) -> CGPoint {
        let x = self.horizontal(at: relativePoint.x)
        let y = self.vertical(at: relativePoint.y)
        return .init(x: x, y: y)
    }
    
}

extension ViewLayoutGuides.Guide {
    
    public var frame: CGRect {
        return self.rect.frame
    }
    
    public func frame(inside insets: UIEdgeInsets) -> CGRect {
        return self.rect.frame(inside: insets)
    }
    
}

extension ViewLayoutGuides.Guide {
    
    public var leading: CGFloat {
        switch self.direction {
        case .leftToRight:
            return self.left
            
        case .rightToLeft:
            return self.right
        }
    }
    
    public var trailing: CGFloat {
        switch self.direction {
        case .leftToRight:
            return self.right
            
        case .rightToLeft:
            return self.left
        }
    }
    
}
