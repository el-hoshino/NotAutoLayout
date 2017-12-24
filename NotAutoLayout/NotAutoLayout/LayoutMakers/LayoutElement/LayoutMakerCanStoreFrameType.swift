//
//  LayoutPropertyCanStoreFrameType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreFrameType: LayoutMakerPropertyType {
	
	associatedtype WillSetFrameProperty
	
	func storeFrame(_ frame: LayoutElement.Rect) -> WillSetFrameProperty
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreFrameType {
	
	func storeFrame(_ frame: LayoutElement.Rect) -> LayoutMaker<Property.WillSetFrameProperty> {
		
		let property = self.didSetProperty.storeFrame(frame)
		let maker = LayoutMaker<Property.WillSetFrameProperty>(parentView: self.parentView, didSetProperty: property)
		
		return maker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreFrameType {
	
	public func setFrame(to frame: CGRect) -> LayoutMaker<Property.WillSetFrameProperty> {
		
		let frame = LayoutElement.Rect.constant(frame)
		return self.storeFrame(frame)
		
	}
	
	public func setFrame(by frame: @escaping (_ property: ViewFrameProperty) -> CGRect) -> LayoutMaker<Property.WillSetFrameProperty> {
		
		let frame = LayoutElement.Rect.byParent(frame)
		return self.storeFrame(frame)
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreFrameType {
	
    public func stickOnParent(withInsets insets: UIEdgeInsets = .zero) -> LayoutMaker<Property.WillSetFrameProperty> {
        
        let frame = LayoutElement.Rect.byParent({ $0.boundsWithZeroOrigin().inside(insets) })
        return self.storeFrame(frame)
        
    }
    
    @available(iOS 11.0, *)
    public func stickOnParent(withInsets insets: UIEdgeInsets = .zero, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutMaker<Property.WillSetFrameProperty> {
        
        let frame = LayoutElement.Rect.byParent({ $0.boundsWithZeroOrigin(safeAreaOnly: shouldOnlyIncludeSafeArea).inside(insets) })
        
        let maker = storeFrame(frame)
        
        return maker

    }
    
}

public protocol LayoutPropertyCanStoreFrameToEvaluateFrameType: LayoutPropertyCanStoreFrameType {
    
    func evaluateFrame(frame: LayoutElement.Rect, property: ViewFrameProperty) -> CGRect
    
}

extension LayoutPropertyCanStoreFrameToEvaluateFrameType {
	
	typealias WillSetFrameProperty = Layout
	
    public func storeFrame(_ frame: LayoutElement.Rect) -> Layout {
        
        let layout = Layout(frame: { (property) -> CGRect in
            return self.evaluateFrame(frame: frame, property: property)
        })
        
        return layout
        
    }
    
}
