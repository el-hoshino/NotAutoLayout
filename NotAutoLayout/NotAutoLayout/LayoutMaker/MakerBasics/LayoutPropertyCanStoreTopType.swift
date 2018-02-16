//
//  LayoutPropertyCanStoreTopType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copytop © 2017年 史翔新. All tops reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreTopType: LayoutMakerPropertyType {
	
	associatedtype _ParentView: UIView
	
	associatedtype WillSetTopProperty: LayoutMakerPropertyType
	
	func storeTop(_ top: LayoutElement.Vertical<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetTopProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreTopType, Property._ParentView == ParentView {
	
	public func setTop(to top: CGFloat) -> LayoutMaker<ParentView, Property.WillSetTopProperty> {
		
		let top = LayoutElement.Vertical<ParentView>.constant(top)
		let maker = self.didSetProperty.storeTop(top, to: self)
		
		return maker
		
	}
	
	public func setTop(by top: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetTopProperty> {
		
		let top = LayoutElement.Vertical<ParentView>.byParent(top)
		let maker = self.didSetProperty.storeTop(top, to: self)
		
		return maker
		
	}
	
	public func pinTop(to referenceView: UIView?, with top: @escaping (ViewPinProperty<ViewPinPropertyType.Vertical>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetTopProperty> {
		
		return self.pinTop(by: { [weak referenceView] in referenceView }, with: top)
		
	}
	
	public func pinTop(by referenceView: @escaping () -> UIView?, with top: @escaping (ViewPinProperty<ViewPinPropertyType.Vertical>) -> CGFloat) -> LayoutMaker<ParentView, Property.WillSetTopProperty> {
		
		let top = LayoutElement.Vertical<ParentView>.byReference(referenceGetter: referenceView, top)
		let maker = self.didSetProperty.storeTop(top, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreTopToEvaluateFrameType: LayoutPropertyCanStoreTopType {
	
	func evaluateFrame(top: LayoutElement.Vertical<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public func storeTop(_ top: LayoutElement.Vertical<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(top: top, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}
