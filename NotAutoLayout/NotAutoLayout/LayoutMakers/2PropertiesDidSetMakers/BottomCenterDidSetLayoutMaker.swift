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
	
	let bottomCenter: LayoutElement.Point
	
}

// MARK: - Make Frame
extension BottomCenterDidSetLayoutMaker {
	
	private func makeFrame(bottomCenter: CGPoint, topLeft: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - topLeft.x) * 2
		let height = bottomCenter.y - topLeft.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, topRight: CGPoint) -> CGRect {
		
		let width = (topRight.x - bottomCenter.x) * 2
		let height = bottomCenter.y - topRight.y
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, middleLeft: CGPoint) -> CGRect {
		
		let width = (bottomCenter.x - middleLeft.x) * 2
		let height = (bottomCenter.y - middleLeft.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, middleRight: CGPoint) -> CGRect {
		
		let width = (middleRight.x - bottomCenter.x) * 2
		let height = (bottomCenter.y - middleRight.y) * 2
		let size = CGSize(width: width, height: height)
		
		return self.makeFrame(bottomCenter: bottomCenter, size: size)
		
	}
	
	private func makeFrame(bottomCenter: CGPoint, size: CGSize) -> CGRect {
		
		let x = bottomCenter.x - size.width.half
		let y = bottomCenter.y - size.height
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft

// MARK: TopRight

// MARK: MiddleLeft

// MARK: MiddleRight

// MARK: - Set A Size -
// MARK: Size
extension BottomCenterDidSetLayoutMaker {
	
	public func setSize(to size: CGSize) -> LayoutEditor {
		
		return self.setSize(by: { _ in size })
		
	}
	
	public func setSize(by size: @escaping (_ parameter: LayoutControlParameter) -> CGSize) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let bottomCenter = self.bottomCenter.evaluated(from: parameter)
			let size = size(parameter)
			let frame = self.makeFrame(bottomCenter: bottomCenter, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitSize(by fittingSize: CGSize = .zero) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let bottomCenter = self.bottomCenter.evaluated(from: boundSize)
			let size = fitting(fittingSize)
			let frame = self.makeFrame(bottomCenter: bottomCenter, size: size)
			
			return frame
			
		})
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension BottomCenterDidSetLayoutMaker: LayoutMakerCanSetLeftType {
	
	public typealias WillSetLeftMaker = BottomCenterLeftDidSetLayoutMaker
	
	public func setLeft(_ left: LayoutElement.Float) -> BottomCenterLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 left: left)
		
	}
	
}

// MARK: Right
extension BottomCenterDidSetLayoutMaker: LayoutMakerCanSetRightType {
	
	public typealias WillSetRightMaker = BottomCenterRightDidSetLayoutMaker
	
	public func setRight(_ right: LayoutElement.Float) -> BottomCenterRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 right: right)
		
	}
	
}

// MARK: Top
extension BottomCenterDidSetLayoutMaker: LayoutMakerCanSetTopType {
	
	public typealias WillSetTopMaker = BottomCenterTopDidSetLayoutMaker
	
	public func setTop(_ top: LayoutElement.Float) -> BottomCenterTopDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 top: top)
		
	}
	
}

// MARK: Middle
extension BottomCenterDidSetLayoutMaker: LayoutMakerCanSetMiddleType {
	
	public typealias WillSetMiddleMaker = BottomCenterMiddleDidSetLayoutMaker
	
	public func setMiddle(_ middle: LayoutElement.Float) -> BottomCenterMiddleDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: self.bottomCenter,
					 middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension BottomCenterDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> BottomCenterWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.constant(width)
		
		let maker = BottomCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               bottomCenter: self.bottomCenter,
		                                               width: width)
		
		return maker
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> BottomCenterWidthDidSetLayoutMaker {
		
		let width = LayoutElement.Float.closure(width)
		
		let maker = BottomCenterWidthDidSetLayoutMaker(parentView: self.parentView,
		                                               bottomCenter: self.bottomCenter,
		                                               width: width)
		
		return maker
		
	}
	
}

// MARK: Height
extension BottomCenterDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> BottomCenterHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.constant(height)
		
		let maker = BottomCenterHeightDidSetLayoutMaker(parentView: self.parentView,
		                                                bottomCenter: self.bottomCenter,
		                                                height: height)
		
		return maker
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> BottomCenterHeightDidSetLayoutMaker {
		
		let height = LayoutElement.Float.closure(height)
		
		let maker = BottomCenterHeightDidSetLayoutMaker(parentView: self.parentView,
		                                                bottomCenter: self.bottomCenter,
		                                                height: height)
		
		return maker
		
	}
	
}
