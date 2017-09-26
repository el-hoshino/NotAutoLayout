//
//  LeftRightTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftRightTopDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: CGRect.Float
	
	let right: CGRect.Float
	
	let top: CGRect.Float
	
}

extension LeftRightTopDidSetLayoutMaker {
	
	private func makeFrame(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let width = right - x
		let height = bottom - y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(left: CGFloat, right: CGFloat, top: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let width = right - x
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension LeftRightTopDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> Layout {
		
		if let left = self.left.constantValue, let right = self.right.constantValue, let top = self.top.constantValue {
			let frame = self.makeFrame(left: left, right: right, top: top, bottom: bottom)
			let layout = Layout.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let bottom: (_ parameter: LayoutControlParameter) -> CGFloat = { _ in bottom }
			
			return self.setBottom(by: bottom)
			
		}
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> Layout {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let left = self.left.closureValue(parameter)
			let right = self.right.closureValue(parameter)
			let top = self.right.closureValue(parameter)
			let bottom = bottom(parameter)
			let frame = self.makeFrame(left: left, right: right, top: top, bottom: bottom)
			
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
			let left = self.left.closureValue(boundSize)
			let right = self.right.closureValue(boundSize)
			let top = self.top.closureValue(boundSize)
			let bottom = parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false).closureValue(boundSize)
			let frame = self.makeFrame(left: left, right: right, top: top, bottom: bottom)
			
			return frame
			
		}
		
		return layout
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBasePoint, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> Layout {
		
		let layout = Layout.makeCustom { [unowned parentView] (boundSize) -> CGRect in
			let left = self.left.closureValue(boundSize)
			let right = self.right.closureValue(boundSize)
			let top = self.top.closureValue(boundSize)
			let bottom = parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea).closureValue(boundSize)
			let frame = self.makeFrame(left: left, right: right, top: top, bottom: bottom)
			
			return frame
			
		}
		
		return layout
		
	}
	
}

extension LeftRightTopDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> Layout {
		
		if let left = self.left.constantValue, let right = self.right.constantValue, let top = self.top.constantValue {
			let frame = self.makeFrame(left: left, right: right, top: top, height: height)
			let layout = Layout.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.makeCustom { (boundSize) -> CGRect in
				let left = self.left.closureValue(boundSize)
				let right = self.right.closureValue(boundSize)
				let top = self.top.closureValue(boundSize)
				let frame = self.makeFrame(left: left, right: right, top: top, height: height)

				return frame
				
			}
			
			return layout
		}
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> Layout {
		
		let layout = Layout.makeCustom { (parameter) -> CGRect in
			let left = self.left.closureValue(parameter)
			let right = self.right.closureValue(parameter)
			let top = self.top.closureValue(parameter)
			let height = height(parameter)
			let frame = self.makeFrame(left: left, right: right, top: top, height: height)

			return frame
			
		}
		
		return layout
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> Layout {
		
		let layout = Layout.makeCustom { (fitting, boundSize) -> CGRect in
			
			let left = self.left.closureValue(boundSize)
			let right = self.right.closureValue(boundSize)
			let top = self.top.closureValue(boundSize)
			let width = right - left
			let fittingSize = CGSize(width: width, height: fittingHeight)
			let height = fitting(fittingSize).height
			let frame = self.makeFrame(left: left, right: right, top: top, height: height)

			return frame
			
		}
		
		return layout
		
	}
	
}
