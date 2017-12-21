//
//  LayoutMakerCanStoreSizeType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/13.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutMakerCanStoreSizeType: LayoutMakerType {
	
	associatedtype WillSetSizeMaker
	
	func storeSize(_ size: LayoutElement.Size) -> WillSetSizeMaker
	
}

extension LayoutMakerCanStoreSizeType {
	
	public func setSize(to size: CGSize) -> WillSetSizeMaker {
		
		let size = LayoutElement.Size.constant(size)
		
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
	public func setSize(by size: @escaping (_ property: ViewFrameProperty) -> CGSize) -> WillSetSizeMaker {
		
		let size = LayoutElement.Size.closure(size)
		
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> WillSetSizeMaker {
		
		let size = LayoutElement.Size.fits(fittingSize)
		
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
	public func aspectFit(ratio: CGFloat? = nil) -> WillSetSizeMaker {
		
		let size = LayoutElement.Size.aspect(.fit(ratio))
		
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
	public func aspectFill(ratio: CGFloat? = nil) -> WillSetSizeMaker {
		
		let size = LayoutElement.Size.aspect(.fill(ratio))
		
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func aspectFit(ratio: CGFloat? = nil, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetSizeMaker {
		
		let size = LayoutElement.Size.aspect(.safeAreaFit(ratio, safeAreaOnly: shouldOnlyIncludeSafeArea))
		
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func aspectFill(ratio: CGFloat? = nil, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetSizeMaker {
		
		let size = LayoutElement.Size.aspect(.safeAreaFill(ratio, safeAreaOnly: shouldOnlyIncludeSafeArea))
		
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanStoreSizeToEvaluateFrameType: LayoutMakerCanStoreSizeType where WillSetSizeMaker == LayoutEditor {
	
	func evaluateFrame(size: LayoutElement.Size, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public func storeSize(_ size: LayoutElement.Size) -> WillSetSizeMaker {
		
		let layout = Layout(frame: { (property, fitting) -> CGRect in
			return self.evaluateFrame(size: size, property: property, fittingCalculation: fitting)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
