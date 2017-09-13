//
//  LayoutControlParameter.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/13.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LayoutControlParameter {
	
	public let boundSize: CGSize
	
	public let safeAreaInsets: UIEdgeInsets
	
}

extension LayoutControlParameter {
	
	static func initialize(from view: UIView) -> LayoutControlParameter {
		
		let boundSize = view.bounds.size
		let safeAreaInsets: UIEdgeInsets = {
			if #available(iOS 11.0, *) {
				return view.safeAreaInsets
			} else {
				return .zero
			}
		}()
		
		let parameter = LayoutControlParameter(boundSize: boundSize, safeAreaInsets: safeAreaInsets)
		
		return parameter
		
	}
	
}
