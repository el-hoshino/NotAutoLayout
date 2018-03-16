//
//  Insets.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public struct Insets {
    
    public var top: Float
    public var left: Float
    public var bottom: Float
    public var right: Float
    
    public init(top: Float, left: Float, bottom: Float, right: Float) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
    
}

extension Insets {
    
    public static let zero: Insets = .init(top: 0, left: 0, bottom: 0, right: 0)
    
}

extension Insets: CGTypeConvertible {
    
    public var cgValue: UIEdgeInsets {
        return UIEdgeInsets(top: self.top.cgValue, left: self.left.cgValue, bottom: self.bottom.cgValue, right: self.right.cgValue)
    }
    
    public init(_ insets: UIEdgeInsets) {
        self.top = Float(insets.top)
        self.left = Float(insets.left)
        self.bottom = Float(insets.bottom)
        self.right = Float(insets.right)
    }
    
}

extension Insets: CustomStringConvertible {
    
    public var description: String {
        return "(top: \(self.top), left: \(self.left), bottom: \(self.bottom), right: \(self.right))"
    }
    
}
