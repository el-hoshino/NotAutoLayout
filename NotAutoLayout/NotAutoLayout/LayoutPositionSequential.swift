//
//  LayoutPositionSequential.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/18.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension LayoutPosition.Sequential {
	
	private func getHorizontalPosition(after previousView: UIView, margin: CGFloat) -> Position {
		
		let size = previousView.frame.size
		let previousMaxX = previousView.frame.maxX
		let x = previousMaxX + margin
		let origin = CGPoint(x: x, y: previousView.frame.minY)
		let frame = CGRect(origin: origin, size: size)
		let position = Position(frame: frame)
		
		return position
		
	}
	
	fileprivate func getHorizontalPosition(after previousView: UIView?, in boundSize: CGSize, initialFrame: CGRect, margin: CGFloat, _ method: PositioningMethod) -> Position {
		
		if let previousView = previousView {
			let margin = method.absoluteWidth(margin, by: boundSize)
			let position = self.getHorizontalPosition(after: previousView, margin: margin)
			return position
			
		} else {
			let frame = method.absoluteFrame(initialFrame, by: boundSize)
			let position = Position(frame: frame)
			return position
		}
		
	}
	
}

extension LayoutPosition.Sequential {
	
	private func getVerticalPosition(after previousView: UIView, margin: CGFloat) -> Position {
		
		let size = previousView.frame.size
		let previousMaxY = previousView.frame.maxY
		let y = previousMaxY + margin
		let origin = CGPoint(x: previousView.frame.minX, y: y)
		let frame = CGRect(origin: origin, size: size)
		let position = Position(frame: frame)
		
		return position
		
	}
	
	fileprivate func getVerticalPosition(after previousView: UIView?, in boundSize: CGSize, initialFrame: CGRect, margin: CGFloat, _ method: PositioningMethod) -> Position {
		
		if let previousView = previousView {
			
			let position = self.getVerticalPosition(after: previousView, margin: margin)
			return position
			
		} else {
			let position = Position(frame: initialFrame)
			return position
		}
		
	}
	
}

extension LayoutPosition.Sequential {
	
	fileprivate func getPosition(after previousView: UIView?, in boundSize: CGSize, initial: (CGSize) -> CGRect, rest: (_ previousFrame: CGRect, _ boundSize: CGSize) -> CGRect) -> Position {
		
		if let previousView = previousView {
			let frame = rest(previousView.frame, boundSize)
			let position = Position(frame: frame)
			return position
			
		} else {
			let frame = initial(boundSize)
			let position = Position(frame: frame)
			return position
		}
		
	}
	
}

extension LayoutPosition.Sequential {
	
	func absolutePosition(after previousView: UIView? = nil, in boundSize: CGSize) -> Position {
		
		switch self {
		case .horizontallyEqualSizedAbsolute(initial: let initialFrame, margin: let margin):
			return self.getHorizontalPosition(after: previousView, in: boundSize, initialFrame: initialFrame, margin: margin, .absolutely)
			
		case .verticallyEqualSizedAbsolute(initial: let initialFrame, margin: let margin):
			return self.getVerticalPosition(after: previousView, in: boundSize, initialFrame: initialFrame, margin: margin, .absolutely)
			
		case .horizontallyEqualSizedRelative(initial: let initialFrame, margin: let margin):
			return self.getHorizontalPosition(after: previousView, in: boundSize, initialFrame: initialFrame, margin: margin, .relatively)
			
		case .verticallyEqualSizedRelative(initial: let initialFrame, margin: let margin):
			return self.getVerticalPosition(after: previousView, in: boundSize, initialFrame: initialFrame, margin: margin, .relatively)
			
		case .customByFrame(initial: let initialFrameClosure, rest: let restFrameClosure):
			return self.getPosition(after: previousView, in: boundSize, initial: initialFrameClosure, rest: restFrameClosure)
			
		}
		
	}
	
}
