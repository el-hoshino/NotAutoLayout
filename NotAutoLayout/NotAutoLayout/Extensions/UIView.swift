//
//  UIView.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/07/06.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension UIView {
	
	private var boundsWithZeroOrigin: CGRect {
		
		let origin = CGPoint.zero
		let size = self.bounds.size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
	private func convertedFrame(in targetView: UIView, ignoresTransform: Bool) -> CGRect {
		
		let convertingFrame: CGRect
		
		if (self.transform.isIdentity == false) && ignoresTransform {
			convertingFrame = self.nal.identityFrame
			
		} else {
			convertingFrame = self.frame
		}
		
		let frame = self.superview?.convert(convertingFrame, to: targetView)
		
		return frame ?? .zero
		
	}
	
	func frame(in targetView: UIView, ignoresTransform: Bool = false) -> CGRect {
		
		switch targetView {
		case self:
			return self.boundsWithZeroOrigin
			
		default:
			return self.convertedFrame(in: targetView, ignoresTransform: ignoresTransform)
		}
		
	}
	
}

extension UIView {
	
	func horizontalReference(_ reference: CGRect.HorizontalBasePoint, of referenceView: @escaping () -> UIView?, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CGRect.Float {
		
		let reference = CGRect.Float.closure { [unowned self] (_) -> CGFloat in
			
			guard let referenceView = referenceView() else {
				return offset
			}
			
			let frame = referenceView.frame(in: self, ignoresTransform: ignoresTransform)
			
			let reference = reference.value(in: frame)
			
			let result = reference + offset
			
			return result
			
		}
		
		return reference
		
	}
	
	func verticalReference(_ reference: CGRect.VerticalBasePoint, of referenceView: @escaping () -> UIView?, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CGRect.Float {
		
		let reference = CGRect.Float.closure { [unowned self] (_) -> CGFloat in
			
			guard let referenceView = referenceView() else {
				return offset
			}
			
			let frame = referenceView.frame(in: self, ignoresTransform: ignoresTransform)
			
			let reference = reference.value(in: frame)
			
			let result = reference + offset
			
			return result
			
		}
		
		return reference
		
	}
	
	func pointReference(_ reference: CGRect.PlaneBasePoint, of referenceView: @escaping () -> UIView?, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> CGRect.Point {
		
		let reference = CGRect.Point.closure { [unowned self] (_) -> CGPoint in
			
			guard let referenceView = referenceView() else {
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
