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
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> WillSetSizeMaker {
		
		let size = LayoutElement.Size.closure(size)
		
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> WillSetSizeMaker {
		
		let size = LayoutElement.Size.fits(fittingSize)
		
		let maker = self.storeSize(size)
		
		return maker
		
	}
	
}

public protocol LayoutMakerCanStoreSizeToEvaluateFrameType: LayoutMakerCanStoreSizeType where WillSetSizeMaker == LayoutEditor {
	
	func evaluateFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutMakerCanStoreSizeToEvaluateFrameType {
	
	public func storeSize(_ size: LayoutElement.Size) -> WillSetSizeMaker {
		
		let layout = Layout(frame: { (parameter, fitting) -> CGRect in
			return self.evaluateFrame(size: size, parameter: parameter, fittingCalculation: fitting)
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
