//
//  LayoutPositionMatrical.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/18.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension LayoutPosition.Matrical {
	
	private func getHorizontalPosition(afterRow previousRowView: UIView, afterCol previousColView: UIView, margin: CGVector) -> Position {
		
		let previousMaxX = previousRowView.frame.maxX
		let x = previousMaxX + margin.dx
		
		let previousMaxY = previousColView.frame.maxY
		let y = previousMaxY + margin.dy
		
		let origin = CGPoint(x: x, y: y)
		let size = previousColView.frame.size
		
		let frame = CGRect(origin: origin, size: size)
		let position = Position(frame: frame)
		
		return position
		
	}
	
	private func getHorizontalPosition(afterRow previousRowView: UIView, margin: CGVector) -> Position {
		
		let previousMaxX = previousRowView.frame.maxX
		let x = previousMaxX + margin.dx
		
		let y = previousRowView.frame.minY
		
		let origin = CGPoint(x: x, y: y)
		let size = previousRowView.frame.size
		
		let frame = CGRect(origin: origin, size: size)
		let position = Position(frame: frame)
		
		return position
		
	}
	
	private func getHorizontalPosition(afterCol previousColView: UIView, margin: CGVector) -> Position {
		
		let x = previousColView.frame.minX
		
		let previousMaxY = previousColView.frame.maxY
		let y = previousMaxY + margin.dy
		
		let origin = CGPoint(x: x, y: y)
		let size = previousColView.frame.size
		
		let frame = CGRect(origin: origin, size: size)
		let position = Position(frame: frame)
		
		return position
		
	}
	
	fileprivate func getHorizontalPosition(afterRow previousRowView: UIView?, afterCol previousColView: UIView?, in boundSize: CGSize, initialFrame: Frame, margin: CGVector, _ method: PositioningMethod) -> Position {
		
		switch (previousRowView, previousColView) {
		case (.some(let previousRowView), .some(let previousColView)):
			let margin = method.absoluteVector(margin, by: boundSize)
			let position = self.getHorizontalPosition(afterRow: previousRowView, afterCol: previousColView, margin: margin)
			return position
			
		case (.some(let previousRowView), .none):
			let margin = method.absoluteVector(margin, by: boundSize)
			let position = self.getHorizontalPosition(afterRow: previousRowView, margin: margin)
			return position
			
		case (.none, .some(let previousColView)):
			let margin = method.absoluteVector(margin, by: boundSize)
			let position = self.getHorizontalPosition(afterCol: previousColView, margin: margin)
			return position
			
		case (.none, .none):
			let frame = method.absoluteFrame(initialFrame, by: boundSize)
			let position = frame.position(in: boundSize)
			return position
		}
		
	}
	
}

extension LayoutPosition.Matrical {
	
	private func getVerticalPosition(afterRow previousRowView: UIView, afterCol previousColView: UIView, margin: CGVector) -> Position {
		
		let previousMaxX = previousColView.frame.maxX
		let x = previousMaxX + margin.dx
		
		let previousMaxY = previousRowView.frame.maxY
		let y = previousMaxY + margin.dy
		
		let origin = CGPoint(x: x, y: y)
		let size = previousColView.frame.size
		
		let frame = CGRect(origin: origin, size: size)
		let position = Position(frame: frame)
		
		return position
		
	}
	
	private func getVerticalPosition(afterRow previousRowView: UIView, margin: CGVector) -> Position {
		
		let x = previousRowView.frame.minX
		
		let previousMaxY = previousRowView.frame.maxY
		let y = previousMaxY + margin.dy
		
		let origin = CGPoint(x: x, y: y)
		let size = previousRowView.frame.size
		
		let frame = CGRect(origin: origin, size: size)
		let position = Position(frame: frame)
		
		return position
		
	}
	
	private func getVerticalPosition(afterCol previousColView: UIView, margin: CGVector) -> Position {
		
		let previousMaxX = previousColView.frame.maxX
		let x = previousMaxX + margin.dx
		
		let y = previousColView.frame.minY
		
		let origin = CGPoint(x: x, y: y)
		let size = previousColView.frame.size
		
		let frame = CGRect(origin: origin, size: size)
		let position = Position(frame: frame)
		
		return position
		
	}
	
	fileprivate func getVerticalPosition(afterRow previousRowView: UIView?, afterCol previousColView: UIView?, in boundSize: CGSize, initialFrame: Frame, margin: CGVector, _ method: PositioningMethod) -> Position {
		
		switch (previousRowView, previousColView) {
		case (.some(let previousRowView), .some(let previousColView)):
			let margin = method.absoluteVector(margin, by: boundSize)
			let position = self.getVerticalPosition(afterRow: previousRowView, afterCol: previousColView, margin: margin)
			return position
			
		case (.some(let previousRowView), .none):
			let margin = method.absoluteVector(margin, by: boundSize)
			let position = self.getVerticalPosition(afterRow: previousRowView, margin: margin)
			return position
			
		case (.none, .some(let previousColView)):
			let margin = method.absoluteVector(margin, by: boundSize)
			let position = self.getVerticalPosition(afterCol: previousColView, margin: margin)
			return position
			
		case (.none, .none):
			let frame = method.absoluteFrame(initialFrame, by: boundSize)
			let position = frame.position(in: boundSize)
			return position
		}
		
	}
	
}

