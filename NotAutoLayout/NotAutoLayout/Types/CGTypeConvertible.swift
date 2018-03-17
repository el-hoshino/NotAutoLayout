//
//  CGTypeConvertible.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/16.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public protocol CGTypeConvertible {
	
	associatedtype CGType
	
	var cgValue: CGType { get }
	
	init(_ cgValue: CGType)
	
}
