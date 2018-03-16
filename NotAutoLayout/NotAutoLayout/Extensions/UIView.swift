//
//  UIView.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import UIKit

extension UIView {
	
	var currentDirection: UIUserInterfaceLayoutDirection {
		
		if #available(iOS 10.0, *) {
			return UIView.userInterfaceLayoutDirection(for: self.semanticContentAttribute, relativeTo: self.effectiveUserInterfaceLayoutDirection)
			
		} else {
			return UIView.userInterfaceLayoutDirection(for: self.semanticContentAttribute)
		}
		
	}
	
	var boundsRect: Rect {
		return Rect(self.bounds)
	}
	
	var layoutMarginsRect: Rect {
		let frame = self.bounds.frame(inside: self.layoutMargins)
		return Rect(frame)
	}
	
	var readableRect: Rect {
		// FIXME: Get this property without Auto Layout UILayoutGuide
		let frame = self.readableContentGuide.layoutFrame
		return Rect(frame)
	}
	
	@available(iOS 11.0, *)
	var safeAreaRect: Rect {
		let frame = self.bounds.frame(inside: self.safeAreaInsets)
		return Rect(frame)
	}
	
}

extension UIView {
    
    func sizeThatFits(_ size: Size) -> Size {
        return Size(self.sizeThatFits(size.cgValue))
    }
    
}

extension UIView {
	
	func frame(in targetView: UIView?, ignoresTransform shouldIgnoreTransform: Bool) -> Rect {
		
		let checkingFrame = self.nal.frame(thatIgnoresTransform: shouldIgnoreTransform)
		
		return checkingFrame.convertedBy(targetView: targetView, superView: self.superview)
		
	}
	
	func layoutMarginsFrame(in targetView: UIView?) -> Rect {
		
		let checkingFrame = self.nal.identityFrame.frame(inside: self.layoutMargins)
		
		return checkingFrame.convertedBy(targetView: targetView, superView: self.superview)
		
	}
	
	func readableFrame(in targetView: UIView?) -> Rect {
		
		// FIXME: Get this property without Auto Layout UILayoutGuide
		let checkingFrame = CGRect(origin: self.nal.identityFrame.origin,
								   size: self.readableRect.size)
		
		return checkingFrame.convertedBy(targetView: targetView, superView: self.superview)
		
	}
	
	@available(iOS 11.0, *)
	func safeAreaFrame(in targetView: UIView?) -> Rect {
		
		let checkingFrame = self.nal.identityFrame.frame(inside: self.safeAreaInsets)
		
		return checkingFrame.convertedBy(targetView: targetView, superView: self.superview)
		
	}
	
}
