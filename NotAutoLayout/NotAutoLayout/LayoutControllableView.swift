//
//  LayoutControllableView.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/02/23.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension LayoutControllable where Self: UIView {
	
	public var canvasSize: CGSize {
		return self.bounds.size
	}
	
}
