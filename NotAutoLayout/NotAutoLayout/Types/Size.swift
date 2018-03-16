//
//  Size.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public struct Size {
    
    public var width: Float
    public var height: Float
    
    public init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
    
}

extension Size {
    
    public static let zero: Size = .init(width: 0, height: 0)
    
    public static let identity: Size = .init(width: 1, height: 1)
    
}

extension Size: CGTypeConvertible {
    
    public var cgValue: CGSize {
        return .init(width: self.width.cgValue, height: self.height.cgValue)
    }
    
    public init(_ size: CGSize) {
        self.width = Float(size.width)
        self.height = Float(size.height)
    }
    
}

extension Size {
    
    static func + (lhs: Size, rhs: Size) -> Size {
        return Size(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
    
    static func += (lhs: inout Size, rhs: Size) {
        lhs = lhs + rhs
    }
    
    static func - (lhs: Size, rhs: Size) -> Size {
        return Size(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
    
    static func -= (lhs: inout Size, rhs: Size) {
        lhs = lhs - rhs
    }
    
}

extension Size: CustomStringConvertible {
    
    public var description: String {
        return "(width: \(self.width), height: \(self.height))"
    }
    
}
