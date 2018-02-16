//
//  LayoutPropertyCanStoreFrameType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreFrameType: LayoutMakerPropertyType {
	
	associatedtype _ParentView: UIView
	
	associatedtype WillSetFrameProperty: LayoutMakerPropertyType
	
	func storeFrame(_ frame: LayoutElement.Rect<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetFrameProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreFrameType, Property._ParentView == ParentView {
	
	public func setFrame(to frame: CGRect) -> LayoutMaker<ParentView, Property.WillSetFrameProperty> {
		
		let frame = LayoutElement.Rect<ParentView>.constant(frame)
		let maker = self.didSetProperty.storeFrame(frame, to: self)
		
		return maker
		
	}
	
	public func setFrame(by frame: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGRect) -> LayoutMaker<ParentView, Property.WillSetFrameProperty> {
		
		let frame = LayoutElement.Rect.byParent(frame)
		let maker = self.didSetProperty.storeFrame(frame, to: self)
		
		return maker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreFrameType, Property._ParentView == ParentView {
	
    public func stickOnParent(withInsets insets: UIEdgeInsets = .zero) -> LayoutMaker<ParentView, Property.WillSetFrameProperty> {
        
        let frame = LayoutElement.Rect<ParentView>.byParent({ $0.boundFrame.inside(insets) })
        let maker = self.didSetProperty.storeFrame(frame, to: self)
		
		return maker
        
    }
    
    @available(iOS 11.0, *)
    public func stickOnParentSafeArea(withInsets insets: UIEdgeInsets = .zero) -> LayoutMaker<ParentView, Property.WillSetFrameProperty> {
        
        let frame = LayoutElement.Rect<ParentView>.byParent({ $0.safeFrame.inside(insets) })
        let maker = self.didSetProperty.storeFrame(frame, to: self)
        
        return maker

    }
    
}

public protocol LayoutPropertyCanStoreFrameToEvaluateFrameType: LayoutPropertyCanStoreFrameType {
    
    func evaluateFrame(frame: LayoutElement.Rect<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
    
}

extension LayoutPropertyCanStoreFrameToEvaluateFrameType {
	
	public func storeFrame(_ frame: LayoutElement.Rect<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(frame: frame, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
        
        return maker
        
    }
    
}
