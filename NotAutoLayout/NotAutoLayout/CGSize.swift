//
//  CGSize.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/02/09.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension CGSize {
	
	func absoluteRect(relatedTo rect: CGRect) -> CGRect {
		
		let x = rect.origin.x * self.width
		let y = rect.origin.y * self.height
		let width = rect.width * self.width
		let height = rect.height * self.height
		
		return CGRect(x: x, y: y, width: width, height: height)
		
	}
	
}

extension CGSize {

	func absoluteRect(withinInsets insets: UIEdgeInsets) -> CGRect {
		
		let x = insets.left
		let y = insets.top
		let width = self.width - (insets.left + insets.right)
		let height = self.height - (insets.top + insets.bottom)
		
		return CGRect(x: x, y: y, width: width, height: height)
		
	}
	
}

extension CGSize {
	
	func absoluteRect(offsetBy value: UIOffset, from type: LayoutPosition.OffsetType, for size: CGSize) -> CGRect {
		
		let origin = type.getOrigin(offset: value, canvasSize: self, objectSize: size)
		
		return CGRect(origin: origin, size: size)
		
	}
	
}

extension CGSize {
	
	func absoluteRect(appliedTo transform: (CGSize) -> CGRect) -> CGRect {
		
		return transform(self)
		
	}
	
}
