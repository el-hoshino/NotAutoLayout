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
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopCenterBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform)
		
		let maker = TopCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             bottom: bottom)
		
		return maker
		
	}
	
	public func setBottom(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> TopCenterBottomDidSetLayoutMaker {
		
		let bottom = CGRect.Float.closure(calculation)
		
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
	
	public func calculateWidth(by calcuation: @escaping (_ boundSize: CGSize) -> CGFloat) -> TopCenterWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(calcuation)
		
		let maker = TopCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                            topCenter: self.topCenter,
		                                            width: width)
		
		return maker
		
	}
	
}

extension TopCenterDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> Layout.Individual {
		
		if let topCenter = self.topCenter.constantValue {
			let frame = self.makeFrame(topCenter: topCenter, size: size)
			let layout = Layout.Individual.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
				let topCenter = self.topCenter.closureValue(boundSize)
				let frame = self.makeFrame(topCenter: topCenter, size: size)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setSize(by calculation: @escaping (_ boundSize: CGSize) -> CGSize) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
			
			let topCenter = self.topCenter.closureValue(boundSize)
			let size = calculation(boundSize)
			let frame = self.makeFrame(topCenter: topCenter, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (fitting, boundSize) -> CGRect in
			
			let topCenter = self.topCenter.closureValue(boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(topCenter: topCenter, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
