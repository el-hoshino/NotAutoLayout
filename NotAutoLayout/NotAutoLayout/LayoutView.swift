//
//  LayoutView.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/02/09.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

/// The very basic `UIView` that conforms `LayoutControllable` protocol, to layout subviews.
open class LayoutView: UIView, LayoutControllable {
	
	public var layoutInfo: [LayoutControllable.Hash: [LayoutMethod]] = [:]
	public var orderInfo: [LayoutControllable.Hash : Int] = [:]
	public var zIndexInfo: [LayoutControllable.Hash : Int] = [:]
	
	public var layoutOptimization: LayoutOptimization = .none
	
	open override func layoutSubviews() {
		super.layoutSubviews()
		self.layoutControl()
	}
	
}