extension LayoutPosition.Matrical {
	
	fileprivate func getPosition(afterRow previousRowView: UIView?, afterCol previousColView: UIView?, in boundSize: CGSize, initial: SizeToFrame, firstInCol: PreviousColFrameAndSizeToFrame, firstInRow: PreviousRowFrameAndSizeToFrame, rest: PreviousRowColFrameAndSizeToFrame) -> Position {
		
		switch (previousRowView, previousColView) {
		case (.some(let previousRowView), .some(let previousColView)):
			let frame = rest(previousRowView.frame, previousColView.frame, boundSize)
			let position = frame.position(in: boundSize)
			return position
			
		case (.some(let previousRowView), .none):
			let frame = firstInRow(previousRowView.frame, boundSize)
			let position = frame.position(in: boundSize)
			return position
			
		case (.none, .some(let previousColView)):
			let frame = firstInCol(previousColView.frame, boundSize)
			let position = frame.position(in: boundSize)
			return position
			
		case (.none, .none):
			let frame = initial(boundSize)
			let position = frame.position(in: boundSize)
			return position
		}
		
	}
	
}

extension LayoutPosition.Matrical {
	
	fileprivate func getPosition(for view: UIView, thatFits fittingSize: CGSize, afterRow previousRowView: UIView?, afterCol previousColView: UIView?, in boundSize: CGSize, initial: FitSizeBoundSizeToFrame, firstInCol: PreviousColFrameFitSizeAndSizeToFrame, firstInRow: PreviousRowFrameFitSizeAndSizeToFrame, rest: PreviousRowColFrameFitSizeAndSizeToFrame) -> Position {
		
		let fitSize = view.sizeThatFits(fittingSize)
		
		switch (previousRowView, previousColView) {
		case (.some(let previousRowView), .some(let previousColView)):
			let frame = rest(previousRowView.frame, previousColView.frame, fitSize, boundSize)
			let position = frame.position(in: boundSize)
			return position
			
		case (.some(let previousRowView), .none):
			let frame = firstInRow(previousRowView.frame, fitSize, boundSize)
			let position = frame.position(in: boundSize)
			return position
			
		case (.none, .some(let previousColView)):
			let frame = firstInCol(previousColView.frame, fitSize, boundSize)
			let position = frame.position(in: boundSize)
			return position
			
		case (.none, .none):
			let frame = initial(fitSize, boundSize)
			let position = frame.position(in: boundSize)
			return position
		}
		
	}
	
}

extension LayoutPosition.Matrical {
	
	func absolutePosition(of view: UIView, afterRow previousRowView: UIView? = nil, afterCol previousColView: UIView? = nil, in boundSize: CGSize) -> Position {
		
		switch self {
		case .horizontallyEqualSizedAbsolute(initial: let initialFrame, margin: let margin):
			return self.getHorizontalPosition(afterRow: previousRowView, afterCol: previousColView, in: boundSize, initialFrame: initialFrame, margin: margin, .absolutely)
			
		case .verticallyEqualSizedAbsolute(initial: let initialFrame, margin: let margin):
			return self.getVerticalPosition(afterRow: previousRowView, afterCol: previousColView, in: boundSize, initialFrame: initialFrame, margin: margin, .absolutely)
			
		case .horizontallyEqualSizedRelative(initial: let initialFrame, margin: let margin):
			return self.getHorizontalPosition(afterRow: previousRowView, afterCol: previousColView, in: boundSize, initialFrame: initialFrame, margin: margin, .relatively)
			
		case .verticallyEqualSizedRelative(initial: let initialFrame, margin: let margin):
			return self.getVerticalPosition(afterRow: previousRowView, afterCol: previousColView, in: boundSize, initialFrame: initialFrame, margin: margin, .relatively)
			
		case .customByFrame(initial: let initialFrameClosure, firstInCol: let firstInColFrameClosure, firstInRow: let firstInRowFrameClosure, rest: let restFrameClosure):
			return self.getPosition(afterRow: previousRowView, afterCol: previousColView, in: boundSize, initial: initialFrameClosure, firstInCol: firstInColFrameClosure, firstInRow: firstInRowFrameClosure, rest: restFrameClosure)
			
		case .customFitsSizeByFrame(fittingSize: let fittingSize, initial: let initialFrameClosure, firstInCol: let firstInColFrameClosure, firstInRow: let firstInRowFrameClosure, rest: let restFrameClosure):
			return self.getPosition(for: view, thatFits: fittingSize, afterRow: previousRowView, afterCol: previousColView, in: boundSize, initial: initialFrameClosure, firstInCol: firstInColFrameClosure, firstInRow: firstInRowFrameClosure, rest: restFrameClosure)
		}
		
	}
	
}
