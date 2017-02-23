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
		
		let center = type.getCenter(offset: value, boundSize: self, objectSize: objectSize)
		
		return PositionRect(center: center, size: objectSize)
		
	}
	
}

extension CGSize {
	
	func absolutePosition(appliedTo transform: (CGSize) -> CGRect) -> PositionRect {
		
		let frame = transform(self)
		return PositionRect(frame: frame)
		
	}
	
}
