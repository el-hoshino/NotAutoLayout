//
//  TopCenterWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopCenterWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topCenter: CGRect.Point
	
	let width: CGRect.Float
	
}

extension TopCenterWidthDidSetLayoutMaker {
	
	private func makeFrame(topCenter: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let frame = CGRect(x: topCenter.x - width.half,
		                   y: topCenter.y,
		                   width: width,
		                   height: height)
		
		return frame
		
	}
	
}

extension TopCenterWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> Layout.Individual {
		
		if let topCenter = self.topCenter.constantValue, let width = self.width.constantValue {
			let frame = self.makeFrame(topCenter: topCenter, width: width, height: height)
			let layout = Layout.Individual.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
				let topCenter = self.topCenter.closureValue(boundSize)
				let width = self.width.closureValue(boundSize)
				let frame = self.makeFrame(topCenter: topCenter, width: width, height: height)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setHeight(by calculation: @escaping (_ boundSize: CGSize) -> CGFloat) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
			let topCenter = self.topCenter.closureValue(boundSize)
			let width = self.width.closureValue(boundSize)
			let height = calculation(boundSize)
			let frame = self.makeFrame(topCenter: topCenter, width: width, height: height)
			
			return frame
			
		}
		
		return layout
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (fitting, boundSize) -> CGRect in
			
			let topCenter = self.topCenter.closureValue(boundSize)
			let width = self.width.closureValue(boundSize)
			let height = fitting(CGSize(width: width, height: fittingHeight)).height
			let frame = self.makeFrame(topCenter: topCenter, width: width, height: height)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
