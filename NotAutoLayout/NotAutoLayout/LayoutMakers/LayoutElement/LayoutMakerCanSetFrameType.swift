//
//  LayoutMakerCanSetFrameType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanSetFrameType: LayoutMakerType {
	
	associatedtype WillSetFrameMaker
	
	func setFrame(_ frame: LayoutElement.Rect) -> WillSetFrameMaker
	
}

// MARK: - On Parent
extension LayoutMakerCanSetFrameType {
	
	public func stickOnParent(withInsets insets: UIEdgeInsets = .zero) -> WillSetFrameMaker {
		
		let frame = LayoutElement.Rect.closure { (parameter) -> CGRect in
			parameter.boundsWithZeroOrigin().inside(insets)
		}
		
		let maker = self.setFrame(frame)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func stickOnParent(withInsets insets: UIEdgeInsets = .zero, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetFrameMaker {
		
		let frame = LayoutElement.Rect.closure { (parameter) -> CGRect in
			return parameter.boundsWithZeroOrigin(safeAreaOnly: shouldOnlyIncludeSafeArea).inside(insets)
		}
		
		let maker = self.setFrame(frame)
		
		return maker
		
	}
	
}
