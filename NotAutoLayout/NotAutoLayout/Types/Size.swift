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
    
    var ratio: Float {
        return self.width / self.height
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

extension Size {
    
    static func makeSize(usingWidthIn canvasSize: Size, with ratio: Float) -> Size {
        
        guard ratio.isNonZero else {
            return Size(width: canvasSize.width, height: .greatestFiniteMagnitude)
        }
        
        let width = canvasSize.width
        let height = width / ratio
        let size = Size(width: width, height: height)
        
        return size
        
    }
    
    static func makeSize(usingHeightIn canvasSize: Size, with ratio: Float) -> Size {
        
        guard ratio.isFinite else {
            return Size(width: .greatestFiniteMagnitude, height: canvasSize.height)
        }
        
        let height = canvasSize.height
        let width = height * ratio
        let size = Size(width: width, height: height)
        
        return size
        
    }
    
    static func aspectFitSize(in canvasSize: Size, with ratio: Float) -> Size {
        
        switch ratio > canvasSize.ratio {
        case true:
            return makeSize(usingWidthIn: canvasSize, with: ratio)
            
        case false:
            return makeSize(usingHeightIn: canvasSize, with: ratio)
        }
        
    }
    
    static func aspectFillSize(in canvasSize: Size, with ratio: Float) -> Size {
        
        switch ratio < canvasSize.ratio {
        case true:
            return makeSize(usingWidthIn: canvasSize, with: ratio)
            
        case false:
            return makeSize(usingHeightIn: canvasSize, with: ratio)
        }
        
    }
    
}

extension Size: CustomStringConvertible {
    
    public var description: String {
        return "(width: \(self.width), height: \(self.height))"
    }
    
}
