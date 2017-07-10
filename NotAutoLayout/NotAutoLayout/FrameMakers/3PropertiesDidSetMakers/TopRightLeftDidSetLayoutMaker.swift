//
//  TopRightLeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopRightLeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topRight: CGRect.Point
	
	let left: CGRect.Float
	
}

extension TopRightLeftDidSetLayoutMaker {
	
	private func makeFrame(topRight: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = topRight.y
		let width = topRight.x - left
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension TopRightLeftDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
			
			if let topRight = self.topRight.constantValue, let left = self.left.constantValue {
				let frame = self.makeFrame(topRight: topRight, left: left, height: height)
				return frame
				
			} else {
				let topRight = self.topRight.closureValue(boundSize)
				let left = self.left.closureValue(boundSize)
				let frame = self.makeFrame(topRight: topRight, left: left, height: height)
				return frame
			}
			
		}
		
		return layout
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (fitting, boundSize) -> CGRect in
			
			let topRight = self.topRight.closureValue(boundSize)
			let left = self.left.closureValue(boundSize)
			let x = left
			let y = topRight.y
			let width = topRight.y - left
			let fittingSize = CGSize(width: width, height: fittingHeight)
			let height = fitting(fittingSize).height
			let frame = CGRect(x: x, y: y, width: width, height: height)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
