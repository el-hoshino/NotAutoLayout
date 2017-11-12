//
//  LayoutElement.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LayoutElement {
	
}

extension LayoutElement {
	
	public struct Float {
		
		fileprivate let value: (LayoutControlParameter) -> CGFloat
		
		static func constant(_ value: CGFloat) -> Float {
			return Float(value: { _ in value })
		}
		
		static func closure(_ value: @escaping (LayoutControlParameter) -> CGFloat) -> Float {
			return Float(value: value)
		}
		
	}
	
	public struct Point {
		
		fileprivate let value: (LayoutControlParameter) -> CGPoint
		
		static func constant(_ value: CGPoint) -> Point {
			return Point(value: { _ in value })
		}
		
		static func closure(_ value: @escaping (LayoutControlParameter) -> CGPoint) -> Point {
			return Point(value: value)
		}
		
	}
	
	public struct Size {
		
		fileprivate let value: (LayoutControlParameter) -> CGSize
		
		static func constant(_ value: CGSize) -> Size {
			return Size(value: { _ in value })
		}
		
		static func closure(_ value: @escaping (LayoutControlParameter) -> CGSize) -> Size {
			return Size(value: value)
		}
		
	}
	
	public struct Rect {
		
		fileprivate let value: (LayoutControlParameter) -> CGRect
		
		static func constant(_ value: CGRect) -> Rect {
			return Rect(value: { _ in value })
		}
		
		static func closure(_ value: @escaping (LayoutControlParameter) -> CGRect) -> Rect {
			return Rect(value: value)
		}
		
	}
	
}

extension LayoutElement.Float {
	
	func evaluated(from parameter: LayoutControlParameter) -> CGFloat {
		
		return self.value(parameter)
		
	}
	
}

extension LayoutElement.Point {
	
	func evaluated(from parameter: LayoutControlParameter) -> CGPoint {
		
		return self.value(parameter)
		
	}
	
}

extension LayoutElement.Size {
	
	func evaluated(from parameter: LayoutControlParameter) -> CGSize {
		
		return self.value(parameter)
		
	}
	
}

extension LayoutElement.Rect {
	
	func evaluated(from parameter: LayoutControlParameter) -> CGRect {
		
		return self.value(parameter)
		
	}
	
}
