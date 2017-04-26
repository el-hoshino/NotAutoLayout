//
//  LayoutMatrical.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/18.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Layout.Matrical {
	
	private func getBounds(horizontallyAfterRow previousRowView: UIView, verticallyAfterCol previousColView: UIView, margin: CGVector) -> Bounds {
		
		let previousMaxX = previousRowView.frame.maxX
		let x = previousMaxX + margin.dx
		
		let previousMaxY = previousColView.frame.maxY
		let y = previousMaxY + margin.dy
		
		let origin = CGPoint(x: x, y: y)
		let size = previousColView.frame.size
		
		let frame = CGRect(origin: origin, size: size)
		let bounds = Bounds(frame: frame)
		
		return bounds
		
	}
	
	private func getBounds(horizontallyAfterRow previousRowView: UIView, margin: CGVector) -> Bounds {
		
		let previousMaxX = previousRowView.frame.maxX
		let x = previousMaxX + margin.dx
		
		let y = previousRowView.frame.minY
		
		let origin = CGPoint(x: x, y: y)
		let size = previousRowView.frame.size
		
		let frame = CGRect(origin: origin, size: size)
		let bounds = Bounds(frame: frame)
		
		return bounds
		
	}
	
	private func getBounds(verticallyAfterCol previousColView: UIView, margin: CGVector) -> Bounds {
		
		let x = previousColView.frame.minX
		
		let previousMaxY = previousColView.frame.maxY
		let y = previousMaxY + margin.dy
		
		let origin = CGPoint(x: x, y: y)
		let size = previousColView.frame.size
		
		let frame = CGRect(origin: origin, size: size)
		let bounds = Bounds(frame: frame)
		
		return bounds
		
	}
	
	fileprivate func getBounds(horizontallyAfterRow previousRowView: UIView?, verticallyAfterCol previousColView: UIView?, in boundSize: CGSize, initialFrame: Frame, margin: CGVector, _ method: CalculationMethod) -> Bounds {
		
		switch (previousRowView, previousColView) {
		case (.some(let previousRowView), .some(let previousColView)):
			let margin = method.absoluteVector(margin, by: boundSize)
			let bounds = self.getBounds(horizontallyAfterRow: previousRowView, verticallyAfterCol: previousColView, margin: margin)
			return bounds
			
		case (.some(let previousRowView), .none):
			let margin = method.absoluteVector(margin, by: boundSize)
			let bounds = self.getBounds(horizontallyAfterRow: previousRowView, margin: margin)
			return bounds
			
		case (.none, .some(let previousColView)):
			let margin = method.absoluteVector(margin, by: boundSize)
			let bounds = self.getBounds(verticallyAfterCol: previousColView, margin: margin)
			return bounds
			
		case (.none, .none):
			let frame = method.absoluteFrame(initialFrame, by: boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Matrical {
	
	private func getBounds(verticallyAfterRow previousRowView: UIView, horizontallyAfterCol previousColView: UIView, margin: CGVector) -> Bounds {
		
		let previousMaxX = previousColView.frame.maxX
		let x = previousMaxX + margin.dx
		
		let previousMaxY = previousRowView.frame.maxY
		let y = previousMaxY + margin.dy
		
		let origin = CGPoint(x: x, y: y)
		let size = previousColView.frame.size
		
		let frame = CGRect(origin: origin, size: size)
		let bounds = Bounds(frame: frame)
		
		return bounds
		
	}
	
	private func getBounds(verticallyAfterRow previousRowView: UIView, margin: CGVector) -> Bounds {
		
		let x = previousRowView.frame.minX
		
		let previousMaxY = previousRowView.frame.maxY
		let y = previousMaxY + margin.dy
		
		let origin = CGPoint(x: x, y: y)
		let size = previousRowView.frame.size
		
		let frame = CGRect(origin: origin, size: size)
		let bounds = Bounds(frame: frame)
		
		return bounds
		
	}
	
	private func getBounds(horizontallyAfterCol previousColView: UIView, margin: CGVector) -> Bounds {
		
		let previousMaxX = previousColView.frame.maxX
		let x = previousMaxX + margin.dx
		
		let y = previousColView.frame.minY
		
		let origin = CGPoint(x: x, y: y)
		let size = previousColView.frame.size
		
		let frame = CGRect(origin: origin, size: size)
		let bounds = Bounds(frame: frame)
		
		return bounds
		
	}
	
	fileprivate func getBounds(verticallyAfterRow previousRowView: UIView?, horizontallyAfterCol previousColView: UIView?, in boundSize: CGSize, initialFrame: Frame, margin: CGVector, _ method: CalculationMethod) -> Bounds {
		
		switch (previousRowView, previousColView) {
		case (.some(let previousRowView), .some(let previousColView)):
			let margin = method.absoluteVector(margin, by: boundSize)
			let bounds = self.getBounds(verticallyAfterRow: previousRowView, horizontallyAfterCol: previousColView, margin: margin)
			return bounds
			
		case (.some(let previousRowView), .none):
			let margin = method.absoluteVector(margin, by: boundSize)
			let bounds = self.getBounds(verticallyAfterRow: previousRowView, margin: margin)
			return bounds
			
		case (.none, .some(let previousColView)):
			let margin = method.absoluteVector(margin, by: boundSize)
			let bounds = self.getBounds(horizontallyAfterCol: previousColView, margin: margin)
			return bounds
			
		case (.none, .none):
			let frame = method.absoluteFrame(initialFrame, by: boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Matrical {
	
	fileprivate func getBounds(afterRow previousRowView: UIView?, afterCol previousColView: UIView?, in boundSize: CGSize, initial: SizeToFrame, firstInCol: PreviousColFrameAndSizeToFrame, firstInRow: PreviousRowFrameAndSizeToFrame, rest: PreviousRowColFrameAndSizeToFrame) -> Bounds {
		
		switch (previousRowView, previousColView) {
		case (.some(let previousRowView), .some(let previousColView)):
			let frame = rest(previousRowView.frame, previousColView.frame, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
			
		case (.some(let previousRowView), .none):
			let frame = firstInRow(previousRowView.frame, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
			
		case (.none, .some(let previousColView)):
			let frame = firstInCol(previousColView.frame, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
			
		case (.none, .none):
			let frame = initial(boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Matrical {
	
	fileprivate func getBounds(for view: UIView, thatFits fittingSize: CGSize, afterRow previousRowView: UIView?, afterCol previousColView: UIView?, in boundSize: CGSize, initial: FitSizeBoundSizeToFrame, firstInCol: PreviousColFrameFitSizeAndSizeToFrame, firstInRow: PreviousRowFrameFitSizeAndSizeToFrame, rest: PreviousRowColFrameFitSizeAndSizeToFrame) -> Bounds {
		
		let fitSize = view.sizeThatFits(fittingSize)
		
		switch (previousRowView, previousColView) {
		case (.some(let previousRowView), .some(let previousColView)):
			let frame = rest(previousRowView.frame, previousColView.frame, fitSize, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
			
		case (.some(let previousRowView), .none):
			let frame = firstInRow(previousRowView.frame, fitSize, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
			
		case (.none, .some(let previousColView)):
			let frame = firstInCol(previousColView.frame, fitSize, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
			
		case (.none, .none):
			let frame = initial(fitSize, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Matrical {
	
	func absoluteBounds(of view: UIView, afterRow previousRowView: UIView? = nil, afterCol previousColView: UIView? = nil, in boundSize: CGSize) -> Bounds {
		
		switch self {
		case .horizontallyEqualSizedAbsolute(initial: let initialFrame, margin: let margin):
			return self.getBounds(horizontallyAfterRow: previousRowView, verticallyAfterCol: previousColView, in: boundSize, initialFrame: initialFrame, margin: margin, .absolutely)
			
		case .verticallyEqualSizedAbsolute(initial: let initialFrame, margin: let margin):
			return self.getBounds(verticallyAfterRow: previousRowView, horizontallyAfterCol: previousColView, in: boundSize, initialFrame: initialFrame, margin: margin, .absolutely)
			
		case .horizontallyEqualSizedRelative(initial: let initialFrame, margin: let margin):
			return self.getBounds(horizontallyAfterRow: previousRowView, verticallyAfterCol: previousColView, in: boundSize, initialFrame: initialFrame, margin: margin, .relatively)
			
		case .verticallyEqualSizedRelative(initial: let initialFrame, margin: let margin):
			return self.getBounds(verticallyAfterRow: previousRowView, horizontallyAfterCol: previousColView, in: boundSize, initialFrame: initialFrame, margin: margin, .relatively)
			
		case .customByFrame(initial: let initialFrameClosure, firstInCol: let firstInColFrameClosure, firstInRow: let firstInRowFrameClosure, rest: let restFrameClosure):
			return self.getBounds(afterRow: previousRowView, afterCol: previousColView, in: boundSize, initial: initialFrameClosure, firstInCol: firstInColFrameClosure, firstInRow: firstInRowFrameClosure, rest: restFrameClosure)
			
		case .customFitsSizeByFrame(fittingSize: let fittingSize, initial: let initialFrameClosure, firstInCol: let firstInColFrameClosure, firstInRow: let firstInRowFrameClosure, rest: let restFrameClosure):
			return self.getBounds(for: view, thatFits: fittingSize, afterRow: previousRowView, afterCol: previousColView, in: boundSize, initial: initialFrameClosure, firstInCol: firstInColFrameClosure, firstInRow: firstInRowFrameClosure, rest: restFrameClosure)
		}
		
	}
	
}
