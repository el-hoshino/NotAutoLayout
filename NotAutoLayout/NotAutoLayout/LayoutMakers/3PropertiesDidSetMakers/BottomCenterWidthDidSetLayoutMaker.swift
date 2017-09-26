//
//  BottomCenterWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct BottomCenterWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomCenter: CGRect.Point
	
	let width: CGRect.Float
	
}

extension BottomCenterWidthDidSetLayoutMaker {
	
	private func makeFrame(bottomCenter: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let frame = CGRect(x: bottomCenter.x - width.half,
		                   y: bottomCenter.y - height,
		                   width: width,
		                   height: height)
		
		return frame
		
	}
	
}

extension BottomCenterWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> Layout {
		
		if let bottomCenter = self.bottomCenter.constantValue, let width = self.width.constantValue {
			let frame = self.makeFrame(bottomCenter: bottomCenter, width: width, height: height)
			let layout = Layout.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.makeCustom { (boundSize) -> CGRect in
				let bottomCenter = self.bottomCenter.closureValue(boundSize)
				let width = self.width.closureValue(boundSize)
				let frame = self.makeFrame(bottomCenter: bottomCenter, width: width, height: height)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> Layout {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let bottomCenter = self.bottomCenter.closureValue(parameter)
			let width = self.width.closureValue(parameter)
			let height = height(parameter)
			let frame = self.makeFrame(bottomCenter: bottomCenter, width: width, height: height)
			
			return frame
			
		}
		
		return layout
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> Layout {
		
		let layout = Layout.makeCustom { (fitting, boundSize) -> CGRect in
			
			let bottomCenter = self.bottomCenter.closureValue(boundSize)
			let width = self.width.closureValue(boundSize)
			let height = fitting(CGSize(width: width, height: fittingHeight)).height
			let frame = self.makeFrame(bottomCenter: bottomCenter, width: width, height: height)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
