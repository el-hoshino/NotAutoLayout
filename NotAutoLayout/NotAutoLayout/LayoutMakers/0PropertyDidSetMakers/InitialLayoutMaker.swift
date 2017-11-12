//
//  InitialLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct InitialLayoutMaker {
	
	public unowned let parentView: UIView
	
}

// MARK: - Custom Frame
extension InitialLayoutMaker {
	
	public func makeFrame(_ frame: CGRect) -> LayoutEditor {
		
		let layout = Layout(frame: frame)
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func makeFrame(_ frame: @escaping (_ parameter: LayoutControlParameter) -> CGRect) -> LayoutEditor {
		
		let layout = Layout(frame: frame)
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func makeFrame(_ frame: @escaping (_ fittedSize: (_ fittingSize: CGSize) -> CGSize, _ parameter: LayoutControlParameter) -> CGRect) -> LayoutEditor {
		
		let layout = Layout(frame: frame)
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Frame -
extension InitialLayoutMaker: LayoutMakerCanSetFrameType {
	
	public typealias WillSetFrameMaker = LayoutEditor
	
	public func setFrame(_ frame: LayoutElement.Rect) -> LayoutEditor {
		
		let layout = Layout { (parameter) -> CGRect in
			return frame.evaluated(from: parameter)
		}
		
		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

// MARK: - Set A Point -
// MARK: TopLeft
extension InitialLayoutMaker: LayoutMakerCanSetTopLeftType {
	
	public typealias WillSetTopLeftMaker = TopLeftDidSetLayoutMaker
	
	public func setTopLeft(_ topLeft: LayoutElement.Point) -> TopLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topLeft: topLeft)
		
	}
	
}

// MARK: TopCenter
extension InitialLayoutMaker: LayoutMakerCanSetTopCenterType {
	
	public typealias WillSetTopCenterMaker = TopCenterDidSetLayoutMaker
	
	public func setTopCenter(_ topCenter: LayoutElement.Point) -> TopCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topCenter: topCenter)
		
	}
	
}

// MARK: TopRight
extension InitialLayoutMaker: LayoutMakerCanSetTopRightType {
	
	public typealias WillSetTopRightMaker = TopRightDidSetLayoutMaker
	
	public func setTopRight(_ topRight: LayoutElement.Point) -> TopRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 topRight: topRight)
		
	}
	
}

// MARK: MiddleLeft
extension InitialLayoutMaker: LayoutMakerCanSetMiddleLeftType {
	
	public typealias WillSetMiddleLeftMaker = MiddleLeftDidSetLayoutMaker
	
	public func setMiddleLeft(_ middleLeft: LayoutElement.Point) -> MiddleLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleLeft: middleLeft)
		
	}
	
}

// MARK: MiddleCenter
extension InitialLayoutMaker: LayoutMakerCanSetMiddleCenterType {
	
	public typealias WillSetMiddleCenterMaker = MiddleCenterDidSetLayoutMaker
	
	public func setMiddleCenter(_ middleCenter: LayoutElement.Point) -> MiddleCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleCenter: middleCenter)
		
	}
	
}

// MARK: MiddleRight
extension InitialLayoutMaker: LayoutMakerCanSetMiddleRightType {
	
	public typealias WillSetMiddleRightMaker = MiddleRightDidSetLayoutMaker
	
	public func setMiddleRight(_ middleRight: LayoutElement.Point) -> MiddleRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 middleRight: middleRight)
		
	}
	
}

// MARK: BottomLeft
extension InitialLayoutMaker: LayoutMakerCanSetBottomLeftType {
	
	public typealias WillSetBottomLeftMaker = BottomLeftDidSetLayoutMaker
	
	public func setBottomLeft(_ bottomLeft: LayoutElement.Point) -> BottomLeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomLeft: bottomLeft)
		
	}
	
}

// MARK: BottomCenter
extension InitialLayoutMaker: LayoutMakerCanSetBottomCenterType {
	
	public typealias WillSetBottomCenterMaker = BottomCenterDidSetLayoutMaker
	
	public func setBottomCenter(_ bottomCenter: LayoutElement.Point) -> BottomCenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomCenter: bottomCenter)
		
	}
	
}

// MARK: BottomRight
extension InitialLayoutMaker: LayoutMakerCanSetBottomRightType {
	
	public typealias WillSetBottomRightMaker = BottomRightDidSetLayoutMaker
	
	public func setBottomRight(_ bottomRight: LayoutElement.Point) -> BottomRightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 bottomRight: bottomRight)
		
	}
	
}

// MARK: - Set A Line -
// MARK: Left
extension InitialLayoutMaker: LayoutMakerCanSetLeftType {
	
	public typealias WillSetLeftMaker = LeftDidSetLayoutMaker
	
	public func setLeft(_ left: LayoutElement.Float) -> LeftDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 left: left)
		
	}
	
}

// MARK: Center
extension InitialLayoutMaker: LayoutMakerCanSetCenterType {
	
	public typealias WillSetCenterMaker = CenterDidSetLayoutMaker
	
	public func setCenter(_ center: LayoutElement.Float) -> CenterDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 center: center)
		
	}
	
}

// MARK: Right
extension InitialLayoutMaker: LayoutMakerCanSetRightType {
	
	public typealias WillSetRightMaker = RightDidSetLayoutMaker
	
	public func setRight(_ right: LayoutElement.Float) -> RightDidSetLayoutMaker {
		
		return .init(parentView: self.parentView,
					 right: right)
		
	}
	
}
