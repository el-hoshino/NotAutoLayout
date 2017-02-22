//
//  LayoutView.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/02/09.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

open class LayoutView: UIView, LayoutControllable {
	
	public var layoutInfo: [UIView: [LayoutMethod]] = [:]
	public var zIndexInfo: [UIView : Int] = [:]
	
}

extension LayoutView {
	
	open override func layoutSubviews() {
		super.layoutSubviews()
		self.layoutControl()
	}
	
}
