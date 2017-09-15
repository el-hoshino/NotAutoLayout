//
//  TopLeftWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopLeftWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topLeft: CGRect.Point
	
	let width: CGRect.Float
	
}

extension TopLeftWidthDidSetLayoutMaker {
	
	private func makeFrame(topLeft: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let frame = CGRect(x: topLeft.x,
		                   y: topLeft.y,
		                   width: width,
		                   height: height)
		
		return frame
		
	}
	
}

extension TopLeftWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> Layout.Individual {
		
		if let topLeft = self.topLeft.constantValue, let width = self.width.constantValue {
			let frame = self.makeFrame(topLeft: topLeft, width: width, height: height)
			let layout = Layout.Individual.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
				let topLeft = self.topLeft.closureValue(boundSize)
				let width = self.width.closureValue(boundSize)
				let frame = self.makeFrame(topLeft: topLeft, width: width, height: height)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (parameter) -> CGRect in
			let topLeft = self.topLeft.closureValue(parameter)
			let width = self.width.closureValue(parameter)
			let height = height(parameter)
			let frame = self.makeFrame(topLeft: topLeft, width: width, height: height)
			
			return frame
			
		}
		
		return layout
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (fitting, boundSize) -> CGRect in
			
			let topLeft = self.topLeft.closureValue(boundSize)
			let width = self.width.closureValue(boundSize)
			let height = fitting(CGSize(width: width, height: fittingHeight)).height
			let frame = self.makeFrame(topLeft: topLeft, width: width, height: height)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
