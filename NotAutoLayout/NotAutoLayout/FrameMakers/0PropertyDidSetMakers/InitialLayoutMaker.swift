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
	
	public func setLeft(to baseline: CGFloat) -> LeftPointDidSetLayoutMaker {
		
		let maker = LeftPointDidSetLayoutMaker(left: baseline)
		return maker
		
	}
	
}
