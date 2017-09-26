//
//  TopCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopCenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topCenter: CGRect.Point
	
}

extension TopCenterDidSetLayoutMaker {
	
	private func makeFrame(topCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = topCenter.x - size.width.half
		let y = topCenter.y
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension TopCenterDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> TopCenterBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.constant(bottom)
		
		let maker = TopCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             bottom: bottom)
		
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopCenterBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.closure(bottom)
		
		let maker = TopCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopCenterBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopCenterBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopCenterBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = TopCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopCenterBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = TopCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             bottom: bottom)
		
		return maker
		
	}
	
}

extension TopCenterDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> TopCenterWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.constant(width)
		
		let maker = TopCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                            topCenter: self.topCenter,
		                                            width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopCenterWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(width)
		
		let maker = TopCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                            topCenter: self.topCenter,
		                                            width: width)
		
		return maker
		
	}
	
}

extension TopCenterDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> Layout {
		
		if let topCenter = self.topCenter.constantValue {
			let frame = self.makeFrame(topCenter: topCenter, size: size)
			let layout = Layout.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.makeCustom { (boundSize) -> CGRect in
				let topCenter = self.topCenter.closureValue(boundSize)
				let frame = self.makeFrame(topCenter: topCenter, size: size)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> Layout {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			
			let topCenter = self.topCenter.closureValue(parameter)
			let size = size(parameter)
			let frame = self.makeFrame(topCenter: topCenter, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> Layout {
		
		let layout = Layout.makeCustom { (fitting, boundSize) -> CGRect in
			
			let topCenter = self.topCenter.closureValue(boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(topCenter: topCenter, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
