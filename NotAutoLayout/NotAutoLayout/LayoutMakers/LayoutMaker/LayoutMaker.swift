//
//  LayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/10.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutElementType {
	
}

public struct LayoutMaker <DidSetLayoutElement: LayoutElementType> {
	
	public unowned let parentView: UIView
	
	let didSetLayoutElement: DidSetLayoutElement
	
}
