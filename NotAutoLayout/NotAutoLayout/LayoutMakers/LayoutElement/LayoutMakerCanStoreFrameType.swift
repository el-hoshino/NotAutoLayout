//
//  LayoutMakerCanStoreFrameType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanStoreFrameType: LayoutMakerType {
	
	associatedtype WillSetFrameMaker
	
	func storeFrame(_ frame: LayoutElement.Rect) -> WillSetFrameMaker
	
}

extension LayoutMakerCanStoreFrameType {
	
	@available(iOS, deprecated, message: "Use `setFrame(to frame: CGRect)` instead.")
    public func makeFrame(_ frame: CGRect) -> WillSetFrameMaker {
		return self.setFrame(to: frame)
    }
	
	@available(iOS, deprecated, message: "Use `setFrame(by frame: @escaping (_ parameter: ViewFrameProperty) -> CGRect)` instead.")
    public func makeFrame(_ frame: @escaping (_ parameter: ViewFrameProperty) -> CGRect) -> WillSetFrameMaker {
		return self.setFrame(by: frame)
    }
    
}

extension LayoutMakerCanStoreFrameType {
	
	public func setFrame(to frame: CGRect) -> WillSetFrameMaker {
		
		let frame = LayoutElement.Rect.constant(frame)
		
		let maker = self.storeFrame(frame)
		
		return maker
		
	}
	
	public func setFrame(by frame: @escaping (_ parameter: ViewFrameProperty) -> CGRect) -> WillSetFrameMaker {
		
		let frame = LayoutElement.Rect.closure(frame)
		
		let maker = self.storeFrame(frame)
		
		return maker
		
	}
	
}

extension LayoutMakerCanStoreFrameType {
    
    public func stickOnParent(withInsets insets: UIEdgeInsets = .zero) -> WillSetFrameMaker {
        
        let frame = LayoutElement.Rect.closure({ $0.boundsWithZeroOrigin().inside(insets) })
        
        let maker = storeFrame(frame)
        
        return maker
        
    }
    
    @available(iOS 11.0, *)
    public func stickOnParent(withInsets insets: UIEdgeInsets = .zero, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetFrameMaker {
        
        let frame = LayoutElement.Rect.closure({ $0.boundsWithZeroOrigin(safeAreaOnly: shouldOnlyIncludeSafeArea).inside(insets) })
        
        let maker = storeFrame(frame)
        
        return maker

    }
    
}

public protocol LayoutMakerCanStoreFrameToEvaluateFrameType: LayoutMakerCanStoreFrameType where WillSetFrameMaker == LayoutEditor {
    
    func evaluateFrame(frame: LayoutElement.Rect, parameter: ViewFrameProperty) -> CGRect
    
}

extension LayoutMakerCanStoreFrameToEvaluateFrameType {
	
    public func storeFrame(_ frame: LayoutElement.Rect) -> WillSetFrameMaker {
        
        let layout = Layout(frame: { (parameter) -> CGRect in
            return self.evaluateFrame(frame: frame, parameter: parameter)
        })
        
        let editor = LayoutEditor(layout)
        
        return editor
        
    }
    
}
