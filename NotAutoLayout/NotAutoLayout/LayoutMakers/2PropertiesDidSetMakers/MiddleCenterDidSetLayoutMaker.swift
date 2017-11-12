//
//  MiddleCenterDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleCenterDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension MiddleCenterDidSetLayoutMaker {
	
	private func makeFrame(middleCenter: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - topLeft.x) * 2
		let height = (middleCenter.y - topLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = (topRight.x - middleCenter.x) * 2
		let height = (middleCenter.y - topRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, bottomLeft: CGPoint) -> CGRect {
		
		let width = (middleCenter.x - bottomLeft.x) * 2
		let height = (bottomLeft.y - middleCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, bottomRight: CGPoint) -> CGRect {
		
		let width = (bottomRight.x - middleCenter.x) * 2
		let height = (bottomRight.y - middleCenter.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
	}
	
	private func makeFrame(middleCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = middleCenter.x - size.width.half
		let y = middleCenter.y - size.height.half
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanSetTopLeftToMakeLayoutEditorType {
	
	public typealias WillSetTopLeftMaker = LayoutEditor
	
	public func makeFrame(topLeft: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let topLeft = topLeft.evaluated(from: parameter)
		return self.makeFrame(middleCenter: middleCenter, topLeft: topLeft)
		
	}
	
}

// MARK: TopRight
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanSetTopRightToMakeLayoutEditorType {
	
	public typealias WillSetTopRightMaker = LayoutEditor
	
	public func makeFrame(topRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let topRight = topRight.evaluated(from: parameter)
		return self.makeFrame(middleCenter: middleCenter, topRight: topRight)
	}
	
}

// MARK: BottomLeft
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanSetBottomLeftToMakeLayoutEditorType {
	
	public typealias WillSetBottomLeftMaker = LayoutEditor
	
	public func makeFrame(bottomLeft: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let bottomLeft = bottomLeft.evaluated(from: parameter)
		return self.makeFrame(middleCenter: middleCenter, bottomLeft: bottomLeft)
	}
	
}

// MARK: BottomRight
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanSetBottomRightToMakeLayoutEditorType {
	
	public typealias WillSetBottomRightMaker = LayoutEditor
	
	public func makeFrame(bottomRight: LayoutElement.Point, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let bottomRight = bottomRight.evaluated(from: parameter)
		return self.makeFrame(middleCenter: middleCenter, bottomRight: bottomRight)
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension MiddleCenterDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let middleCenter = self.middleCenter.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(middleCenter: middleCenter, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let middleCenter = self.middleCenter.evaluated(from: boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(middleCenter: middleCenter, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanSetLeftType {
	
	public typealias WillSetLeftMaker = MiddleCenterLeftDidSetLayoutMaker
	
	public func setLeft(_ left: LayoutElement.Line) -> MiddleCenterLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 left: left)
		
	}
	
}

// MARK: Right
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanSetRightType {
	
	public typealias WillSetRightMaker = MiddleCenterRightDidSetLayoutMaker
	
	public func setRight(_ right: LayoutElement.Line) -> MiddleCenterRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 right: right)
		
	}
	
}

// MARK: Top
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanSetTopType {
	
	public typealias WillSetTopMaker = MiddleCenterTopDidSetLayoutMaker
	
	public func setTop(_ top: LayoutElement.Line) -> MiddleCenterTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 top: top)
		
	}
	
}

// MARK: Bottom
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanSetBottomType {
	
	public typealias WillSetBottomMaker = MiddleCenterBottomDidSetLayoutMaker
	
	public func setBottom(_ bottom: LayoutElement.Line) -> MiddleCenterBottomDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 bottom: bottom)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension MiddleCenterDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> MiddleCenterWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Line.constant(width)
		
		let maker = MiddleCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               middleCenter: self.middleCenter,
		                                               width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleCenterWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Line.closure(width)
		
		let maker = MiddleCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               middleCenter: self.middleCenter,
		                                               width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension MiddleCenterDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> MiddleCenterHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Line.constant(height)
		
		let maker = MiddleCenterHeightDidSetLayoutMaker(parentView: self.parentView,
		                                                middleCenter: self.middleCenter,
		                                                height: height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> MiddleCenterHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Line.closure(height)
		
		let maker = MiddleCenterHeightDidSetLayoutMaker(parentView: self.parentView,
		                                                middleCenter: self.middleCenter,
		                                                height: height)
		
		return maker
		
	}
	
}
