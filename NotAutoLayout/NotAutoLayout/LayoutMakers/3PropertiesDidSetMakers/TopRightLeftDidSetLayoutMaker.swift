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
	
	private func makeFrame(topRight: CGPoint, left: CGFloat, bottom: CGFloat) -> CGRect {
		
		let x = left
		let y = topRight.y
		let width = topRight.x - left
		let height = bottom - topRight.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(topRight: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = topRight.y
		let width = topRight.x - left
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension TopRightLeftDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> Layout {
		
		let layout = Layout.makeCustom { (boundSize) -> CGRect in
			
			if let topRight = self.topRight.constantValue, let left = self.left.constantValue {
				let frame = self.makeFrame(topRight: topRight, left: left, bottom: bottom)
				return frame
				
			} else {
				let topRight = self.topRight.closureValue(boundSize)
				let left = self.left.closureValue(boundSize)
				let frame = self.makeFrame(topRight: topRight, left: left, bottom: bottom)
				return frame
			}

		}
		
		return layout
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> Layout {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let topRight = self.topRight.closureValue(parameter)
			let left = self.left.closureValue(parameter)
			let bottom = bottom(parameter)
			let frame = self.makeFrame(topRight: topRight, left: left, bottom: bottom)
			
			return frame
			
		}
		
		return layout
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> Layout {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> Layout {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> Layout {
		
		let layout = Layout.makeCustom { [unowned parentView] (boundSize) -> CGRect in
			let topRight = self.topRight.closureValue(boundSize)
			let left = self.left.closureValue(boundSize)
			let bottom = parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).closureValue(boundSize)
			let frame = self.makeFrame(topRight: topRight, left: left, bottom: bottom)
			
			return frame
			
		}
		
		return layout
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> Layout {
		
		let layout = Layout.makeCustom { [unowned parentView] (boundSize) -> CGRect in
			let topRight = self.topRight.closureValue(boundSize)
			let left = self.left.closureValue(boundSize)
			let bottom = parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).closureValue(boundSize)
			let frame = self.makeFrame(topRight: topRight, left: left, bottom: bottom)
			
			return frame
			
		}
		
		return layout
		
	}
	
}

extension TopRightLeftDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> Layout {
		
		let layout = Layout.makeCustom { (boundSize) -> CGRect in
			
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
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> Layout {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let topRight = self.topRight.closureValue(parameter)
			let left = self.left.closureValue(parameter)
			let height = height(parameter)
			let frame = self.makeFrame(topRight: topRight, left: left, height: height)

			return frame
			
		}
		
		return layout
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> Layout {
		
		let layout = Layout.makeCustom { (fitting, boundSize) -> CGRect in
			
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
