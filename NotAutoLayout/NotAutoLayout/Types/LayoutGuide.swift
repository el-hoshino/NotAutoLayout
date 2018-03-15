//
//  LayoutGuide.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/15.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public struct LayoutGuide {
    
    private let semanticContentAttribute: UISemanticContentAttribute
    private let effectiveUserInterfaceLayoutDirection: UIUserInterfaceLayoutDirection
    private let rect: CGRect
    
}

extension LayoutGuide {
    
    var left: CGFloat {
        return self.rect.left
    }
    
    var center: CGFloat {
        return self.rect.center
    }
    
    var right: CGFloat {
        return self.rect.right
    }
    
    var width: CGFloat {
        return self.rect.width
    }
    
    func horizontal(at relativePosition: CGFloat) -> CGFloat {
        return self.left + (self.width * relativePosition)
    }
    
}

extension LayoutGuide {
    
    var top: CGFloat {
        return self.rect.top
    }
    
    var middle: CGFloat {
        return self.rect.middle
    }
    
    var bottom: CGFloat {
        return self.rect.bottom
    }
    
    var height: CGFloat {
        return self.rect.height
    }
    
    func vertical(at relativePosition: CGFloat) -> CGFloat {
        return self.top + (self.height * relativePosition)
    }
    
}

extension LayoutGuide {
    
    var topLeft: CGPoint {
        return self.rect.topLeft
    }
    
    var topCenter: CGPoint {
        return self.rect.topCenter
    }
    
    var topRight: CGPoint {
        return self.rect.topRight
    }
    
    var middleLeft: CGPoint {
        return self.rect.middleLeft
    }
    
    var middleCenter: CGPoint {
        return self.rect.middleCenter
    }
    
    var middleRight: CGPoint {
        return self.rect.middleRight
    }
    
    var bottomLeft: CGPoint {
        return self.rect.bottomLeft
    }
    
    var bottomCenter: CGPoint {
        return self.rect.bottomCenter
    }
    
    var bottomRight: CGPoint {
        return self.rect.bottomRight
    }
    
    var size: CGSize {
        return self.rect.size
    }
    
    func point(at relativePoint: CGPoint) -> CGPoint {
        let x = self.horizontal(at: relativePoint.x)
        let y = self.vertical(at: relativePoint.y)
        return .init(x: x, y: y)
    }
    
}
