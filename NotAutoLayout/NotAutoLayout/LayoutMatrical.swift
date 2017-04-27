//
//  LayoutMatrical.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/18.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Layout {
	
	/// An enum to provide serveral ways to store or retrieve a Frame value for matrical subviews.
	///
	/// - horizontallyBeforeVerticallyEqualSizedAbsolute: First-Horizontally-Then-Vertically sorted absolute `Frame` and margin in `CGVector` value.
	/// - verticallyBeforeHorizontallyEqualSizedAbsolute: First-Vertically-Then-Horizontally sorted absolute `Frame` and margin in `CGVector` value.
	/// - horizontallyBeforeVerticallyEqualSizedRelative: First-Horizontally-Then-Vertically sorted relative `Frame` and margin in `CGVector` value.
	/// - verticallyBeforeHorizontallyEqualSizedRelative: First-Vertically-Then-Horizontally sorted relative `Frame` and margin in `CGVector` value.
	/// - customByFrame: `SizeToFrame` if it's the first in both column and row, `PreviousColFrameAndSizeToFrame` if it's the first in column, `PreviousRowFrameAndSizeToFrame` if it's the first in row, otherwise `PreviousFrameAndSizeToFrame`
	/// - customByFittingSizeFrame: Fitting size, and `FittedSizeBoundSizeToFrame` if it's the first in both column and row, `PreviousColFrameFittedSizeAndSizeToFrame` if it's the first in column, `PreviousRowFrameFittedSizeAndSizeToFrame` if it's the first in row, otherwise `PreviousFrameFittedSizeAndSizeToFrame`
	public enum Matrical {
		
		// MARK: Typealias
		
		/// A closure to retrieve `Frame` value from current bound size.
		public typealias SizeToFrame = (CGSize) -> Frame
		
		
		/// A closure to retrieve `Frame` value from previous column's subview's frame and current bound size.
		public typealias PreviousColFrameAndSizeToFrame = (_ previousColFrame: CGRect, _ boundSize: CGSize) -> Frame
		
		/// A closure to retrieve `Frame` value from previous row's subview's frame and current bound size.
		public typealias PreviousRowFrameAndSizeToFrame = (_ previousRowFrame: CGRect, _ boundSize: CGSize) -> Frame
		
		/// A closure to retrieve `Frame` value from previous column's subview's frame, previous row's subview's frame, and current bound size.
		public typealias PreviousColRowFrameAndSizeToFrame = (_ previousColFrame: CGRect, _ previousRowFrame: CGRect, _ boundSize: CGSize) -> Frame
		
		
		/// A closure to retrieve `Frame` value from fitted size and current bound size.
		public typealias FittedSizeBoundSizeToFrame = (_ fittedSize: CGSize, _ boundSize: CGSize) -> Frame
		
		/// A closure to retrieve `Frame` value from previous column's subview's frame, fitted size and current bound size.
		public typealias PreviousColFrameFittedSizeAndSizeToFrame = (_ previousColFrame: CGRect, _ fittedSize: CGSize, _ boundSize: CGSize) -> Frame
		
		/// A closure to retrieve `Frame` value from previous row's subview's frame, fitted size and current bound size.
		public typealias PreviousRowFrameFittedSizeAndSizeToFrame = (_ previousRowFrame: CGRect, _ fittedSize: CGSize, _ boundSize: CGSize) -> Frame
		
		/// A closure to retrieve `Frame` value from previous row's subview's frame, previous column's subview's frame, fitted size and current bound size.
		public typealias PreviousColRowFrameFittedSizeAndSizeToFrame = (_ previousColFrame: CGRect, _ previousRowFrame: CGRect, _ fittedSize: CGSize, _ boundSize: CGSize) -> Frame
		
		
		// MARK: Cases
		
		case horizontallyBeforeVerticallyEqualSizedAbsolute(initial: Frame, margin: CGVector)
		case verticallyBeforeHorizontallyEqualSizedAbsolute(initial: Frame, margin: CGVector)
		
		case horizontallyBeforeVerticallyEqualSizedRelative(initial: Frame, margin: CGVector)
		case verticallyBeforeHorizontallyEqualSizedRelative(initial: Frame, margin: CGVector)
		
		case customByFrame(initial: SizeToFrame, firstInCol: PreviousColFrameAndSizeToFrame, firstInRow: PreviousRowFrameAndSizeToFrame, rest: PreviousColRowFrameAndSizeToFrame)
		
		case customByFittingSizeFrame(fittingSize: CGSize, initial: FittedSizeBoundSizeToFrame, firstInCol: PreviousColFrameFittedSizeAndSizeToFrame, firstInRow: PreviousRowFrameFittedSizeAndSizeToFrame, rest: PreviousColRowFrameFittedSizeAndSizeToFrame)
		
	}
	
}

