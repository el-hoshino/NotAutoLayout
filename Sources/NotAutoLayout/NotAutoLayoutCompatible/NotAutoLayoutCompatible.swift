//
//  LayoutContainer.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/14.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import UIKit

public protocol NotAutoLayoutCompatible: class {
	
	///
	associatedtype NAL
	
	///
	var nal: NAL { get }
	
}

extension NotAutoLayoutCompatible where Self: UIView {
	
	///
	public var nal: NotAutoLayoutContainer<Self> {
		return NotAutoLayoutContainer(body: self)
	}
	
}

extension UIView: NotAutoLayoutCompatible { }
