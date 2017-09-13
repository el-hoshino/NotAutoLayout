//
//  CenterMiddleWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterMiddleWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: CGRect.Float
	
	let middle: CGRect.Float
	
	let width: CGRect.Float
	
}

extension CenterMiddleWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> Layout.Individual {
		
		if let center = self.center.constantValue, let middle = self.middle.constantValue, let width = self.width.constantValue {
			let frame = CGRect(x: center - width.half,
			                   y: middle - height.half,
			                   width: width,
			                   height: height)
			let layout = Layout.Individual.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
				let width = self.width.closureValue(boundSize)
				let x = self.center.closureValue(boundSize) - width.half
				let y = self.middle.closureValue(boundSize) - height.half
				let frame = CGRect(x: x,
				                   y: y,
				                   width: width,
				                   height: height)
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (parameter) -> CGRect in
			let height = height(parameter)
			let width = self.width.closureValue(parameter)
			let x = self.center.closureValue(parameter) - width.half
			let y = self.middle.closureValue(parameter) - height.half
			let frame = CGRect(x: x,
			                   y: y,
			                   width: width,
			                   height: height)
			return frame
			
		}
		
		return layout
		
	}
	
}
