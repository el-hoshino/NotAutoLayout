//
//  ViewFrameProperty.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/13.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct ViewFrameProperty {
	
	private(set) weak var parentView: UIView?
	
	private(set) weak var currentView: UIView?
	
}

extension ViewFrameProperty {
	
	public var boundSize: CGSize {
		
		return self.parentView?.bounds.size ?? .zero
		
	}
	
	@available(iOS 11.0, *)
	public var safeAreaInsets: UIEdgeInsets {
		
		guard let insets = self.parentView?.safeAreaInsets else {
			return .zero
		}
		
		return insets
		
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
		return self.boundLeft + (self.boundWidth / 2)
	}
	
	public var boundRight: CGFloat {
		return self.boundLeft + self.boundWidth
	}
	
	public var boundTop: CGFloat {
		return 0
	}
	
	public var boundMiddle: CGFloat {
		return self.boundTop + (self.boundHeight / 2)
	}
	
	public var boundBottom: CGFloat {
		return self.boundTop + self.boundHeight
	}
	
	public func boundHorizontal(at relativePosition: CGFloat) -> CGFloat {
		return self.boundLeft + (self.boundWidth * relativePosition)
	}
	
	public func boundVertical(at relativePosition: CGFloat) -> CGFloat {
		return self.boundTop + (self.boundHeight * relativePosition)
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
	
	public func boundPoint(at relativePoint: CGPoint) -> CGPoint {
		let x = self.boundLeft + (self.boundWidth * relativePoint.x)
		let y = self.boundTop + (self.boundHeight * relativePoint.y)
		return .init(x: x, y: y)
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
		return self.safeLeft + self.safeWidth
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
		return self.safeTop + self.safeHeight
	}
	
	@available(iOS 11.0, *)
	public func safeHorizontal(at relativePosition: CGFloat) -> CGFloat {
		return self.safeLeft + (self.safeWidth * relativePosition)
	}
	
	@available(iOS 11.0, *)
	public func safeVertical(at relativePosition: CGFloat) -> CGFloat {
		return self.safeTop + (self.safeHeight * relativePosition)
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
	
	@available(iOS 11.0, *)
	public func safePoint(at relativePoint: CGPoint) -> CGPoint {
		let x = self.safeLeft + (self.safeWidth * relativePoint.x)
		let y = self.safeTop + (self.safeHeight * relativePoint.y)
		return .init(x: x, y: y)
	}
	
}

extension ViewFrameProperty {
	
	@available(iOS 11.0, *)
	public var safeFrame: CGRect {
		return .init(origin: self.safeOrigin, size: self.safeSize)
	}
	
}

extension ViewFrameProperty {
	
	func sizeThatFits(_ fittingSize: CGSize) -> CGSize {
		
		guard let currentView = self.currentView else {
			return .zero
		}
		
		let fittedSize = currentView.sizeThatFits(fittingSize)
		
		return fittedSize
		
	}
	
}

extension ViewFrameProperty {
	
	func evaluateSize(from calculation: (ViewFrameProperty) -> CGSize) -> CGSize {
		
		return calculation(self)
		
	}
	
	func evaluateSize(from aspect: LayoutElement.Size.AspectSizing) -> CGSize {
		
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
		
		let targetRatio = aspect.ratio ?? { (targetView: UIView?) in
			return targetView?.sizeThatFits(.zero).ratio
		}(self.currentView) ?? 1
		
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
