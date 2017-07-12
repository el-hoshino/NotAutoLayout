//
//  BottomCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct BottomCenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let bottomCenter: CGRect.Point
	
}

extension BottomCenterDidSetLayoutMaker {
	
	private func makeFrame(bottomCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = bottomCenter.x - size.width.half
		let y = bottomCenter.y - size.height
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

extension BottomCenterDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> Layout.Individual {
		
		if let bottomCenter = self.bottomCenter.constantValue {
			let frame = self.makeFrame(bottomCenter: bottomCenter, size: size)
			let layout = Layout.Individual.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
				let bottomCenter = self.bottomCenter.closureValue(boundSize)
				let frame = self.makeFrame(bottomCenter: bottomCenter, size: size)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func calculateSize(by calculation: @escaping (_ boundSize: CGSize) -> CGSize) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
			let bottomCenter = self.bottomCenter.closureValue(boundSize)
			let size = calculation(boundSize)
			let frame = self.makeFrame(bottomCenter: bottomCenter, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (fitting, boundSize) -> CGRect in
			
			let bottomCenter = self.bottomCenter.closureValue(boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(bottomCenter: bottomCenter, size: size)
			
			return frame
			
		}
		
		return layout
		
	}
	
}
