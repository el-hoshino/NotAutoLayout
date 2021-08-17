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
		let insets = Insets(self.layoutMargins)
		return self.boundsRect.rect(inside: insets)
	}
	
	var readableRect: Rect {
		// FIXME: Get this property without Auto Layout UILayoutGuide
		let frame = self.readableContentGuide.layoutFrame
		return Rect(frame)
	}
	
	var safeAreaRect: Rect {
		let insets = Insets(self.safeAreaInsets)
		return self.boundsRect.rect(inside: insets)
	}
	
	var frameRect: Rect {
		return Rect(self.frame)
	}
	
	var identityFrameRect: Rect {
		return self.frameRect(thatIgnoresTransform: true)
	}
	
	func frameRect(thatIgnoresTransform shouldIgnoreTransform: Bool) -> Rect {
		return Rect(self.nal.frame(thatIgnoresTransform: shouldIgnoreTransform))
	}
	
}

extension UIView {
	
	func sizeThatFits(_ size: Size) -> Size {
		return Size(self.sizeThatFits(size.cgValue))
	}
	
}

extension UIView {
	
	func frame(in targetView: UIView?, ignoresTransform shouldIgnoreTransform: Bool) -> Rect {
		
		let checkingFrame = self.frameRect(thatIgnoresTransform: shouldIgnoreTransform)
		
		return checkingFrame.convertedBy(targetView: targetView, superView: self.superview)
		
	}
	
	func layoutMarginsFrame(in targetView: UIView?) -> Rect {
		
		let insets = Insets(self.layoutMargins)
		let checkingFrame = self.identityFrameRect.rect(inside: insets)
		
		return checkingFrame.convertedBy(targetView: targetView, superView: self.superview)
		
	}
	
	func readableFrame(in targetView: UIView?) -> Rect {
		
		// FIXME: Get this property without Auto Layout UILayoutGuide
		let checkingFrame = Rect(origin: self.identityFrameRect.origin,
								 size: self.readableRect.size)
		
		return checkingFrame.convertedBy(targetView: targetView, superView: self.superview)
		
	}
	
	func safeAreaFrame(in targetView: UIView?) -> Rect {
		
		let insets = Insets(self.safeAreaInsets)
		let checkingFrame = self.identityFrameRect.rect(inside: insets)
		
		return checkingFrame.convertedBy(targetView: targetView, superView: self.superview)
		
	}
	
}
