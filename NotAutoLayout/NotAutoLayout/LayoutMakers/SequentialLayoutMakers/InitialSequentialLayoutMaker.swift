//
//  SequentialLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct InitialSequentialLayoutMaker {
	
	public unowned let parentView: UIView
	
}

extension InitialSequentialLayoutMaker {
	
	public func makeFirstLayout(by making: (InitialLayoutMaker) -> LayoutEditor) -> FirstLayoutDidSetSequentialLayoutMaker {
		
		let firstLayoutMaker = InitialLayoutMaker(parentView: self.parentView)
		let firstLayout = making(firstLayoutMaker).layout
		let maker = FirstLayoutDidSetSequentialLayoutMaker(parentView: self.parentView,
		                                                   firstLayout: firstLayout)
		
		return maker
		
	}
	
}
