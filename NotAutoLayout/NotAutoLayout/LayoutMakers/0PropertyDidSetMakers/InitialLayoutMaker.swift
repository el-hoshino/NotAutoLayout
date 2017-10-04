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

// MARK: - Set A Frame -
// MARK: On Parent
extension InitialLayoutMaker {
	
	public func stickOnParent(withInsets insets: UIEdgeInsets = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return parameter.boundsWithZeroOrigin().inside(insets)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func stickOnParent(withInsets insets: UIEdgeInsets = .zero, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return parameter.boundsWithZeroOrigin(safeAreaOnly: shouldOnlyIncludeSafeArea).inside(insets)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: Custom Frame
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

// MARK: - Set A Point -
// MARK: TopLeft
extension InitialLayoutMaker {
	
	public func setTopLeft(to topLeft: CGPoint) -> TopLeftDidSetLayoutMaker {
		
		let topLeft = CGRect.Point.constant(topLeft)
		
		let maker = TopLeftDidSetLayoutMaker(parentView: self.parentView,
		                                     topLeft: topLeft)
		
		return maker
		
	}
	
	public func setTopLeft(by topLeft: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> TopLeftDidSetLayoutMaker {
		
		let topLeft = CGRect.Point.closure(topLeft)
		
		let maker = TopLeftDidSetLayoutMaker(parentView: self.parentView,
		                                     topLeft: topLeft)
		
		return maker
		
	}
	
	public func pinTopLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> TopLeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopLeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTopLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> TopLeftDidSetLayoutMaker {
		
		let topLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = TopLeftDidSetLayoutMaker(parentView: self.parentView,
		                                     topLeft: topLeft)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopLeftDidSetLayoutMaker {
		
		let topLeft = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = TopLeftDidSetLayoutMaker(parentView: self.parentView,
		                                     topLeft: topLeft)
		
		return maker
		
	}
	
}

// MARK: TopCenter
extension InitialLayoutMaker {
	
	public func setTopCenter(to topCenter: CGPoint) -> TopCenterDidSetLayoutMaker {
		
		let topCenter = CGRect.Point.constant(topCenter)
		
		let maker = TopCenterDidSetLayoutMaker(parentView: self.parentView,
		                                       topCenter: topCenter)
		
		return maker
		
	}
	
	public func setTopCenter(by topCenter: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> TopCenterDidSetLayoutMaker {
		
		let topCenter = CGRect.Point.closure(topCenter)
		
		let maker = TopCenterDidSetLayoutMaker(parentView: self.parentView,
		                                       topCenter: topCenter)
		
		return maker
		
	}
	
	public func pinTopCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> TopCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTopCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> TopCenterDidSetLayoutMaker {
		
		let topCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = TopCenterDidSetLayoutMaker(parentView: self.parentView,
		                                       topCenter: topCenter)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopCenterDidSetLayoutMaker {
		
		let topCenter = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = TopCenterDidSetLayoutMaker(parentView: self.parentView,
		                                       topCenter: topCenter)
		
		return maker
		
	}
	
}

// MARK: TopRight
extension InitialLayoutMaker {
	
	public func setTopRight(to topRight: CGPoint) -> TopRightDidSetLayoutMaker {
		
		let topRight = CGRect.Point.constant(topRight)
		
		let maker = TopRightDidSetLayoutMaker(parentView: self.parentView,
		                                      topRight: topRight)
		
		return maker
		
	}
	
	public func setTopRight(by topRight: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> TopRightDidSetLayoutMaker {
		
		let topRight = CGRect.Point.closure(topRight)
		
		let maker = TopRightDidSetLayoutMaker(parentView: self.parentView,
		                                      topRight: topRight)
		
		return maker
		
	}
	
	public func pinTopRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> TopRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinTopRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> TopRightDidSetLayoutMaker {
		
		let topRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = TopRightDidSetLayoutMaker(parentView: self.parentView,
		                                      topRight: topRight)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinTopRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopRightDidSetLayoutMaker {
		
		let topRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = TopRightDidSetLayoutMaker(parentView: self.parentView,
		                                      topRight: topRight)
		
		return maker
		
	}
	
}

// MARK: MiddleLeft
extension InitialLayoutMaker {
	
	public func setMiddleLeft(to middleLeft: CGPoint) -> MiddleLeftDidSetLayoutMaker {
		
		let middleLeft = CGRect.Point.constant(middleLeft)
		
		let maker = MiddleLeftDidSetLayoutMaker(parentView: self.parentView,
		                                        middleLeft: middleLeft)
		
		return maker
		
	}
	
	public func setMiddleLeft(by middleLeft: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> MiddleLeftDidSetLayoutMaker {
		
		let middleLeft = CGRect.Point.closure(middleLeft)
		
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
		
		let middleCenter = CGRect.Point.constant(middleCenter)
		
		let maker = MiddleCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          middleCenter: middleCenter)
		
		return maker
		
	}
	
	public func setMiddleCenter(by middleCenter: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> MiddleCenterDidSetLayoutMaker {
		
		let middleCenter = CGRect.Point.closure(middleCenter)
		
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
		
		let middleRight = CGRect.Point.constant(middleRight)
		
		let maker = MiddleRightDidSetLayoutMaker(parentView: self.parentView,
		                                         middleRight: middleRight)
		
		return maker
		
	}
	
	public func setMiddleRight(by middleRight: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> MiddleRightDidSetLayoutMaker {
		
		let middleRight = CGRect.Point.closure(middleRight)
		
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
		
		let bottomLeft = CGRect.Point.constant(bottomLeft)
		
		let maker = BottomLeftDidSetLayoutMaker(parentView: self.parentView,
		                                        bottomLeft: bottomLeft)
		
		return maker
		
	}
	
	public func setBottomLeft(by bottomLeft: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> BottomLeftDidSetLayoutMaker {
		
		let bottomLeft = CGRect.Point.closure(bottomLeft)
		
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
		
		let bottomCenter = CGRect.Point.constant(bottomCenter)
		
		let maker = BottomCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          bottomCenter: bottomCenter)
		
		return maker
		
	}
	
	public func setBottomCenter(by bottomCenter: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> BottomCenterDidSetLayoutMaker {
		
		let bottomCenter = CGRect.Point.closure(bottomCenter)
		
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
		
		let bottomRight = CGRect.Point.constant(bottomRight)
		
		let maker = BottomRightDidSetLayoutMaker(parentView: self.parentView,
		                                         bottomRight: bottomRight)
		
		return maker
		
	}
	
	public func setBottomRight(by bottomRight: @escaping (_ parameter: LayoutControlParameter) -> CGPoint) -> BottomRightDidSetLayoutMaker {
		
		let bottomRight = CGRect.Point.closure(bottomRight)
		
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
extension InitialLayoutMaker {
	
	public func setLeft(to left: CGFloat) -> LeftDidSetLayoutMaker {
		
		let left = CGRect.Float.constant(left)
		let maker = LeftDidSetLayoutMaker(parentView: self.parentView,
		                                  left: left)
		
		return maker
		
	}
	
	public func setLeft(by left: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LeftDidSetLayoutMaker {
		
		let left = CGRect.Float.closure(left)
		
		let maker = LeftDidSetLayoutMaker(parentView: self.parentView,
		                                  left: left)
		
		return maker
		
	}
	
	public func pinLeft(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
	
	}
	
	@available(iOS 11.0, *)
	public func pinLeft(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinLeft(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftDidSetLayoutMaker {
		
		let left = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = LeftDidSetLayoutMaker(parentView: self.parentView,
		                                  left: left)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinLeft(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LeftDidSetLayoutMaker {
		
		let left = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = LeftDidSetLayoutMaker(parentView: self.parentView,
		                                  left: left)
		
		return maker
		
	}
	
}

// MARK: Center
extension InitialLayoutMaker {
	
	public func setCenter(to center: CGFloat) -> CenterDidSetLayoutMaker {
		
		let center = CGRect.Float.constant(center)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
	public func setCenter(by center: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> CenterDidSetLayoutMaker {
		
		let center = CGRect.Float.closure(center)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterDidSetLayoutMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinCenter(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CenterDidSetLayoutMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
}

// MARK: Right
extension InitialLayoutMaker {
	
	public func setRight(to right: CGFloat) -> RightDidSetLayoutMaker {
		
		let right = CGRect.Float.constant(right)
		
		let maker = RightDidSetLayoutMaker(parentView: self.parentView,
		                                   right: right)
		
		return maker
		
	}
	
	public func setRight(by right: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> RightDidSetLayoutMaker {
		
		let right = CGRect.Float.closure(right)
		
		let maker = RightDidSetLayoutMaker(parentView: self.parentView,
		                                   right: right)
		
		return maker
		
	}
	
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> RightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = RightDidSetLayoutMaker(parentView: self.parentView,
		                                   right: right)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> RightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = RightDidSetLayoutMaker(parentView: self.parentView,
		                                   right: right)
		
		return maker
		
	}
	
}
