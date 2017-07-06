//
//  CenterTopWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterTopWidthDidSetLayoutMaker {
	
	let parentView: UIView
	
	let center: CGRect.Float
	
	let top: CGRect.Float
	
	let width: CGRect.Float
	
}

extension CenterTopWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> Layout.Individual {
		
		if let center = self.center.constantValue, let top = self.top.constantValue, let width = self.width.constantValue {
			let frame = CGRect(x: center - width.half,
			                   y: top,
			                   width: width,
			                   height: height)
			let layout = Layout.Individual.makeAbsolute(from: frame)
			
			return layout
			
		} else {
			let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
				let width = self.width.closureValue(boundSize)
				let x = self.center.closureValue(boundSize) - width.half
				let y = self.top.closureValue(boundSize)
				let frame = CGRect(x: x,
				                   y: y,
				                   width: width,
				                   height: height)
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func calculateHeight(by calcualation: @escaping (_ boundSize: CGSize) -> CGFloat) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
			let height = calcualation(boundSize)
			let width = self.width.closureValue(boundSize)
			let x = self.center.closureValue(boundSize) - width.half
			let y = self.top.closureValue(boundSize)
			let frame = CGRect(x: x,
			                   y: y,
			                   width: width,
			                   height: height)
			return frame
			
		}
		
		return layout
		
	}
	
}
