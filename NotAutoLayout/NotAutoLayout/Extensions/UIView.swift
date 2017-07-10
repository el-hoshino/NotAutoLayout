//
//  UIView.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/07/06.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension UIView {
	
	func frame(in targetView: UIView, ignoresTransform: Bool = false) -> CGRect {
		
		let convertingFrame: CGRect
		
		if !self.transform.isIdentity && ignoresTransform {
			convertingFrame = self.nal.identityFrame
			
		} else {
			convertingFrame = self.frame
		}
		
		let frame = self.superview?.convert(convertingFrame, to: targetView)
		
		return frame ?? .zero
		
	}
	
}

extension UIView {
	
	func horizontalReference(_ reference: CGRect.HorizontalBasePoint, of referenceView: UIView, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CGRect.Float {
		
		let reference = CGRect.Float.closure { [unowned self, weak referenceView] (_) -> CGFloat in
			
			guard let referenceView = referenceView else {
				return offset
			}
			
			let frame = referenceView.frame(in: self, ignoresTransform: ignoresTransform)
			
			let reference = reference.value(in: frame)
			
			let result = reference + offset
			
			return result
			
		}
		
		return reference
		
	}
	
	func verticalReference(_ reference: CGRect.VerticalBasePoint, of referenceView: UIView, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CGRect.Float {
		
		let reference = CGRect.Float.closure { [unowned self, weak referenceView] (_) -> CGFloat in
			
			guard let referenceView = referenceView else {
				return offset
			}
			
			let frame = referenceView.frame(in: self, ignoresTransform: ignoresTransform)
			
			let reference = reference.value(in: frame)
			
			let result = reference + offset
			
			return result
			
		}
		
		return reference
		
	}
	
	func pointReference(_ reference: CGRect.PlaneBasePoint, of referenceView: UIView?, offsetBY offset: CGVector = .zero, ignoresTransform: Bool = false) -> CGRect.Point {
		
		let reference = CGRect.Point.closure { [unowned self, weak referenceView] (_) -> CGPoint in
			
			guard let referenceView = referenceView else {
				return CGPoint.zero + offset
			}
			
			let frame = referenceView.frame(in: self, ignoresTransform: ignoresTransform)
			
			let reference = reference.value(in: frame)
			
			let result = reference + offset
			
			return result
			
		}
		
		return reference
		
	}
	
}
