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
	
	private func frame(in targetView: UIView, ignoresTransform shouldIgnoreTransform: Bool, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CGRect {
		
		switch targetView {
		case self:
			if shouldOnlyIncludeSafeArea, #available(iOS 11.0, *) {
                return self.boundsWithZeroOrigin.frame(inside: self.safeAreaInsets)
			} else {
				return self.boundsWithZeroOrigin
			}
			
		default:
			let checkingFrame: CGRect = {
				if shouldIgnoreTransform {
					return self.nal.identityFrame
				} else {
					return self.frame
				}
			}()
			
			let safeAreaFrame: CGRect = {
				if shouldOnlyIncludeSafeArea, #available(iOS 11.0, *) {
                    return checkingFrame.frame(inside: self.safeAreaInsets)
				} else {
					return checkingFrame
				}
			}()
			
			let convertedFrame: CGRect = {
				if let superview = self.superview {
					return superview.convert(safeAreaFrame, to: targetView)
				} else {
					return safeAreaFrame
				}
			}()
			
			return convertedFrame
		}
		
	}
	
}

extension UIView {
	
	func horizontalReference(_ reference: CGRect.HorizontalBaseLine, of referenceView: @escaping () -> UIView?, offsetBy offset: CGFloat, ignoresTransform shouldIgnoreTransform: Bool, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutElement.Horizontal {
		
		let reference = LayoutElement.Horizontal.byParent { [unowned self] (_) -> CGFloat in
			
			guard let referenceView = referenceView() else {
				return offset
			}
			
			let frame = referenceView.frame(in: self, ignoresTransform: shouldIgnoreTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
			
			let reference = reference.value(in: frame)
			
			let result = reference + offset
			
			return result
			
		}
		
		return reference
		
	}
	
	func verticalReference(_ reference: CGRect.VerticalBaseLine, of referenceView: @escaping () -> UIView?, offsetBy offset: CGFloat, ignoresTransform: Bool, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutElement.Vertical {
		
		let reference = LayoutElement.Vertical.byParent { [unowned self] (_) -> CGFloat in
			
			guard let referenceView = referenceView() else {
				return offset
			}
			
			let frame = referenceView.frame(in: self, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
			
			let reference = reference.value(in: frame)
			
			let result = reference + offset
			
			return result
			
		}
		
		return reference
		
	}
	
	func pointReference(_ reference: CGRect.PlaneBasePoint, of referenceView: @escaping () -> UIView?, offsetBy offset: CGVector, ignoresTransform: Bool, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutElement.Point {
		
		let reference = LayoutElement.Point.byParent { [unowned self] (_) -> CGPoint in
			
			guard let referenceView = referenceView() else {
				return CGPoint.zero + offset
			}
			
			let frame = referenceView.frame(in: self, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
			
			let reference = reference.value(in: frame)
			
			let result = reference + offset
			
			return result
			
		}
		
		return reference
		
	}
	
}
