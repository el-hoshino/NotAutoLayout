//
//  LayoutGuideRepresentable.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/15.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutGuideRepresentable {
    
    var layoutGuide: LayoutGuide { get }
    
    var left: CGFloat { get }
    
    var center: CGFloat { get }
    
    var right: CGFloat { get }
    
    var width: CGFloat { get }
    
    func horizontal(at relativePosition: CGFloat) -> CGFloat
    
    var top: CGFloat { get }
    
    var middle: CGFloat { get }
    
    var bottom: CGFloat { get }
    
    var height: CGFloat { get }
    
    func vertical(at relativePosition: CGFloat) -> CGFloat
    
    var topLeft: CGPoint { get }
    
    var topCenter: CGPoint { get }
    
    var topRight: CGPoint { get }
    
    var middleLeft: CGPoint { get }
    
    var middleCenter: CGPoint { get }
    
    var middleRight: CGPoint { get }
    
    var bottomLeft: CGPoint { get }
    
    var bottomCenter: CGPoint { get }
    
    var bottomRight: CGPoint { get }
    
    var size: CGSize { get }
    
    func point(at relativePoint: CGPoint) -> CGPoint
    
    var frame: CGRect { get }
    
    func frame(inside insets: UIEdgeInsets) -> CGRect
    
    var leading: CGFloat { get }
    
    var trailing: CGFloat { get }

}

extension LayoutGuideRepresentable {
    
    public var left: CGFloat {
        return self.layoutGuide.left
    }
    
    public var center: CGFloat {
        return self.layoutGuide.center
    }
    
    public var right: CGFloat {
        return self.layoutGuide.right
    }
    
    public var width: CGFloat {
        return self.layoutGuide.width
    }
    
    public func horizontal(at relativePosition: CGFloat) -> CGFloat {
        return self.layoutGuide.horizontal(at: relativePosition)
    }
    
    public var top: CGFloat {
        return self.layoutGuide.top
    }
    
    public var middle: CGFloat {
        return self.layoutGuide.middle
    }
    
    public var bottom: CGFloat {
        return self.layoutGuide.bottom
    }
    
    public var height: CGFloat {
        return self.layoutGuide.height
    }
    
    public func vertical(at relativePosition: CGFloat) -> CGFloat {
        return self.layoutGuide.vertical(at: relativePosition)
    }
    
    public var topLeft: CGPoint {
        return self.layoutGuide.topLeft
    }
    
    public var topCenter: CGPoint {
        return self.layoutGuide.topCenter
    }
    
    public var topRight: CGPoint {
        return self.layoutGuide.topRight
    }
    
    public var middleLeft: CGPoint {
        return self.layoutGuide.middleLeft
    }
    
    public var middleCenter: CGPoint {
        return self.layoutGuide.middleCenter
    }
    
    public var middleRight: CGPoint {
        return self.layoutGuide.middleRight
    }
    
    public var bottomLeft: CGPoint {
        return self.layoutGuide.bottomLeft
    }
    
    public var bottomCenter: CGPoint {
        return self.layoutGuide.bottomCenter
    }
    
    public var bottomRight: CGPoint {
        return self.layoutGuide.bottomRight
    }
    
    public var size: CGSize {
        return self.layoutGuide.size
    }
    
    public func point(at relativePoint: CGPoint) -> CGPoint {
        return self.layoutGuide.point(at: relativePoint)
    }
    
    public var frame: CGRect {
        return self.layoutGuide.frame
    }
    
    public func frame(inside insets: UIEdgeInsets) -> CGRect {
        return self.layoutGuide.frame(inside: insets)
    }
    
    public var leading: CGFloat {
        return self.layoutGuide.leading
    }
    
    public var trailing: CGFloat {
        return self.layoutGuide.trailing
    }
    
}
