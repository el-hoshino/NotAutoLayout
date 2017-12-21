//
//  ViewPinProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/12/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol ViewPinHorizontalProperty {
	
}
public protocol ViewPinVerticalProperty {
	
}

public struct ViewPinPropertyType {
	
	public struct Horizontal {
		
		fileprivate weak var parentView: UIView?
		fileprivate weak var referenceView: UIView?
		
	}
	
	public struct Vertical {
		
		fileprivate weak var parentView: UIView?
		fileprivate weak var referenceView: UIView?
		
	}
	
}

public struct ViewPinProperty<Property> {
	
	private var property: Property
	
}
