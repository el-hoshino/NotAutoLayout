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

extension Point {
    
    public static let coordinateTopLeft: Point      = .init(x: 0.0, y: 0.0)
    public static let coordinateTopCenter: Point    = .init(x: 0.5, y: 0.0)
    public static let coordinateTopRight: Point     = .init(x: 1.0, y: 0.0)
    public static let coordinateMiddleLeft: Point   = .init(x: 0.0, y: 0.5)
    public static let coordinateMiddleCenter: Point = .init(x: 0.5, y: 0.5)
    public static let coordinateMiddleRight: Point  = .init(x: 1.0, y: 0.5)
    public static let coordinateBottomLeft: Point   = .init(x: 0.0, y: 1.0)
    public static let coordinateBottomCenter: Point = .init(x: 0.5, y: 1.0)
    public static let coordinateBottomRight: Point  = .init(x: 1.0, y: 1.0)
    
}

extension Point {
    
    static func + (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func += (lhs: inout Point, rhs: Point) {
        lhs = lhs + rhs
    }
    
    static func - (lhs: Point, rhs: Point) -> Point {
        return Point(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    static func -= (lhs: inout Point, rhs: Point) {
        lhs = lhs - rhs
    }
    
}

extension Point: CustomStringConvertible {
    
    public var description: String {
        return "(x:\(self.x), y: \(self.y))"
    }
    
}
