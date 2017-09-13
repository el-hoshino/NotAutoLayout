//
//  TopCenterBottomDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopCenterBottomDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topCenter: CGRect.Point
	
	let bottom: CGRect.Float
	
}

extension TopCenterBottomDidSetLayoutMaker {
	
	private func makeFrame(topCenter: CGPoint, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let height = bottom - topCenter.y
		let x = topCenter.x - width.half
		let y = topCenter.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension TopCenterBottomDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> Layout.Individual {
		
		if let topCenter = self.topCenter.constantValue, let bottom = self.bottom.constantValue {
			let frame = self.makeFrame(topCenter: topCenter, bottom: bottom, width: width)
			let layout = Layout.Individual.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
				let topCenter = self.topCenter.closureValue(boundSize)
				let bottom = self.bottom.closureValue(boundSize)
				let frame = self.makeFrame(topCenter: topCenter, bottom: bottom, width: width)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (parameter) -> CGRect in
			let topCenter = self.topCenter.closureValue(parameter)
			let bottom = self.bottom.closureValue(parameter)
			let width = width(parameter)
			let frame = self.makeFrame(topCenter: topCenter, bottom: bottom, width: width)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
