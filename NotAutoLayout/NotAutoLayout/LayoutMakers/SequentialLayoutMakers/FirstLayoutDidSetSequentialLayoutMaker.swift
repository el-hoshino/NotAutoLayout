//
//  FirstLayoutDidSetSequentialLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct FirstLayoutDidSetSequentialLayoutMaker {
	
	public unowned let parentView: UIView
	
	let firstLayout: Layout
	
}

extension FirstLayoutDidSetSequentialLayoutMaker {
	
	public func setRestFrames(by making: (SequentialLayoutEditor) -> SequentialLayoutEditor) -> SequentialLayout {
		
		let maker = SequentialLayoutEditor(self.firstLayout)
		let layout = making(maker).sequentialLayout
		
		return layout
		
	}
	
}
