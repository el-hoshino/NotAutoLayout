//
//  PropertyCategory.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

protocol LeftPointPropertyDidSet {
	var left: CGFloat { get }
}

protocol TopPointPropertyDidSet {
	var top: CGFloat { get }
}

protocol WidthPropertyDidSet {
	var width: CGFloat { get }
}
