//
//  LayoutPropertyCanStoreSizeType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/13.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreSizeType: LayoutMakerPropertyType {
		
	associatedtype WillSetSizeProperty: LayoutMakerPropertyType
	
	func storeSize(_ size: LayoutElement.Size<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, WillSetSizeProperty>
	
}

extension LayoutMaker where Property: LayoutPropertyCanStoreSizeType, Property._ParentView == ParentView {
	
	public func setSize(to size: CGSize) -> LayoutMaker<ParentView, Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size<ParentView>.constant(size)
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
	public func setSize(by size: @escaping (_ property: ViewFrameProperty<ParentView>) -> CGSize) -> LayoutMaker<ParentView, Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size<ParentView>.byParent(size)
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutMaker<ParentView, Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size<ParentView>.fits(fittingSize)
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
	public func aspectFit(ratio: CGFloat? = nil) -> LayoutMaker<ParentView, Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size<ParentView>.aspect(.fit(ratio))
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
	public func aspectFill(ratio: CGFloat? = nil) -> LayoutMaker<ParentView, Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size<ParentView>.aspect(.fill(ratio))
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func aspectFit(ratio: CGFloat? = nil, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutMaker<ParentView, Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size<ParentView>.aspect(.safeAreaFit(ratio, safeAreaOnly: shouldOnlyIncludeSafeArea))
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func aspectFill(ratio: CGFloat? = nil, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> LayoutMaker<ParentView, Property.WillSetSizeProperty> {
		
		let size = LayoutElement.Size<ParentView>.aspect(.safeAreaFill(ratio, safeAreaOnly: shouldOnlyIncludeSafeArea))
		let maker = self.didSetProperty.storeSize(size, to: self)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreSizeToEvaluateFrameType: LayoutPropertyCanStoreSizeType {
	
	func evaluateFrame(size: LayoutElement.Size<_ParentView>, parameters: IndividualFrameCalculationParameters<_ParentView>) -> CGRect
	
}

extension LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func storeSize(_ size: LayoutElement.Size<_ParentView>, to maker: LayoutMaker<_ParentView, Self>) -> LayoutMaker<_ParentView, IndividualLayout<_ParentView>> {
		
		let layout = IndividualLayout<_ParentView>(frame: { (parameters) -> CGRect in
			return self.evaluateFrame(size: size, parameters: parameters)
		})
		let maker = LayoutMaker(parentView: maker.parentView, didSetProperty: layout)
		
		return maker
		
	}
	
}
