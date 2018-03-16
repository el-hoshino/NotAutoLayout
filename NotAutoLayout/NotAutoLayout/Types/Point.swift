//
//  Point.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public struct Point {
    
    public var x: Float
    public var y: Float
    
    public init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
    
}

extension Point {
    
    public static let zero: Point = .init(x: 0, y: 0)
    
}

extension Point: CGTypeConvertible {
    
   public var cgValue: CGPoint {
        return .init(x: self.x.cgValue, y: self.y.cgValue)
    }
    
    public init(_ point: CGPoint) {
        self.x = Float(point.x)
        self.y = Float(point.y)
    }
    
}

extension Point: CustomStringConvertible {
    
    public var description: String {
        return "(x:\(self.x), y: \(self.y))"
    }
    
}
