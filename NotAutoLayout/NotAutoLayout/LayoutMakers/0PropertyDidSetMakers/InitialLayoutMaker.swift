//
//  InitialLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct InitialLayoutMaker {
	
	public unowned let parentView: UIView
	
}

// MARK: - Custom Frame
extension InitialLayoutMaker {
	
	public func makeFrame(_ frame: CGRect) -> LayoutEditor {
		
		let layout = Layout(frame: frame)
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func makeFrame(_ frame: @escaping (_ parameter: LayoutControlParameter) -> CGRect) -> LayoutEditor {
		
		let layout = Layout(frame: frame)
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func makeFrame(_ frame: @escaping (_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ parameter: LayoutControlParameter) -> CGRect) -> LayoutEditor {
		
		let layout = Layout(frame: frame)
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Frame -
extension InitialLayoutMaker: LayoutMakerCanSetFrameType {
	
	public typealias WillSetFrameMaker = LayoutEditor
	
	public func setFrame(_ frame: LayoutElement.Rect) -> LayoutEditor {
		
		let layout = Layout { (parameter) -> CGRect in
			return frame.evaluated(from: parameter)
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension InitialLayoutMaker: LayoutMakerCanSetTopLeftType {
	
	public typealias WillSetTopLeftMaker = TopLeftDidSetLayoutMaker
	
	public func setTopLeft(_ topLeft: LayoutElement.Point) -> TopLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: topLeft)
		
	}
	
}

// MARK: TopCenter
extension InitialLayoutMaker: LayoutMakerCanSetTopCenterType {
	
	public typealias WillSetTopCenterMaker = TopCenterDidSetLayoutMaker
	
	public func setTopCenter(_ topCenter: LayoutElement.Point) -> TopCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: topCenter)
		
	}
	
}

// MARK: TopRight
extension InitialLayoutMaker: LayoutMakerCanSetTopRightType {
	
	public typealias WillSetTopRightMaker = TopRightDidSetLayoutMaker
	
	public func setTopRight(_ topRight: LayoutElement.Point) -> TopRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: topRight)
		
	}
	
}

// MARK: MiddleLeft
extension InitialLayoutMaker: LayoutMakerCanSetMiddleLeftType {
	
	public typealias WillSetMiddleLeftMaker = MiddleLeftDidSetLayoutMaker
	
	public func setMiddleLeft(_ middleLeft: LayoutElement.Point) -> MiddleLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleCenter
extension InitialLayoutMaker: LayoutMakerCanSetMiddleCenterType {
	
	public typealias WillSetMiddleCenterMaker = MiddleCenterDidSetLayoutMaker
	
	public func setMiddleCenter(_ middleCenter: LayoutElement.Point) -> MiddleCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: middleCenter)
		
	}
	
}

// MARK: MiddleRight
extension InitialLayoutMaker: LayoutMakerCanSetMiddleRightType {
	
	public typealias WillSetMiddleRightMaker = MiddleRightDidSetLayoutMaker
	
	public func setMiddleRight(_ middleRight: LayoutElement.Point) -> MiddleRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: middleRight)
		
	}
	
}

// MARK: BottomLeft
extension InitialLayoutMaker: LayoutMakerCanSetBottomLeftType {
	
	public typealias WillSetBottomLeftMaker = BottomLeftDidSetLayoutMaker
	
	public func setBottomLeft(_ bottomLeft: LayoutElement.Point) -> BottomLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomCenter
extension InitialLayoutMaker: LayoutMakerCanSetBottomCenterType {
	
	public typealias WillSetBottomCenterMaker = BottomCenterDidSetLayoutMaker
	
	public func setBottomCenter(_ bottomCenter: LayoutElement.Point) -> BottomCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: bottomCenter)
		
	}
	
}

// MARK: BottomRight
extension InitialLayoutMaker: LayoutMakerCanSetBottomRightType {
	
	public typealias WillSetBottomRightMaker = BottomRightDidSetLayoutMaker
	
	public func setBottomRight(_ bottomRight: LayoutElement.Point) -> BottomRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension InitialLayoutMaker: LayoutMakerCanSetLeftType {
	
	public typealias WillSetLeftMaker = LeftDidSetLayoutMaker
	
	public func setLeft(_ left: LayoutElement.Float) -> LeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: left)
		
	}
	
}

// MARK: Center
extension InitialLayoutMaker {
	
	public func setCenter(to center: CGFloat) -> CenterDidSetLayoutMaker {
		
		let center = LayoutElement.Float.constant(center)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
	public func setCenter(by center: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterDidSetLayoutMaker {
		
		let center = LayoutElement.Float.closure(center)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterDidSetLayoutMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterDidSetLayoutMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
}

// MARK: Right
extension InitialLayoutMaker {
	
	public func setRight(to right: CGFloat) -> RightDidSetLayoutMaker {
		
		let right = LayoutElement.Float.constant(right)
		
		let maker = RightDidSetLayoutMaker(parentView: self.parentView,
		                                   right: right)
		
		return maker
		
	}
	
	public func setRight(by right: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightDidSetLayoutMaker {
		
		let right = LayoutElement.Float.closure(right)
		
		let maker = RightDidSetLayoutMaker(parentView: self.parentView,
		                                   right: right)
		
		return maker
		
	}
	
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = RightDidSetLayoutMaker(parentView: self.parentView,
		                                   right: right)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = RightDidSetLayoutMaker(parentView: self.parentView,
		                                   right: right)
		
		return maker
		
	}
	
}
