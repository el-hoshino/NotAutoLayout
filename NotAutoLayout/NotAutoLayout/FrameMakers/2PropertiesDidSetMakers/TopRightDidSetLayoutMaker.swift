//
//  TopRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopRightDidSetLayoutMaker {
	
	unowned let parentView: UIView
	
	let topRight: CGRect.Point
	
}

extension TopRightDidSetLayoutMaker {
	
	public func pinLeft(to referenceView: UIView, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopRightLeftDidSetLayoutMaker {
		
		let left = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform)
		
		let maker = TopRightLeftDidSetLayoutMaker(parentView: self.parentView,
		                                          topRight: self.topRight,
		                                          left: left)
		
		return maker
		
	}
	
}
