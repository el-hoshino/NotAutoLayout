//
//  ViewFrameProperty.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/13.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct ViewFrameProperty {
	
	public let boundSize: CGSize
	
	public let safeAreaInsets: UIEdgeInsets
	
}

extension ViewFrameProperty {
	
	static func initialize(from view: UIView) -> ViewFrameProperty {
		
		let boundSize = view.bounds.size
		let safeAreaInsets: UIEdgeInsets = {
			if #available(iOS 11.0, *) {
				return view.safeAreaInsets
			} else {
				return .zero
			}
		}()
		
		let parameter = ViewFrameProperty(boundSize: boundSize,
											   safeAreaInsets: safeAreaInsets)
		
		return parameter
		
	}
	
}

extension ViewFrameProperty {
	
	public var boundWidth: CGFloat {
		return self.boundSize.width
	}
	
	public var boundHeight: CGFloat {
		return self.boundSize.height
	}
	
}

extension ViewFrameProperty {
	
	public var boundLeft: CGFloat {
		return 0
	}
	
	public var boundCenter: CGFloat {
		return (self.boundRight - self.boundLeft) / 2
	}
	
	public var boundRight: CGFloat {
		return self.boundWidth
	}
	
	public var boundTop: CGFloat {
		return 0
	}
	
	public var boundMiddle: CGFloat {
		return (self.boundBottom - self.boundTop) / 2
	}
	
	public var boundBottom: CGFloat {
		return self.boundHeight
	}
	
}

extension ViewFrameProperty {
	
	public var boundTopLeft: CGPoint {
		return .init(x: self.boundLeft, y: self.boundTop)
	}
	
	public var boundTopCenter: CGPoint {
		return .init(x: self.boundCenter, y: self.boundTop)
	}
	
	public var boundTopRight: CGPoint {
		return .init(x: self.boundRight, y: self.boundTop)
	}
	
	public var boundMiddleLeft: CGPoint {
		return .init(x: self.boundLeft, y: self.boundMiddle)
	}
	
	public var boundMiddleCenter: CGPoint {
		return .init(x: self.boundCenter, y: self.boundMiddle)
	}
	
	public var boundMiddleRight: CGPoint {
		return .init(x: self.boundRight, y: self.boundMiddle)
	}
	
	public var boundBottomLeft: CGPoint {
		return .init(x: self.boundLeft, y: self.boundBottom)
	}
	
	public var boundBottomCenter: CGPoint {
		return .init(x: self.boundCenter, y: self.boundBottom)
	}
	
	public var boundBottomRight: CGPoint {
		return .init(x: self.boundRight, y: self.boundBottom)
	}
	
}

extension ViewFrameProperty {
	
	public var boundFrame: CGRect {
		return .init(origin: .zero, size: self.boundSize)
	}
	
}

extension ViewFrameProperty {
	
	@available(iOS 11.0, *)
	public var topSafeAreaInset: CGFloat {
		return self.safeAreaInsets.top
	}
	
	@available(iOS 11.0, *)
	public var bottomSafeAreaInset: CGFloat {
		return self.safeAreaInsets.bottom
	}
	
	@available(iOS 11.0, *)
	public var leftSafeAreaInset: CGFloat {
		return self.safeAreaInsets.left
	}
	
	@available(iOS 11.0, *)
	public var rightSafeAreaInset: CGFloat {
		return self.safeAreaInsets.right
	}
	
}

extension ViewFrameProperty {
	
	@available(iOS 11.0, *)
	public var safeWidth: CGFloat {
		return self.boundWidth - self.safeAreaInsets.width
	}
	
	@available(iOS 11.0, *)
	public var safeHeight: CGFloat {
		return self.boundHeight - self.safeAreaInsets.height
	}
	
	@available(iOS 11.0, *)
	public var safeOrigin: CGPoint {
		return CGPoint(x: self.leftSafeAreaInset, y: self.topSafeAreaInset)
	}
	
	@available(iOS 11.0, *)
	public var safeSize: CGSize {
		return CGSize(width: self.safeWidth, height: self.safeHeight)
	}
	
}

extension ViewFrameProperty {
	
	@available(iOS 11.0, *)
	public var safeLeft: CGFloat {
		return self.boundLeft + self.safeAreaInsets.left
	}
	
