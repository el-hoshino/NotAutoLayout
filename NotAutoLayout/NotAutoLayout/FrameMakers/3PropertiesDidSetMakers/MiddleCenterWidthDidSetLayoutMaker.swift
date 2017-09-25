//
//  MiddleCenterWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleCenterWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleCenter: CGRect.Point
	
	let width: CGRect.Float
	
}

extension MiddleCenterWidthDidSetLayoutMaker {
	
	private func makeFrame(middleCenter: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleCenter.x - width.half
		let y = middleCenter.y - height.half
		let size = CGSize(width: width, height: height)
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension MiddleCenterWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> Layout {
		
		if let middleCenter = self.middleCenter.constantValue, let width = self.width.constantValue {
			let frame = self.makeFrame(middleCenter: middleCenter, width: width, height: height)
			let layout = Layout.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.makeCustom { (boundSize) -> CGRect in
				let middleCenter = self.middleCenter.closureValue(boundSize)
				let width = self.width.closureValue(boundSize)
				let frame = self.makeFrame(middleCenter: middleCenter, width: width, height: height)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> Layout {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let middleCenter = self.middleCenter.closureValue(parameter)
			let width = self.width.closureValue(parameter)
			let height = height(parameter)
			let frame = self.makeFrame(middleCenter: middleCenter, width: width, height: height)
			
			return frame
			
		}
		
		return layout
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> Layout {
		
		let layout = Layout.makeCustom { (fitting, boundSize) -> CGRect in
			
			let middleCenter = self.middleCenter.closureValue(boundSize)
			let width = self.width.closureValue(boundSize)
			let fittingSize = CGSize(width: width, height: fittingHeight)
			let height = fitting(fittingSize).height
			let frame = self.makeFrame(middleCenter: middleCenter, width: width, height: height)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
