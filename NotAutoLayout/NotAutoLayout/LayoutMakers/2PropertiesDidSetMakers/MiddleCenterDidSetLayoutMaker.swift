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
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanSetSizeToMakeLayoutEditorType {
	
	public typealias WillSetSizeMaker = LayoutEditor
	
	public func makeFrame(size: LayoutElement.Size, parameter: LayoutControlParameter, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let middleCenter = self.middleCenter.evaluated(from: parameter)
		let size = size.evaluated(from: parameter, fittingCalculation: fittingCalculation)
		return self.makeFrame(middleCenter: middleCenter, size: size)
		
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
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanSetWidthType {
	
	public typealias WillSetWidthMaker = MiddleCenterWidthDidSetLayoutMaker
	
	public func setWidth(_ width: LayoutElement.Length) -> MiddleCenterWidthDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 width: width)
		
	}
	
}

// MARK: Height
extension MiddleCenterDidSetLayoutMaker: LayoutMakerCanSetHeightType {
	
	public typealias WillSetHeightMaker = MiddleCenterHeightDidSetLayoutMaker
	
	public func setHeight(_ height: LayoutElement.Length) -> MiddleCenterHeightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: self.middleCenter,
					 height: height)
		
	}
	
}
