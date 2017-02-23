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
	
	func absolutePosition(offsetBy offset: UIOffset, from offsetOrigin: LayoutPosition.OffsetOrigin, forObjectSize objectSize: CGSize) -> PositionRect {
		
		let boundHorizontalCenter = self.width / 2
		let boundVerticalCenter = self.height / 2
		
		let objectHorizontalCenter = objectSize.width / 2
		let objectVerticalCenter = objectSize.height / 2
		
		let horizontalCenterDiff = boundHorizontalCenter - objectHorizontalCenter
		let verticalCenterDiff = boundVerticalCenter - objectVerticalCenter
		
		let baseX: CGFloat
		let baseY: CGFloat
		
		switch offsetOrigin {
		case .topLeft:
			baseX = offset.horizontal - horizontalCenterDiff
			baseY = offset.vertical - verticalCenterDiff
			
		case .topCenter:
			baseX = offset.horizontal
			baseY = offset.vertical - verticalCenterDiff
			
		case .topRight:
			baseX = offset.horizontal + horizontalCenterDiff
			baseY = offset.vertical - verticalCenterDiff
			
		case .middleLeft:
			baseX = offset.horizontal - horizontalCenterDiff
			baseY = offset.vertical
			
		case .middleCenter:
			baseX = offset.horizontal
			baseY = offset.vertical
			
		case .middleRight:
			baseX = offset.horizontal + horizontalCenterDiff
			baseY = offset.vertical
			
		case .bottomLeft:
			baseX = offset.horizontal - horizontalCenterDiff
			baseY = offset.vertical + verticalCenterDiff
			
		case .bottomCenter:
			baseX = offset.horizontal
			baseY = offset.vertical + verticalCenterDiff
			
		case .bottomRight:
			baseX = offset.horizontal + horizontalCenterDiff
			baseY = offset.vertical + verticalCenterDiff
		}
		
		let centerX = baseX + boundHorizontalCenter
		let centerY = baseY + boundVerticalCenter
		let center = CGPoint(x: centerX, y: centerY)
		
		return PositionRect(center: center, size: objectSize)
		
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