extension Layout.Matrical {
	
	public enum Direction {
		case horizontalBeforeVertical
		case verticalBeforeHorizontal
	}
	
}

extension Layout.Matrical {
	
	private func getBounds(horizontallyAfterCol previousColView: UIView, verticallyAfterRow previousRowView: UIView, margin: CGVector) -> Bounds {
		
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
	
	fileprivate func getBounds(horizontallyAfterCol previousColView: UIView?, verticallyAfterRow previousRowView: UIView?, in boundSize: CGSize, initialFrame: Frame, margin: CGVector, _ method: CalculationMethod) -> Bounds {
		
		switch (previousColView, previousRowView) {
		case (.some(let previousColView), .some(let previousRowView)):
			let margin = method.absoluteVector(margin, by: boundSize)
			let bounds = self.getBounds(horizontallyAfterCol: previousColView, verticallyAfterRow: previousRowView, margin: margin)
			return bounds
			
		case (.some(let previousColView), .none):
			let margin = method.absoluteVector(margin, by: boundSize)
			let bounds = self.getBounds(horizontallyAfterCol: previousColView, margin: margin)
			return bounds
			
		case (.none, .some(let previousRowView)):
			let margin = method.absoluteVector(margin, by: boundSize)
			let bounds = self.getBounds(verticallyAfterRow: previousRowView, margin: margin)
			return bounds
			
		case (.none, .none):
			let frame = method.absoluteFrame(initialFrame, by: boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Matrical {
	
	private func getBounds(verticallyAfterCol previousColView: UIView, horizontallyAfterRow previousRowView: UIView, margin: CGVector) -> Bounds {
		
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
	
	fileprivate func getBounds(verticallyAfterCol previousColView: UIView?, horizontallyAfterRow previousRowView: UIView?, in boundSize: CGSize, initialFrame: Frame, margin: CGVector, _ method: CalculationMethod) -> Bounds {
		
		switch (previousColView, previousRowView) {
		case (.some(let previousColView), .some(let previousRowView)):
			let margin = method.absoluteVector(margin, by: boundSize)
			let bounds = self.getBounds(verticallyAfterCol: previousColView, horizontallyAfterRow: previousRowView, margin: margin)
			return bounds
			
		case (.some(let previousColView), .none):
			let margin = method.absoluteVector(margin, by: boundSize)
			let bounds = self.getBounds(verticallyAfterCol: previousColView, margin: margin)
			return bounds
			
		case (.none, .some(let previousRowView)):
			let margin = method.absoluteVector(margin, by: boundSize)
			let bounds = self.getBounds(horizontallyAfterRow: previousRowView, margin: margin)
			return bounds
			
		case (.none, .none):
			let frame = method.absoluteFrame(initialFrame, by: boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Matrical {
	
	fileprivate func getBounds(afterCol previousColView: UIView?, afterRow previousRowView: UIView?, in boundSize: CGSize, initial: SizeToFrame, firstInCol: PreviousColFrameAndSizeToFrame, firstInRow: PreviousRowFrameAndSizeToFrame, rest: PreviousColRowFrameAndSizeToFrame) -> Bounds {
		
		switch (previousColView, previousRowView) {
		case (.some(let previousColView), .some(let previousRowView)):
			let frame = rest(previousColView.frame, previousRowView.frame, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
			
		case (.some(let previousColView), .none):
			let frame = firstInCol(previousColView.frame, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
			
		case (.none, .some(let previousRowView)):
			let frame = firstInRow(previousRowView.frame, boundSize)
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
	
	fileprivate func getBounds(for view: UIView, thatFits fittingSize: CGSize, afterCol previousColView: UIView?, afterRow previousRowView: UIView?, in boundSize: CGSize, initial: FittedSizeBoundSizeToFrame, firstInCol: PreviousColFrameFittedSizeAndSizeToFrame, firstInRow: PreviousRowFrameFittedSizeAndSizeToFrame, rest: PreviousColRowFrameFittedSizeAndSizeToFrame) -> Bounds {
		
		let fittedSize = view.sizeThatFits(fittingSize)
		
		switch (previousColView, previousRowView) {
		case (.some(let previousColView), .some(let previousRowView)):
			let frame = rest(previousColView.frame, previousRowView.frame, fittedSize, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
			
		case (.some(let previousColView), .none):
			let frame = firstInCol(previousColView.frame, fittedSize, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
			
		case (.none, .some(let previousRowView)):
			let frame = firstInRow(previousRowView.frame, fittedSize, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
			
		case (.none, .none):
			let frame = initial(fittedSize, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Matrical {
	
	func absoluteBounds(of view: UIView, afterCol previousColView: UIView? = nil, afterRow previousRowView: UIView? = nil, in boundSize: CGSize) -> Bounds {
		
		switch self {
		case .horizontallyBeforeVerticallyEqualSizedAbsolute(initial: let initialFrame, margin: let margin):
			return self.getBounds(horizontallyAfterCol: previousColView, verticallyAfterRow: previousRowView, in: boundSize, initialFrame: initialFrame, margin: margin, .absolutely)
			
		case .verticallyBeforeHorizontallyEqualSizedAbsolute(initial: let initialFrame, margin: let margin):
			return self.getBounds(verticallyAfterCol: previousColView, horizontallyAfterRow: previousRowView, in: boundSize, initialFrame: initialFrame, margin: margin, .absolutely)
			
		case .horizontallyBeforeVerticallyEqualSizedRelative(initial: let initialFrame, margin: let margin):
			return self.getBounds(horizontallyAfterCol: previousColView, verticallyAfterRow: previousRowView, in: boundSize, initialFrame: initialFrame, margin: margin, .relatively)
			
		case .verticallyBeforeHorizontallyEqualSizedRelative(initial: let initialFrame, margin: let margin):
			return self.getBounds(verticallyAfterCol: previousColView, horizontallyAfterRow: previousRowView, in: boundSize, initialFrame: initialFrame, margin: margin, .relatively)
			
		case .customByFrame(initial: let initialFrameClosure, firstInCol: let firstInColFrameClosure, firstInRow: let firstInRowFrameClosure, rest: let restFrameClosure):
			return self.getBounds(afterCol: previousColView, afterRow: previousRowView, in: boundSize, initial: initialFrameClosure, firstInCol: firstInColFrameClosure, firstInRow: firstInRowFrameClosure, rest: restFrameClosure)
			
		case .customByFittingSizeFrame(fittingSize: let fittingSize, initial: let initialFrameClosure, firstInCol: let firstInColFrameClosure, firstInRow: let firstInRowFrameClosure, rest: let restFrameClosure):
			return self.getBounds(for: view, thatFits: fittingSize, afterCol: previousColView, afterRow: previousRowView, in: boundSize, initial: initialFrameClosure, firstInCol: firstInColFrameClosure, firstInRow: firstInRowFrameClosure, rest: restFrameClosure)
		}
		
	}
	
}
