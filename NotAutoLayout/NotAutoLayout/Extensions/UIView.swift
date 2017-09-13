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
	
	@available(iOS 11.0, *)
	private var boundsWithZeroOriginInSafeArea: CGRect {
		
		let bounds = self.boundsWithZeroOrigin
		let insets = self.safeAreaInsets
		let frame = bounds.inside(insets)
		
		return frame
		
	}
	

	func frame(in targetView: UIView, ignoresTransform shouldIgnoreTransform: Bool = false) -> CGRect {

		switch targetView {
		case self:
			return self.boundsWithZeroOrigin
			
		default:
			let checkingFrame: CGRect = {
				if shouldIgnoreTransform {
					return self.nal.identityFrame
				} else {
					return self.frame
				}
			}()
			
			let convertedFrame: CGRect = {
				if let superview = self.superview {
					return superview.convert(checkingFrame, to: targetView)
				} else {
					return checkingFrame
				}
			}()
			
			return convertedFrame
		}

	}
	
	@available(iOS 11.0, *)
	func frame(in targetView: UIView, ignoresTransform shouldIgnoreTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CGRect {
		
		switch targetView {
		case self:
			if shouldOnlyIncludeSafeArea {
				return self.boundsWithZeroOriginInSafeArea
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
				if shouldOnlyIncludeSafeArea {
					return checkingFrame.inside(self.safeAreaInsets)
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
