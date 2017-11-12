//
//  TopCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopCenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension TopCenterDidSetLayoutMaker {
	
	private func makeFrame(topCenter: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = (topCenter.x - middleLeft.x) * 2
		let height = (middleLeft.y - topCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = (middleRight.x - topCenter.x) * 2
		let height = (middleRight.y - topCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = (topCenter.x - bottomLeft.x) * 2
		let height = bottomLeft.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - topCenter.x) * 2
		let height = bottomRight.y - topCenter.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topCenter: topCenter, size: size)
		
	}
	
	private func makeFrame(topCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = topCenter.x - size.width.half
		let y = topCenter.y
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleLeft
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetMiddleLeftToMakeLayoutEditorType {
	
	public typealias WillSetMiddleLeftMaker = LayoutEditor
	
	public func makeFrame(middleLeft: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topCenter = self.topCenter.evaluated(from: parameter)
		let middleLeft = middleLeft.evaluated(from: parameter)
		return self.makeFrame(topCenter: topCenter, middleLeft: middleLeft)
	}
	
}

// MARK: MiddleRight
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetMiddleRightToMakeLayoutEditorType {
	
	public typealias WillSetMiddleRightMaker = LayoutEditor
	
	public func makeFrame(middleRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topCenter = self.topCenter.evaluated(from: parameter)
		let middleRight = middleRight.evaluated(from: parameter)
		return self.makeFrame(topCenter: topCenter, middleRight: middleRight)
	}
	
}

// MARK: BottomLeft
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetBottomLeftToMakeLayoutEditorType {
	
	public typealias WillSetBottomLeftMaker = LayoutEditor
	
	public func makeFrame(bottomLeft: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topCenter = self.topCenter.evaluated(from: parameter)
		let bottomLeft = bottomLeft.evaluated(from: parameter)
		return self.makeFrame(topCenter: topCenter, bottomLeft: bottomLeft)
	}
	
}

// MARK: BottomRight
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetBottomRightToMakeLayoutEditorType {
	
	public typealias WillSetBottomRightMaker = LayoutEditor
	
	public func makeFrame(bottomRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topCenter = self.topCenter.evaluated(from: parameter)
		let bottomRight = bottomRight.evaluated(from: parameter)
		return self.makeFrame(topCenter: topCenter, bottomRight: bottomRight)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension TopCenterDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let topCenter = self.topCenter.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(topCenter: topCenter, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let topCenter = self.topCenter.evaluated(from: boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(topCenter: topCenter, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetLeftType {
	
	public typealias WillSetLeftMaker = TopCenterLeftDidSetLayoutMaker
	
	public func setLeft(_ left: LayoutElement.Float) -> TopCenterLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 left: left)
		
	}
	
}

// MARK: Right
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetRightType {
	
	public typealias WillSetRightMaker = TopCenterRightDidSetLayoutMaker
	
	public func setRight(_ right: LayoutElement.Float) -> TopCenterRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 right: right)
		
	}
	
}

// MARK: Middle
extension TopCenterDidSetLayoutMaker {
	
	public func setMiddle(to middle: CGFloat) -> TopCenterMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.constant(middle)
		
		let maker = TopCenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             middle: middle)
		
		return maker
		
	}
	
	public func setMiddle(by middle: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopCenterMiddleDidSetLayoutMaker {
		
		let middle = LayoutElement.Float.closure(middle)
		
		let maker = TopCenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             middle: middle)
		
		return maker
		
	}
	
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopCenterMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopCenterMiddleDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinMiddle(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopCenterMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = TopCenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             middle: middle)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinMiddle(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopCenterMiddleDidSetLayoutMaker {
		
		let middle = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = TopCenterMiddleDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             middle: middle)
		
		return maker
		
	}
	
}

// MARK: Bottom
extension TopCenterDidSetLayoutMaker {
	
	public func setBottom(to bottom: CGFloat) -> TopCenterBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.constant(bottom)
		
		let maker = TopCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             bottom: bottom)
		
		return maker
		
	}
	
	public func setBottom(by bottom: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopCenterBottomDidSetLayoutMaker {
		
		let bottom = LayoutElement.Float.closure(bottom)
		
		let maker = TopCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             bottom: bottom)
		
		return maker
		
	}
	
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopCenterBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(to referenceView: UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopCenterBottomDidSetLayoutMaker {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottom(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false) -> TopCenterBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = TopCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             bottom: bottom)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottom(by referenceView: @escaping () -> UIView?, s reference: CGRect.VerticalBaseLine, offsetBy offset: CGFloat = 0, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> TopCenterBottomDidSetLayoutMaker {
		
		let bottom = self.parentView.verticalReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = TopCenterBottomDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             bottom: bottom)
		
		return maker
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension TopCenterDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> TopCenterWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = TopCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                            topCenter: self.topCenter,
		                                            width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopCenterWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = TopCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                            topCenter: self.topCenter,
		                                            width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension TopCenterDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> TopCenterHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = TopCenterHeightDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             height: height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopCenterHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = TopCenterHeightDidSetLayoutMaker(parentView: self.parentView,
		                                             topCenter: self.topCenter,
		                                             height: height)
		
		return maker
		
	}
	
}
