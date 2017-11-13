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
	
	func storeFrame(_ frame: LayoutElement.Rect) -> WillSetFrameMaker
	
}

extension LayoutMakerCanSetFrameType {
    
    public func makeFrame(_ frame: CGRect) -> WillSetFrameMaker {
        
        let frame = LayoutElement.Rect.constant(frame)
        
        let maker = self.storeFrame(frame)
        
        return maker
        
    }
    
    public func makeFrame(_ frame: @escaping (_ parameter: LayoutControlParameter) -> CGRect) -> WillSetFrameMaker {
        
        let frame = LayoutElement.Rect.closure(frame)
        
        let maker = self.storeFrame(frame)
        
        return maker
        
    }
    
}

extension LayoutMakerCanSetFrameType {
    
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

public protocol LayoutMakerCanSetFrameToMakeLayoutEditorType: LayoutMakerCanSetFrameType where WillSetFrameMaker == LayoutEditor {
    
    func evaluateFrame(frame: LayoutElement.Rect, parameter: LayoutControlParameter) -> CGRect
    
}

extension LayoutMakerCanSetFrameToMakeLayoutEditorType {
	
    public func storeFrame(_ frame: LayoutElement.Rect) -> WillSetFrameMaker {
        
        let layout = Layout(frame: { (parameter) -> CGRect in
            return self.evaluateFrame(frame: frame, parameter: parameter)
        })
        
        let editor = LayoutEditor(layout)
        
        return editor
        
    }
    
}
