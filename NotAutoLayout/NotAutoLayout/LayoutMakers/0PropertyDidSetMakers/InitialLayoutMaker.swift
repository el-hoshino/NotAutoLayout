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
extension InitialLayoutMaker {
	
	public func setMiddleLeft(to middleLeft: CGPoint) -> MiddleLeftDidSetLayoutMaker {
		
		let middleLeft = LayoutElement.Point.constant(middleLeft)
		
		let maker = MiddleLeftDidSetLayoutMaker(parentView: self.parentView,
		                                        middleLeft: middleLeft)
		
		return maker
		
	}
	
	public func setMiddleLeft(by middleLeft: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> MiddleLeftDidSetLayoutMaker {
		
		let middleLeft = LayoutElement.Point.closure(middleLeft)
		
		let maker = MiddleLeftDidSetLayoutMaker(parentView: self.parentView,
		                                        middleLeft: middleLeft)
		
		return maker
		
	}
	
	public func pinMiddleLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> MiddleLeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleLeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddleLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> MiddleLeftDidSetLayoutMaker {
		
		let middleLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = MiddleLeftDidSetLayoutMaker(parentView: self.parentView,
		                                        middleLeft: middleLeft)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleLeftDidSetLayoutMaker {
		
		let middleLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = MiddleLeftDidSetLayoutMaker(parentView: self.parentView,
		                                        middleLeft: middleLeft)
		
		return maker
		
	}
	
}

// MARK: MiddleCenter
extension InitialLayoutMaker {
	
	public func setMiddleCenter(to middleCenter: CGPoint) -> MiddleCenterDidSetLayoutMaker {
		
		let middleCenter = LayoutElement.Point.constant(middleCenter)
		
		let maker = MiddleCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          middleCenter: middleCenter)
		
		return maker
		
	}
	
	public func setMiddleCenter(by middleCenter: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> MiddleCenterDidSetLayoutMaker {
		
		let middleCenter = LayoutElement.Point.closure(middleCenter)
		
		let maker = MiddleCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          middleCenter: middleCenter)
		
		return maker
		
	}
	
	public func pinMiddleCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> MiddleCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> MiddleCenterDidSetLayoutMaker {
		
		let middleCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = MiddleCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          middleCenter: middleCenter)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleCenterDidSetLayoutMaker {
		
		let middleCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = MiddleCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          middleCenter: middleCenter)
		
		return maker
		
	}
	
}

// MARK: MiddleRight
extension InitialLayoutMaker {
	
	public func setMiddleRight(to middleRight: CGPoint) -> MiddleRightDidSetLayoutMaker {
		
		let middleRight = LayoutElement.Point.constant(middleRight)
		
		let maker = MiddleRightDidSetLayoutMaker(parentView: self.parentView,
		                                         middleRight: middleRight)
		
		return maker
		
	}
	
	public func setMiddleRight(by middleRight: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> MiddleRightDidSetLayoutMaker {
		
		let middleRight = LayoutElement.Point.closure(middleRight)
		
		let maker = MiddleRightDidSetLayoutMaker(parentView: self.parentView,
		                                         middleRight: middleRight)
		
		return maker
		
	}
	
	public func pinMiddleRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> MiddleRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddleRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> MiddleRightDidSetLayoutMaker {
		
		let middleRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = MiddleRightDidSetLayoutMaker(parentView: self.parentView,
		                                         middleRight: middleRight)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddleRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> MiddleRightDidSetLayoutMaker {
		
		let middleRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = MiddleRightDidSetLayoutMaker(parentView: self.parentView,
		                                         middleRight: middleRight)
		
		return maker
		
	}
	
}

// MARK: BottomLeft
extension InitialLayoutMaker {
	
	public func setBottomLeft(to bottomLeft: CGPoint) -> BottomLeftDidSetLayoutMaker {
		
		let bottomLeft = LayoutElement.Point.constant(bottomLeft)
		
		let maker = BottomLeftDidSetLayoutMaker(parentView: self.parentView,
		                                        bottomLeft: bottomLeft)
		
		return maker
		
	}
	
	public func setBottomLeft(by bottomLeft: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> BottomLeftDidSetLayoutMaker {
		
		let bottomLeft = LayoutElement.Point.closure(bottomLeft)
		
		let maker = BottomLeftDidSetLayoutMaker(parentView: self.parentView,
		                                        bottomLeft: bottomLeft)
		
		return maker
		
	}
	
	public func pinBottomLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> BottomLeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomLeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> BottomLeftDidSetLayoutMaker {
		
		let bottomLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = BottomLeftDidSetLayoutMaker(parentView: self.parentView,
		                                        bottomLeft: bottomLeft)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomLeftDidSetLayoutMaker {
		
		let bottomLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = BottomLeftDidSetLayoutMaker(parentView: self.parentView,
		                                        bottomLeft: bottomLeft)
		
		return maker
		
	}
	
}

// MARK: BottomCenter
extension InitialLayoutMaker {
	
	public func setBottomCenter(to bottomCenter: CGPoint) -> BottomCenterDidSetLayoutMaker {
		
		let bottomCenter = LayoutElement.Point.constant(bottomCenter)
		
		let maker = BottomCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          bottomCenter: bottomCenter)
		
		return maker
		
	}
	
	public func setBottomCenter(by bottomCenter: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> BottomCenterDidSetLayoutMaker {
		
		let bottomCenter = LayoutElement.Point.closure(bottomCenter)
		
		let maker = BottomCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          bottomCenter: bottomCenter)
		
		return maker
		
	}
	
	public func pinBottomCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> BottomCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottomCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> BottomCenterDidSetLayoutMaker {
		
		let bottomCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = BottomCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          bottomCenter: bottomCenter)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomCenterDidSetLayoutMaker {
		
		let bottomCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = BottomCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          bottomCenter: bottomCenter)
		
		return maker
		
	}
	
}

// MARK: BottomRight
extension InitialLayoutMaker {
	
	public func setBottomRight(to bottomRight: CGPoint) -> BottomRightDidSetLayoutMaker {
		
		let bottomRight = LayoutElement.Point.constant(bottomRight)
		
		let maker = BottomRightDidSetLayoutMaker(parentView: self.parentView,
		                                         bottomRight: bottomRight)
		
		return maker
		
	}
	
	public func setBottomRight(by bottomRight: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> BottomRightDidSetLayoutMaker {
		
		let bottomRight = LayoutElement.Point.closure(bottomRight)
		
		let maker = BottomRightDidSetLayoutMaker(parentView: self.parentView,
		                                         bottomRight: bottomRight)
		
		return maker
		
	}
	
	public func pinBottomRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> BottomRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottomRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> BottomRightDidSetLayoutMaker {
		
		let bottomRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = BottomRightDidSetLayoutMaker(parentView: self.parentView,
		                                         bottomRight: bottomRight)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> BottomRightDidSetLayoutMaker {
		
		let bottomRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = BottomRightDidSetLayoutMaker(parentView: self.parentView,
		                                         bottomRight: bottomRight)
		
		return maker
		
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
