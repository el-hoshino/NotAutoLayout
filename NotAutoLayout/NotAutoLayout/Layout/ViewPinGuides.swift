//
//  ViewPinGuides.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/12/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct ViewPinGuides {
	
}

// MARK: - Horizontal
extension ViewPinGuides {
	
	public struct Horizontal {
		
		private(set) weak var parentView: UIView?
		private(set) var referenceViewGetter: () -> UIView?
		
		init(parentView: UIView?, referenceView: UIView?) {
			self.parentView = parentView
			self.referenceViewGetter = { [weak referenceView] in referenceView }
		}
		
		init(parentView: UIView?, referenceViewGetter: @escaping () -> UIView?) {
			self.parentView = parentView
			self.referenceViewGetter = referenceViewGetter
		}
		
	}
	
}

extension ViewPinGuides.Horizontal {
	
	var referenceView: UIView? {
		return self.referenceViewGetter()
	}
	
}

extension ViewPinGuides.Horizontal {
	
	private func makeGuide(direction: UIUserInterfaceLayoutDirection?, rect: Rect?) -> Guide {
		
		guard let direction = direction, let rect = rect else {
			return .empty
		}
		
		let guide = Guide.init(uiLayoutDirection: direction, span: rect.horizontalSpan)
		
		return guide
		
	}
	
}

extension ViewPinGuides.Horizontal {
	
	public var frameGuide: Guide {
		return self.makeGuide(direction: self.referenceView?.currentDirection, rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: false))
	}
	
	public var identityFrameGuide: Guide {
		return self.makeGuide(direction: self.referenceView?.currentDirection, rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: true))
	}
	
	public var layoutMarginsGuide: Guide {
		return self.makeGuide(direction: self.referenceView?.currentDirection, rect: self.referenceView?.layoutMarginsFrame(in: self.parentView))
	}
	
	public var readableGuide: Guide {
		return self.makeGuide(direction: self.referenceView?.currentDirection, rect: self.referenceView?.readableFrame(in: self.parentView))
	}
	
	@available(iOS 11.0, *)
	public var safeAreaGuide: Guide {
		return self.makeGuide(direction: self.referenceView?.currentDirection, rect: self.referenceView?.safeAreaFrame(in: self.parentView))
	}
	
}

// MARK: - Vertical
extension ViewPinGuides {
	
	public struct Vertical {
		
		private(set) weak var parentView: UIView?
		private(set) var referenceViewGetter: () -> UIView?
		
		init(parentView: UIView?, referenceView: UIView?) {
			self.parentView = parentView
			self.referenceViewGetter = { [weak referenceView] in referenceView }
		}
		
		init(parentView: UIView?, referenceViewGetter: @escaping () -> UIView?) {
			self.parentView = parentView
			self.referenceViewGetter = referenceViewGetter
		}
		
	}
	
}

extension ViewPinGuides.Vertical {
	
	var referenceView: UIView? {
		return self.referenceViewGetter()
	}
	
}

extension ViewPinGuides.Vertical {
	
	private func makeGuide(rect: Rect?) -> Guide {
		
		guard let rect = rect else {
			return .empty
		}
		
		let guide = Guide.init(span: rect.verticalSpan)
		
		return guide
		
	}
	
}

extension ViewPinGuides.Vertical {
	
	public var frameGuide: Guide {
		return self.makeGuide(rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: false))
	}
	
	public var identityFrameGuide: Guide {
		return self.makeGuide(rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: true))
	}
	
	public var layoutMarginsGuide: Guide {
		return self.makeGuide(rect: self.referenceView?.layoutMarginsFrame(in: self.parentView))
	}
	
	public var readableGuide: Guide {
		return self.makeGuide(rect: self.referenceView?.readableFrame(in: self.parentView))
	}
	
	@available(iOS 11.0, *)
	public var safeAreaGuide: Guide {
		return self.makeGuide(rect: self.referenceView?.safeAreaFrame(in: self.parentView))
	}
	
}

// MARK: - Point
extension ViewPinGuides {
	
	public struct Point {
		
		private(set) weak var parentView: UIView?
		private(set) var referenceViewGetter: () -> UIView?
		
		init(parentView: UIView?, referenceView: UIView?) {
			self.parentView = parentView
			self.referenceViewGetter = { [weak referenceView] in referenceView }
		}
		
		init(parentView: UIView?, referenceViewGetter: @escaping () -> UIView?) {
			self.parentView = parentView
			self.referenceViewGetter = referenceViewGetter
		}
		
	}
	
}

extension ViewPinGuides.Point {
	
	var referenceView: UIView? {
		return self.referenceViewGetter()
	}
	
}

extension ViewPinGuides.Point {
	
	private func makeGuide(direction: UIUserInterfaceLayoutDirection?, rect: Rect?) -> Guide {
		
		guard let direction = direction, let rect = rect else {
			return .empty
		}
		
		let guide = Guide.init(uiLayoutDirection: direction, rect: rect)
		
		return guide
		
	}
	
}

extension ViewPinGuides.Point {
	
	public var frameGuide: Guide {
		return self.makeGuide(direction: self.referenceView?.currentDirection, rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: false))
	}
	
	public var identityFrameGuide: Guide {
		return self.makeGuide(direction: self.referenceView?.currentDirection, rect: self.referenceView?.frame(in: self.parentView, ignoresTransform: true))
	}
	
	public var layoutMarginsGuide: Guide {
		return self.makeGuide(direction: self.referenceView?.currentDirection, rect: self.referenceView?.layoutMarginsFrame(in: self.parentView))
	}
	
	public var readableGuide: Guide {
		return self.makeGuide(direction: self.referenceView?.currentDirection, rect: self.referenceView?.readableFrame(in: self.parentView))
	}
	
	@available(iOS 11.0, *)
	public var safeAreaGuide: Guide {
		return self.makeGuide(direction: self.referenceView?.currentDirection, rect: self.referenceView?.safeAreaFrame(in: self.parentView))
	}
	
}
