//
//  BottomRightDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct BottomRightDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomRight: CGRect.Point
	
}

extension BottomRightDidSetLayoutMaker {
	
	private func makeFrame(bottomRight: CGPoint, size: CGSize) -> CGRect {
		
		let x = bottomRight.x - size.width
		let y = bottomRight.y - size.height
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension BottomRightDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> Layout {
		
		if let bottomRight = self.bottomRight.constantValue {
			let frame = self.makeFrame(bottomRight: bottomRight, size: size)
			let layout = Layout.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.makeCustom { (boundSize) -> CGRect in
				let bottomRight = self.bottomRight.closureValue(boundSize)
				let frame = self.makeFrame(bottomRight: bottomRight, size: size)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> Layout {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let bottomRight = self.bottomRight.closureValue(parameter)
			let size = size(parameter)
			let frame = self.makeFrame(bottomRight: bottomRight, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> Layout {
		
		let layout = Layout.makeCustom { (fitting, boundSize) -> CGRect in
			
			let bottomRight = self.bottomRight.closureValue(boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(bottomRight: bottomRight, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
