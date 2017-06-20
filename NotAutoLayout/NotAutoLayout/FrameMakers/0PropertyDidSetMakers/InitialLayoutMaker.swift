//
//  InitialLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct InitialLayoutMaker {
	
}

extension InitialLayoutMaker {
	
	public func setLeft(to baseline: CGFloat) -> LeftDidSetLayoutMaker {
		
		let maker = LeftDidSetLayoutMaker(left: .constant(baseline))
		
		return maker
		
	}
	
	public func pinLeft(to referenceView: UIView, s horizontalReference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = true) -> LeftDidSetLayoutMaker {
		
		let left = CGRect.Float.closure { [weak referenceView] (_) -> CGFloat in
			
			guard let referenceView = referenceView else {
				return offset
			}
			
			let frame = referenceView.nal.frame(thatIgnoresTransform: ignoresTransform)
			
			let leftReference = frame.x + (frame.width * horizontalReference.value)
			
			let result = leftReference + offset
			
			return result
			
		}
		
		let maker = LeftDidSetLayoutMaker(left: left)
		
		return maker
		
	}
	
	public func calculateLeft(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> LeftDidSetLayoutMaker {
		
		let left = CGRect.Float.closure(calculation)
		
		let maker = LeftDidSetLayoutMaker(left: left)
		
		return maker
		
	}
	
}
