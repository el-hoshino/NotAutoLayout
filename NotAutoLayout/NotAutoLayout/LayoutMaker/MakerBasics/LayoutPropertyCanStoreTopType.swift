//
//  LayoutPropertyCanStoreTopType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copytop © 2017年 史翔新. All tops reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreTopType: LayoutMakerPropertyType {
	
	associatedtype WillSetTopProperty: LayoutMakerPropertyType
	
	func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<Self>) -> LayoutMaker<WillSetTopProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreTopType {
	
	public func setTop(to top: Float) -> LayoutMaker<Property.WillSetTopProperty> {
		
		let top = LayoutElement.Vertical.constant(top)
		let maker = self.didSetProperty.storeTop(top, to: self)
		
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ property: ViewLayoutGuides) -> Float) -> LayoutMaker<Property.WillSetTopProperty> {
		
		let top = LayoutElement.Vertical.byParent(top)
		let maker = self.didSetProperty.storeTop(top, to: self)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, with top: @escaping (ViewPinGuides.Vertical) -> Float) -> LayoutMaker<Property.WillSetTopProperty> {
		
		return self.pinTop(by: { [weak referenceView] in referenceView }, with: top)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, with top: @escaping (ViewPinGuides.Vertical) -> Float) -> LayoutMaker<Property.WillSetTopProperty> {
		
		let top = LayoutElement.Vertical.byReference(referenceGetter: referenceView, top)
		let maker = self.didSetProperty.storeTop(top, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreTopToEvaluateFrameType: LayoutPropertyCanStoreTopType {
	
	func evaluateFrame(top: LayoutElement.Vertical, parameters: IndividualFrameCalculationParameters) -> Rect
	
}

extension LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func storeTop(_ top: LayoutElement.Vertical, to maker: LayoutMaker<Self>) -> LayoutMaker<IndividualLayout> {
		
		let layout = IndividualLayout(frame: { (parameters) -> Rect in
			return self.evaluateFrame(top: top, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}
