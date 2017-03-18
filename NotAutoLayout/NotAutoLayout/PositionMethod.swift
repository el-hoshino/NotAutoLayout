//
//  PositionMethod.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/18.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

enum PositioningMethod {
	
	case absolutely
	case relatively
	
	func absoluteWidth(_ width: CGFloat, by comparingSize: CGSize) -> CGFloat {
		
		switch self {
		case .absolutely:
			return width
			
		case .relatively:
			return comparingSize.absoluteWidth(relatedTo: width)
		}
		
	}
	
	func absoluteHeight(_ height: CGFloat, by comparingSize: CGSize) -> CGFloat {
		
		switch self {
		case .absolutely:
			return height
			
		case .relatively:
			return comparingSize.absoluteHeight(relatedTo: height)
		}
		
	}
	
	func absoluteVector(_ vector: CGVector, by comparingSize: CGSize) -> CGVector {
		
		switch self {
		case .absolutely:
			return vector
			
		case .relatively:
			return comparingSize.absoluteVector(relatedTo: vector)
		}
		
	}
	
	func absoluteFrame(_ frame: CGRect, by comparingSize: CGSize) -> CGRect {
		
		switch self {
		case .absolutely:
			return frame
			
		case .relatively:
			return comparingSize.absoluteFrame(relatedTo: frame)
		}
		
	}
	
}

private extension CGSize {
	
	func absoluteWidth(relatedTo relativeWidth: CGFloat) -> CGFloat {
		
		let width = relativeWidth * self.width
		
		return width
		
	}
	
	func absoluteHeight(relatedTo relativeHeight: CGFloat) -> CGFloat {
		
		let height = relativeHeight * self.height
		
		return height
		
	}
	
	func absoluteVector(relatedTo relativeVector: CGVector) -> CGVector {
		
		let dx = relativeVector.dx * self.width
		let dy = relativeVector.dy * self.height
		let vector = CGVector(dx: dx, dy: dy)
		
		return vector
		
	}
	
	func absoluteFrame(relatedTo relativeFrame: CGRect) -> CGRect {
		
		let x = relativeFrame.origin.x * self.width
		let y = relativeFrame.origin.y * self.height
		let width = relativeFrame.width * self.width
		let height = relativeFrame.height * self.height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}
