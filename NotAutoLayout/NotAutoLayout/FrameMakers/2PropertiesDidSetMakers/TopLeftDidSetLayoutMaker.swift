//
//  TopLeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopLeftDidSetLayoutMaker {
	
	let parentView: UIView
	
	let topLeft: CGRect.Point
	
}

extension TopLeftDidSetLayoutMaker {
	
	private func makeFrame(topLeft: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = bottomRight.x - topLeft.x
		let height = bottomRight.y - topLeft.y
		let x = topLeft.x
		let y = topLeft.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension TopLeftDidSetLayoutMaker {
	
	public func setBottomRight(to bottomRight: CGPoint) -> Layout.Individual {
		
		if let topLeft = self.topLeft.constantValue {
			let frame = self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
			let layout = Layout.Individual.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.Individual.makeCustom(frame: { (boundSize) -> CGRect in
				let topLeft = self.topLeft.closureValue(boundSize)
				let frame = self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
				return frame
			})
			
			return layout
			
		}
		
	}
	
	public func pinBottomRight(to referenceView: UIView, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
			let topLeft = self.topLeft.closureValue(boundSize)
			let bottomRight = self.parentView.pointReference(reference, of: referenceView, offsetBY: offset, ignoresTransform: ignoresTransform).closureValue(boundSize)
			let frame = self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
			
			return frame
			
		}
		
		return layout
		
	}
	
	public func calculateBottomRight(by calculation: @escaping (_ boundSize: CGSize) -> CGPoint) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
			let topLeft = self.topLeft.closureValue(boundSize)
			let bottomRight = calculation(boundSize)
			let frame = self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
			
			return frame
			
		}
		
		return layout
		
	}
	
}

extension TopLeftDidSetLayoutMaker {
	
	public func pinRight(to referenceView: UIView, s reference: CGRect.HorizontalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopLeftRightDidSetLayoutMaker {
		
		let right = self.parentView.horizontalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform)
		
		let maker = TopLeftRightDidSetLayoutMaker(parentView: self.parentView,
		                                          topLeft: self.topLeft,
		                                          right: right)
		
		return maker
		
	}
	
}
