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

extension InitialLayoutMaker {
	
	public func setLeft(to left: CGFloat) -> LeftDidSetLayoutMaker {
		
		let left = CGRect.Float.constant(left)
		let maker = LeftDidSetLayoutMaker(parentView: self.parentView,
		                                  left: left)
		
		return maker
		
	}
	
	public func pinLeft(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinLeft(to: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
	
	}
	
	public func pinLeft(to referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> LeftDidSetLayoutMaker {
		
		let left = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform)
		
		let maker = LeftDidSetLayoutMaker(parentView: self.parentView,
		                                  left: left)
		
		return maker
		
	}
	
	public func setLeft(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> LeftDidSetLayoutMaker {
		
		let left = CGRect.Float.closure(calculation)
		
		let maker = LeftDidSetLayoutMaker(parentView: self.parentView,
		                                  left: left)
		
		return maker
		
	}
	
}

extension InitialLayoutMaker {
	
	public func setCenter(to center: CGFloat) -> CenterDidSetLayoutMaker {
		
		let center = CGRect.Float.constant(center)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
	public func pinCenter(to referenceView: UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinCenter(to: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinCenter(to referenceView: @escaping () -> UIView?, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> CenterDidSetLayoutMaker {
		
		let center = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
	public func setCenter(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> CenterDidSetLayoutMaker {
		
		let center = CGRect.Float.closure(calculation)
		
		let maker = CenterDidSetLayoutMaker(parentView: self.parentView,
		                                    center: center)
		
		return maker
		
	}
	
}

extension InitialLayoutMaker {
	
	public func setTopLeft(to topLeft: CGPoint) -> TopLeftDidSetLayoutMaker {
		
		let topLeft = CGRect.Point.constant(topLeft)
		
		let maker = TopLeftDidSetLayoutMaker(parentView: self.parentView,
		                                     topLeft: topLeft)
		
		return maker
		
	}
	
	public func pinTopLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> TopLeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopLeft(to: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinTopLeft(to referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> TopLeftDidSetLayoutMaker {
		
		let topLeft = self.parentView.pointReference(reference, of: referenceView, offsetBY: offset, ignoresTransform: ignoresTransform)
		
		let maker = TopLeftDidSetLayoutMaker(parentView: self.parentView,
		                                     topLeft: topLeft)
		
		return maker
		
	}
	
	public func setTopLeft(by calculation: @escaping (_ boundSize: CGSize) -> CGPoint) -> TopLeftDidSetLayoutMaker {
		
		let topLeft = CGRect.Point.closure(calculation)
		
		let maker = TopLeftDidSetLayoutMaker(parentView: self.parentView,
		                                     topLeft: topLeft)
		
		return maker
		
	}
	
}

extension InitialLayoutMaker {
	
	public func setTopCenter(to topCenter: CGPoint) -> TopCenterDidSetLayoutMaker {
		
		let topCenter = CGRect.Point.constant(topCenter)
		
		let maker = TopCenterDidSetLayoutMaker(parentView: self.parentView,
		                                       topCenter: topCenter)
		
		return maker
		
	}
	
	public func pinTopCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> TopCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopCenter(to: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinTopCenter(to referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> TopCenterDidSetLayoutMaker {
		
		let topCenter = self.parentView.pointReference(reference, of: referenceView, offsetBY: offset, ignoresTransform: ignoresTransform)
		
		let maker = TopCenterDidSetLayoutMaker(parentView: self.parentView,
		                                       topCenter: topCenter)
		
		return maker
		
	}
	
	public func setTopCenter(by calculation: @escaping (_ boundSize: CGSize) -> CGPoint) -> TopCenterDidSetLayoutMaker {
		
		let topCenter = CGRect.Point.closure(calculation)
		
		let maker = TopCenterDidSetLayoutMaker(parentView: self.parentView,
		                                       topCenter: topCenter)
		
		return maker
		
	}
	
}

extension InitialLayoutMaker {
	
	public func setTopRight(to topRight: CGPoint) -> TopRightDidSetLayoutMaker {
		
		let topRight = CGRect.Point.constant(topRight)
		
		let maker = TopRightDidSetLayoutMaker(parentView: self.parentView,
		                                      topRight: topRight)
		
		return maker
		
	}
	
	public func pinTopRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> TopRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinTopRight(to: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinTopRight(to referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> TopRightDidSetLayoutMaker {
		
		let topRight = self.parentView.pointReference(reference, of: referenceView, offsetBY: offset, ignoresTransform: ignoresTransform)
		
		let maker = TopRightDidSetLayoutMaker(parentView: self.parentView,
		                                      topRight: topRight)
		
		return maker
		
	}
	
	public func setTopRight(by calculation: @escaping (_ boundSize: CGSize) -> CGPoint) -> TopRightDidSetLayoutMaker {
		
		let topRight = CGRect.Point.closure(calculation)
		
		let maker = TopRightDidSetLayoutMaker(parentView: self.parentView,
		                                      topRight: topRight)
		
		return maker
		
	}
	
}

extension InitialLayoutMaker {
	
	public func setMiddleLeft(to middleLeft: CGPoint) -> MiddleLeftDidSetLayoutMaker {
		
		let middleLeft = CGRect.Point.constant(middleLeft)
		
		let maker = MiddleLeftDidSetLayoutMaker(parentView: self.parentView,
		                                        middleLeft: middleLeft)
		
		return maker
		
	}
	
	public func pinMiddleLeft(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> MiddleLeftDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleLeft(to: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinMiddleLeft(to referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> MiddleLeftDidSetLayoutMaker {
		
		let middleLeft = self.parentView.pointReference(reference, of: referenceView, offsetBY: offset, ignoresTransform: ignoresTransform)
		
		let maker = MiddleLeftDidSetLayoutMaker(parentView: self.parentView,
		                                        middleLeft: middleLeft)
		
		return maker
		
	}
	
	public func setMiddleLeft(by calculation: @escaping (_ boundSize: CGSize) -> CGPoint) -> MiddleLeftDidSetLayoutMaker {
		
		let middleLeft = CGRect.Point.closure(calculation)
		
		let maker = MiddleLeftDidSetLayoutMaker(parentView: self.parentView,
		                                        middleLeft: middleLeft)
		
		return maker
		
	}
	
}

extension InitialLayoutMaker {
	
	public func setMiddleCenter(to middleCenter: CGPoint) -> MiddleCenterDidSetLayoutMaker {
		
		let middleCenter = CGRect.Point.constant(middleCenter)
		
		let maker = MiddleCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          middleCenter: middleCenter)
		
		return maker
		
	}
	
	public func pinMiddleCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> MiddleCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleCenter(to: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinMiddleCenter(to referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> MiddleCenterDidSetLayoutMaker {
		
		let middleCenter = self.parentView.pointReference(reference, of: referenceView, offsetBY: offset, ignoresTransform: ignoresTransform)
		
		let maker = MiddleCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          middleCenter: middleCenter)
		
		return maker
		
	}
	
	public func setMiddleCenter(by calculation: @escaping (_ boundSize: CGSize) -> CGPoint) -> MiddleCenterDidSetLayoutMaker {
		
		let middleCenter = CGRect.Point.closure(calculation)
		
		let maker = MiddleCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          middleCenter: middleCenter)
		
		return maker
		
	}
	
}

extension InitialLayoutMaker {
	
	public func setMiddleRight(to middleRight: CGPoint) -> MiddleRightDidSetLayoutMaker {
		
		let middleRight = CGRect.Point.constant(middleRight)
		
		let maker = MiddleRightDidSetLayoutMaker(parentView: self.parentView,
		                                         middleRight: middleRight)
		
		return maker
		
	}
	
	public func pinMiddleRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> MiddleRightDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddleRight(to: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinMiddleRight(to referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> MiddleRightDidSetLayoutMaker {
		
		let middleRight = self.parentView.pointReference(reference, of: referenceView, offsetBY: offset, ignoresTransform: ignoresTransform)
		
		let maker = MiddleRightDidSetLayoutMaker(parentView: self.parentView,
		                                         middleRight: middleRight)
		
		return maker
		
	}
	
	public func setMiddleRight(by calculation: @escaping (_ boundSize: CGSize) -> CGPoint) -> MiddleRightDidSetLayoutMaker {
		
		let middleRight = CGRect.Point.closure(calculation)
		
		let maker = MiddleRightDidSetLayoutMaker(parentView: self.parentView,
		                                         middleRight: middleRight)
		
		return maker
		
	}

}

extension InitialLayoutMaker {
	
	public func setBottomCenter(to bottomCenter: CGPoint) -> BottomCenterDidSetLayoutMaker {
		
		let bottomCenter = CGRect.Point.constant(bottomCenter)
		
		let maker = BottomCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          bottomCenter: bottomCenter)
		
		return maker
		
	}
	
	public func pinBottomCenter(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> BottomCenterDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomCenter(to: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	public func pinBottomCenter(to referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> BottomCenterDidSetLayoutMaker {
		
		let bottomCenter = self.parentView.pointReference(reference, of: referenceView, offsetBY: offset, ignoresTransform: ignoresTransform)
		
		let maker = BottomCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          bottomCenter: bottomCenter)
		
		return maker
		
	}
	
	public func setBottomCenter(by calculation: @escaping (_ boundSize: CGSize) -> CGPoint) -> BottomCenterDidSetLayoutMaker {
		
		let bottomCenter = CGRect.Point.closure(calculation)
		
		let maker = BottomCenterDidSetLayoutMaker(parentView: self.parentView,
		                                          bottomCenter: bottomCenter)
		
		return maker
		
	}
	
}

extension InitialLayoutMaker {
	
	public func stickOnParent() -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
			return CGRect(origin: .zero, size: boundSize)
		}
		
		return layout
		
	}
	
}

extension InitialLayoutMaker {
	
	public func makeFrame(_ frame: CGRect) -> Layout.Individual {
		
		let layout = Layout.Individual.makeAbsolute(frame: frame)
		
		return layout
		
	}
	
	public func makeFrame(_ frame: @escaping (CGSize) -> CGRect) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom(frame: frame)
		
		return layout
		
	}
	
	public func makeFrame(frame: @escaping (_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ boundSize: CGSize) -> CGRect) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom(frame: frame)
		
		return layout
		
	}
	
}
