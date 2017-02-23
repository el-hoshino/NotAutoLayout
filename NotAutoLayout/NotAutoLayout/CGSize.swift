//
//  CGSize.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/02/09.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension CGSize {
	
	func absolutePosition(relatedTo rect: CGRect) -> PositionRect {
		
		let x = rect.origin.x * self.width
		let y = rect.origin.y * self.height
		let width = rect.width * self.width
		let height = rect.height * self.height
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return PositionRect(frame: frame)
		
	}
	
}

extension CGSize {

	func absolutePosition(withinInsets insets: UIEdgeInsets) -> PositionRect {
		
		let x = insets.left
		let y = insets.top
		let width = self.width - (insets.left + insets.right)
		let height = self.height - (insets.top + insets.bottom)
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return PositionRect(frame: frame)
		
	}
	
}

extension CGSize {
	
	func absolutePosition(offsetBy value: UIOffset, from type: LayoutPosition.OffsetType, forObjectSize objectSize: CGSize) -> PositionRect {
		
		return type.getPosition(offset: value, boundSize: self, objectSize: objectSize)
		
	}
	
}

extension CGSize {
	
	func absolutePositionAppliedTo(frame frameTransform: (CGSize) -> CGRect) -> PositionRect {
		
		let frame = frameTransform(self)
		return PositionRect(frame: frame)
		
	}
	
	func absolutePositionAppliedTo(origin originTransform: (CGSize) -> CGPoint, size sizeTransform: (CGSize) -> CGSize) -> PositionRect {
		
		let origin = originTransform(self)
		let size = sizeTransform(self)
		let frame = CGRect(origin: origin, size: size)
		return PositionRect(frame: frame)
		
	}
	
	func absolutePositionAppliedTo(x xTransform: (CGSize) -> CGFloat, y yTransform: (CGSize) -> CGFloat, width widthTransform: (CGSize) -> CGFloat, height heightTransform: (CGSize) -> CGFloat) -> PositionRect {
		
		let x = xTransform(self)
		let y = yTransform(self)
		let width = widthTransform(self)
		let height = heightTransform(self)
		let frame = CGRect(x: x, y: y, width: width, height: height)
		return PositionRect(frame: frame)
		
	}
	
}
