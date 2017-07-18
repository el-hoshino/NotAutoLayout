//
//  MiddleCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleCenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleCenter: CGRect.Point
	
}

extension MiddleCenterDidSetLayoutMaker {
	
	private func makeFrame(middleCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleCenter.x - size.width.half
		let y = middleCenter.y - size.height.half
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension MiddleCenterDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> MiddleCenterWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.constant(width)
		
		let maker = MiddleCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               middleCenter: self.middleCenter,
		                                               width: width)
		
		return maker
		
	}
	
	public func setWidth(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> MiddleCenterWidthDidSetLayoutMaker {
		
		let width = CGRect.Float.closure(calculation)
		
		let maker = MiddleCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               middleCenter: self.middleCenter,
		                                               width: width)
		
		return maker
		
	}
	
}

extension MiddleCenterDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> Layout.Individual {
		
		if let middleCenter = self.middleCenter.constantValue {
			let frame = self.makeFrame(middleCenter: middleCenter, size: size)
			let layout = Layout.Individual.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
				let middleCenter = self.middleCenter.closureValue(boundSize)
				let frame = self.makeFrame(middleCenter: middleCenter, size: size)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setSize(by calculation: @escaping (_ boundSize: CGSize) -> CGSize) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
			let middleCenter = self.middleCenter.closureValue(boundSize)
			let size = calculation(boundSize)
			let frame = self.makeFrame(middleCenter: middleCenter, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (fitting, boundSize) -> CGRect in
			
			let middleCenter = self.middleCenter.closureValue(boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(middleCenter: middleCenter, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
