//
//  LayoutMakerCanSetFrameType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanSetFrameType: LayoutMakerType {
	
}

// MARK: - On Parent
extension LayoutMakerCanSetFrameType {
	
	public func stickOnParent(withInsets insets: UIEdgeInsets = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return parameter.boundsWithZeroOrigin().inside(insets)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	@available(iOS 11.0, *)
	public func stickOnParent(withInsets insets: UIEdgeInsets = .zero, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			return parameter.boundsWithZeroOrigin(safeAreaOnly: shouldOnlyIncludeSafeArea).inside(insets)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Custom Frame
extension LayoutMakerCanSetFrameType {
	
	public func makeFrame(_ frame: CGRect) -> LayoutEditor {
		
		let layout = Layout(frame: frame)
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func makeFrame(_ frame: @escaping (_ parameter: LayoutControlParameter) -> CGRect) -> LayoutEditor {
		
		let layout = Layout(frame: frame)
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func makeFrame(_ frame: @escaping (_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ parameter: LayoutControlParameter) -> CGRect) -> LayoutEditor {
		
		let layout = Layout(frame: frame)
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
