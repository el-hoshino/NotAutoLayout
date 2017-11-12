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
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = TopCenterMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Float) -> TopCenterMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 middle: middle)
		
	}
	
}

// MARK: Bottom
extension TopCenterDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = TopCenterBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Float) -> TopCenterBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: self.topCenter,
					 bottom: bottom)
		
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