	@available(iOS 11.0, *)
	public var safeCenter: CGFloat {
		return self.safeLeft + (self.safeWidth / 2)
	}
	
	@available(iOS 11.0, *)
	public var safeRight: CGFloat {
		return self.boundRight - self.safeAreaInsets.right
	}
	
	@available(iOS 11.0, *)
	public var safeTop: CGFloat {
		return self.boundTop + self.safeAreaInsets.top
	}
	
	@available(iOS 11.0, *)
	public var safeMiddle: CGFloat {
		return self.safeTop + (self.safeHeight / 2)
	}
	
	@available(iOS 11.0, *)
	public var safeBottom: CGFloat {
		return self.boundBottom - self.safeAreaInsets.bottom
	}
	
}

extension ViewFrameProperty {
	
	@available(iOS 11.0, *)
	public var safeTopLeft: CGPoint {
		return .init(x: self.safeLeft, y: self.safeTop)
	}
	
	@available(iOS 11.0, *)
	public var safeTopCenter: CGPoint {
		return .init(x: self.safeCenter, y: self.safeTop)
	}
	
	@available(iOS 11.0, *)
	public var safeTopRight: CGPoint {
		return .init(x: self.safeRight, y: self.safeTop)
	}
	
	@available(iOS 11.0, *)
	public var safeMiddleLeft: CGPoint {
		return .init(x: self.safeLeft, y: self.safeMiddle)
	}
	
	@available(iOS 11.0, *)
	public var safeMiddleCenter: CGPoint {
		return .init(x: self.safeCenter, y: self.safeMiddle)
	}
	
	@available(iOS 11.0, *)
	public var safeMiddleRight: CGPoint {
		return .init(x: self.safeRight, y: self.safeMiddle)
	}
	
	@available(iOS 11.0, *)
	public var safeBottomLeft: CGPoint {
		return .init(x: self.safeLeft, y: self.safeBottom)
	}
	
	@available(iOS 11.0, *)
	public var safeBottomCenter: CGPoint {
		return .init(x: self.safeCenter, y: self.safeBottom)
	}
	
	@available(iOS 11.0, *)
	public var safeBottomRight: CGPoint {
		return .init(x: self.safeRight, y: self.safeBottom)
	}
	
}

extension ViewFrameProperty {
	
	@available(iOS 11.0, *)
	public var safeFrame: CGRect {
		return .init(origin: self.safeOrigin, size: self.safeSize)
	}
	
}

extension ViewFrameProperty {
	
	@available(iOS, renamed: "boundFrame")
	public func boundsWithZeroOrigin() -> CGRect {
		
		let boundsWithZeroOrigin = CGRect(origin: .zero, size: self.boundSize)
		
		return boundsWithZeroOrigin
		
	}
	
	@available(iOS, renamed: "safeFrame")
	public func boundsWithZeroOrigin(safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CGRect {
		
		let boundsWithZeroOrigin = CGRect(origin: .zero, size: self.boundSize)
		
		switch shouldOnlyIncludeSafeArea {
		case true:
			return boundsWithZeroOrigin.inside(self.safeAreaInsets)
			
		case false:
			return boundsWithZeroOrigin
		}
		
	}
	
}

extension ViewFrameProperty {
	
	func evaluateSize(from calculation: (ViewFrameProperty) -> CGSize) -> CGSize {
		
		return calculation(self)
		
	}
	
	func evaluateSize(from aspect: LayoutElement.Size.AspectSizing, defaultRatio: CGFloat) -> CGSize {
		
		let canvasSize = { (safeAreaOnly: Bool) -> CGSize in
			switch safeAreaOnly {
			case true:
				if #available(iOS 11.0, *) {
					return self.safeSize
				} else {
					fallthrough
				}
				
			case false:
				return self.boundSize
			}
		}(aspect.safeAreaOnly)
		
		let targetRatio = aspect.ratio ?? defaultRatio
		
		guard targetRatio.isNaN == false,
			canvasSize.ratio.isNaN == false
		else {
			return canvasSize
		}
		
		switch aspect {
		case .fit, .safeAreaFit:
			return CGSize.aspectFitSize(in: canvasSize, with: targetRatio)
			
		case .fill, .safeAreaFill:
			return CGSize.aspectFillSize(in: canvasSize, with: targetRatio)
		}
		
	}
	
}
