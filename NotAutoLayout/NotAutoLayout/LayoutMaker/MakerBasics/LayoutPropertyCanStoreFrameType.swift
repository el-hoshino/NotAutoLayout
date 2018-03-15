//
//  LayoutPropertyCanStoreFrameType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreFrameType: LayoutMakerPropertyType {
	
	associatedtype WillSetFrameProperty: LayoutMakerPropertyType
	
	func storeFrame(_ frame: LayoutElement.Rect, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetFrameProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreFrameType {
	
	public func setFrame(to frame: CGRect) -> LayoutMaker<Property.WillSetFrameProperty> {
		
		let frame = LayoutElement.Rect.constant(frame)
		let maker = self.didSetProperty.storeFrame(frame, to: self)
		
		return maker
		
	}
	
	public func setFrame(by frame: @escaping (_ property: ViewLayoutGuides) -> CGRect) -> LayoutMaker<Property.WillSetFrameProperty> {
		
		let frame = LayoutElement.Rect.byParent(frame)
		let maker = self.didSetProperty.storeFrame(frame, to: self)
		
		return maker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreFrameType {
	
    public func stickOnParent(withInsets insets: UIEdgeInsets = .zero) -> LayoutMaker<Property.WillSetFrameProperty> {
        
        let frame = LayoutElement.Rect.byParent({ $0.boundsGuide.frame(inside: insets) })
        let maker = self.didSetProperty.storeFrame(frame, to: self)
		
		return maker
        
    }
    
    @available(iOS 11.0, *)
    public func stickOnParentSafeArea(withInsets insets: UIEdgeInsets = .zero) -> LayoutMaker<Property.WillSetFrameProperty> {
        
        let frame = LayoutElement.Rect.byParent({ $0.safeAreaGuide.frame(inside: insets) })
        let maker = self.didSetProperty.storeFrame(frame, to: self)
        
        return maker

    }
    
}

public protocol LayoutPropertyCanStoreFrameToEvaluateFrameType: LayoutPropertyCanStoreFrameType {
    
    func evaluateFrame(frame: LayoutElement.Rect, parameters: IndividualFrameCalculationParameters) -> CGRect
    
}

extension LayoutPropertyCanStoreFrameToEvaluateFrameType {
	
	public typealias WillSetFrameProperty = IndividualLayout
	
	public func storeFrame(_ frame: LayoutElement.Rect, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetFrameProperty> {
		
		let layout = IndividualLayout(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(frame: frame, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
        
        return maker
        
    }
    
}
