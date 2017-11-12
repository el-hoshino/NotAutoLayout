//
//  TopLeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopLeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topLeft: LayoutElement.Point
	
}

// MARK: - Make Frame
extension TopLeftDidSetLayoutMaker {
	
	private func makeFrame(topLeft: CGPoint, middleCenter: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - topLeft.x) * 2
		let height = (middleCenter.y - topLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = middleRight.x - topLeft.x
		let height = (middleRight.y - topLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - topLeft.x) * 2
		let height = bottomCenter.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = bottomRight.x - topLeft.x
		let height = bottomRight.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(topLeft: topLeft, size: size)
		
	}
	
	private func makeFrame(topLeft: CGPoint, size: CGSize) -> CGRect {
		
		let origin = topLeft
		let size = size
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: MiddleCenter
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetMiddleCenterToMakeLayoutEditorType {
	
	public typealias WillSetMiddleCenterMaker = LayoutEditor
	
	public func makeFrame(middleCenter: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: parameter)
		let middleCenter = middleCenter.evaluated(from: parameter)
		return self.makeFrame(topLeft: topLeft, middleCenter: middleCenter)
	}
	
}

// MARK: MiddleRight
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetMiddleRightToMakeLayoutEditorType {
	
	public typealias WillSetMiddleRightMaker = LayoutEditor
	
	public func makeFrame(middleRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: parameter)
		let middleRight = middleRight.evaluated(from: parameter)
		return self.makeFrame(topLeft: topLeft, middleRight: middleRight)
	}
	
}

// MARK: BottomCenter
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetBottomCenterToMakeLayoutEditorType {
	
	public typealias WillSetBottomCenterMaker = LayoutEditor
	
	public func makeFrame(bottomCenter: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: parameter)
		let bottomCenter = bottomCenter.evaluated(from: parameter)
		return self.makeFrame(topLeft: topLeft, bottomCenter: bottomCenter)
	}
	
}

// MARK: BottomRight
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetBottomRightToMakeLayoutEditorType {
	
	public typealias WillSetBottomRightMaker = LayoutEditor
	
	public func makeFrame(bottomRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topLeft = self.topLeft.evaluated(from: parameter)
		let bottomRight = bottomRight.evaluated(from: parameter)
		return self.makeFrame(topLeft: topLeft, bottomRight: bottomRight)
	}
	
}
// MARK: - Set A Size -
// MARK: Size
extension TopLeftDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			
			let topLeft = self.topLeft.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(topLeft: topLeft, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let topLeft = self.topLeft.evaluated(from: boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(topLeft: topLeft, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetCenterType {
	
	public typealias WillSetCenterMaker = TopLeftCenterDidSetLayoutMaker
	
	public func setCenter(_ center: LayoutElement.Float) -> TopLeftCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 center: center)
		
	}
	
}

// MARK: Right
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetRightType {
	
	public typealias WillSetRightMaker = TopLeftRightDidSetLayoutMaker
	
	public func setRight(_ right: LayoutElement.Float) -> TopLeftRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 right: right)
		
	}
	
}

// MARK: Middle
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = TopLeftMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Float) -> TopLeftMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension TopLeftDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = TopLeftBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Float) -> TopLeftBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: self.topLeft,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension TopLeftDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> TopLeftWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = TopLeftWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          topLeft: self.topLeft,
		                                          width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopLeftWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = TopLeftWidthDidSetLayoutMaker(parentView: self.parentView,
		                                          topLeft: self.topLeft,
		                                          width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension TopLeftDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> TopLeftHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = TopLeftHeightDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           height: height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> TopLeftHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = TopLeftHeightDidSetLayoutMaker(parentView: self.parentView,
		                                           topLeft: self.topLeft,
		                                           height: height)
		
		return maker
		
	}
	
}
