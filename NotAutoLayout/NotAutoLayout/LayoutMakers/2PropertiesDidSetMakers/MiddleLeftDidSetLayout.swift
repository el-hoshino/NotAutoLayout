//
//  MiddleLeftDidSetLayout.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleLeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleLeft: LayoutElement.Point
	
}

// MARK: - Make Frame
extension MiddleLeftDidSetLayoutMaker {
	
	private func makeFrame(middleLeft: CGPoint, topCenter: CGPoint) -> CGRect {
		
		let width = (topCenter.x - middleLeft.x) * 2
		let height = topCenter.y - middleLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = topRight.x - middleLeft.x
		let height = (middleLeft.y - topRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, bottomCenter: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - middleLeft.x) * 2
		let height = (bottomCenter.y - middleLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = bottomRight.x - middleLeft.x
		let height = (bottomRight.y - middleLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleLeft: middleLeft, size: size)
		
	}
	
	private func makeFrame(middleLeft: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleLeft.x
		let y = middleLeft.y - size.height.half
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopCenter
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetTopCenterToMakeLayoutEditorType {
	
	public typealias WillSetTopCenterMaker = LayoutEditor
	
	public func makeFrame(topCenter: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let middleLeft = self.middleLeft.evaluated(from: parameter)
		let topCenter = topCenter.evaluated(from: parameter)
		return self.makeFrame(middleLeft: middleLeft, topCenter: topCenter)
	}
	
}

// MARK: TopRight
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetTopRightToMakeLayoutEditorType {
	
	public typealias WillSetTopRightMaker = LayoutEditor
	
	public func makeFrame(topRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let middleLeft = self.middleLeft.evaluated(from: parameter)
		let topRight = topRight.evaluated(from: parameter)
		return self.makeFrame(middleLeft: middleLeft, topRight: topRight)
	}
	
}

// MARK: BottomCenter
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetBottomCenterToMakeLayoutEditorType {
	
	public typealias WillSetBottomCenterMaker = LayoutEditor
	
	public func makeFrame(bottomCenter: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let middleLeft = self.middleLeft.evaluated(from: parameter)
		let bottomCenter = bottomCenter.evaluated(from: parameter)
		return self.makeFrame(middleLeft: middleLeft, bottomCenter: bottomCenter)
	}
	
}

// MARK: BottomRight
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetBottomRightToMakeLayoutEditorType {
	
	public typealias WillSetBottomRightMaker = LayoutEditor
	
	public func makeFrame(bottomRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let middleLeft = self.middleLeft.evaluated(from: parameter)
		let bottomRight = bottomRight.evaluated(from: parameter)
		return self.makeFrame(middleLeft: middleLeft, bottomRight: bottomRight)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension MiddleLeftDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let middleLeft = self.middleLeft.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(middleLeft: middleLeft, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let middleLeft = self.middleLeft.evaluated(from: boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(middleLeft: middleLeft, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Center
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetCenterType {
	
	public typealias WillSetCenterMaker = MiddleLeftCenterDidSetLayoutMaker
	
	public func setCenter(_ center: LayoutElement.Float) -> MiddleLeftCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 center: center)
		
	}
	
}

// MARK: Right
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetRightType {
	
	public typealias WillSetRightMaker = MiddleLeftRightDidSetLayoutMaker
	
	public func setRight(_ right: LayoutElement.Float) -> MiddleLeftRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 right: right)
		
	}
	
}

// MARK: Top
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetTopType {
	
	public typealias WillSetTopMaker = MiddleLeftTopDidSetLayoutMaker
	
	public func setTop(_ top: LayoutElement.Float) -> MiddleLeftTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 top: top)
		
	}
	
}

// MARK: Bottom
extension MiddleLeftDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = MiddleLeftBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Float) -> MiddleLeftBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: self.middleLeft,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension MiddleLeftDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> MiddleLeftWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = MiddleLeftWidthDidSetLayoutMaker(parentView: self.parentView,
		                                             middleLeft: self.middleLeft,
		                                             width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleLeftWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = MiddleLeftWidthDidSetLayoutMaker(parentView: self.parentView,
		                                             middleLeft: self.middleLeft,
		                                             width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension MiddleLeftDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> MiddleLeftHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = MiddleLeftHeightDidSetLayoutMaker(parentView: self.parentView,
		                                              middleLeft: self.middleLeft,
		                                              height: height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleLeftHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = MiddleLeftHeightDidSetLayoutMaker(parentView: self.parentView,
		                                              middleLeft: self.middleLeft,
		                                              height: height)
		
		return maker
		
	}
	
}
