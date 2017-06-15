//
//  LayoutSequential.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/18.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Layout {
	
	/// An enum to provide serveral ways to store or retrieve a Frame value for sequential subviews.
	///
	/// - horizontallyEqualSizedAbsolute: Horizontally sorted absolute `Frame` and margin in `CGFloat` value.
	/// - verticallyEqualSizedAbsolute: Vertically sorted absolute `Frame` and margin in `CGFloat` value.
	/// - horizontallyEqualSizedRelative: Horizontally sorted relative `Frame` and margin in `CGFloat` value.
	/// - verticallyEqualSizedRelative: Vertically sorted relative `Frame` and margin in `CGFloat` value.
	/// - customByFrame: `SizeToFrame` if it's the first, otherwise `PreviousFrameAndSizeToFrame`
	/// - customByFittingSizeFrame: Fitting size, and `FittedSizeBoundSizeToFrame` if it's the first, otherwise `PreviousFrameFittedSizeAndSizeToFrame`
	public enum Sequential {
		
		// MARK: Typealias
		
		/// A closure to retrieve `Frame` value from current bound size.
		public typealias SizeToFrame = (CGSize) -> Frame
		
		/// A closure to retrieve `Frame` value from previous subview's frame and current bound size.
		public typealias PreviousFrameAndSizeToFrame = (_ previousFrame: CGRect, _ boundSize: CGSize) -> Frame
		
		/// A closure to retrieve `Frame` value from fitted size and current bound size.
		public typealias FittedSizeBoundSizeToFrame = (_ fittedSize: CGSize, _ boundSize: CGSize) -> Frame
		
		/// A closure to retrieve `Frame` value from previous subview's frame, fitted size and current bound size.
		public typealias PreviousFrameFittedSizeAndSizeToFrame = (_ previousFrame: CGRect, _ fittedSize: CGSize, _ boundSize: CGSize) -> Frame
		
		
		// MARK: Cases
		
		case horizontallyEqualSizedAbsolute(initial: Frame, margin: CGFloat)
		case verticallyEqualSizedAbsolute(initial: Frame, margin: CGFloat)
		
		case horizontallyEqualSizedRelative(initial: Frame, margin: CGFloat)
		case verticallyEqualSizedRelative(initial: Frame, margin: CGFloat)
		
		case customByFrame(initial: SizeToFrame, rest: PreviousFrameAndSizeToFrame)
		case customByFittingSizeFrame(fittingSize: CGSize, initial: FittedSizeBoundSizeToFrame, rest: PreviousFrameFittedSizeAndSizeToFrame)
		
	}
	
}

extension Layout.Sequential {
	
	public enum Direction {
		case horizontal
		case vertical
	}
	
}

extension Layout.Sequential {
	
	private func getBounds(horizontallyAfter previousView: UIView, margin: CGFloat, under anchorPoint: CGPoint) -> Bounds {
		
		let size = previousView.frame.size
		let previousMaxX = previousView.nal.identityFrame.maxX
		let x = previousMaxX + margin
		let origin = CGPoint(x: x, y: previousView.nal.identityFrame.minY)
		let frame = CGRect(origin: origin, size: size)
		let bounds = Bounds(frame: frame, anchorPoint: anchorPoint)
		
		return bounds
		
	}
	
	fileprivate func getBounds(horizontallyAfter previousView: UIView?, under anchorPoint: CGPoint, in boundSize: CGSize, initialFrame: Frame, margin: CGFloat, _ method: CalculationMethod) -> Bounds {
		
		if let previousView = previousView {
			let margin = method.absoluteWidth(margin, by: boundSize)
			let bounds = self.getBounds(horizontallyAfter: previousView, margin: margin, under: anchorPoint)
			return bounds
			
		} else {
			let frame = method.absoluteFrame(initialFrame, by: boundSize)
			let bounds = frame.bounds(under: anchorPoint, in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Sequential {
	
	private func getBounds(verticallyAfter previousView: UIView, under anchorPoint: CGPoint, margin: CGFloat) -> Bounds {
		
		let size = previousView.frame.size
		let previousMaxY = previousView.nal.identityFrame.maxY
		let y = previousMaxY + margin
		let origin = CGPoint(x: previousView.nal.identityFrame.minX, y: y)
		let frame = CGRect(origin: origin, size: size)
		let bounds = Bounds(frame: frame, anchorPoint: anchorPoint)
		
		return bounds
		
	}
	
	fileprivate func getBounds(verticallyAfter previousView: UIView?, under anchorPoint: CGPoint, in boundSize: CGSize, initialFrame: Frame, margin: CGFloat, _ method: CalculationMethod) -> Bounds {
		
		if let previousView = previousView {
			let bounds = self.getBounds(verticallyAfter: previousView, under: anchorPoint, margin: margin)
			return bounds
			
		} else {
			let bounds = initialFrame.bounds(under: anchorPoint, in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Sequential {
	
	fileprivate func getBounds(after previousView: UIView?, under anchorPoint: CGPoint, in boundSize: CGSize, initial: SizeToFrame, rest: PreviousFrameAndSizeToFrame) -> Bounds {
		
		if let previousView = previousView {
			let frame = rest(previousView.frame, boundSize)
			let bounds = frame.bounds(under: anchorPoint, in: boundSize)
			return bounds
			
		} else {
			let frame = initial(boundSize)
			let bounds = frame.bounds(under: anchorPoint, in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Sequential {
	
	fileprivate func getBounds(fittedIn fittedSize: CGSize, after previousView: UIView?, under anchorPoint: CGPoint, in boundSize: CGSize, initial: FittedSizeBoundSizeToFrame, rest: PreviousFrameFittedSizeAndSizeToFrame) -> Bounds {
		
		if let previousView = previousView {
			let frame = rest(previousView.frame, fittedSize, boundSize)
			let bounds = frame.bounds(under: anchorPoint, in: boundSize)
			return bounds
			
		} else {
			let frame = initial(fittedSize, boundSize)
			let bounds = frame.bounds(under: anchorPoint, in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Sequential {
	
	func absoluteBounds(of view: UIView, after previousView: UIView? = nil, in boundSize: CGSize) -> Bounds {
		
		let anchorPoint = view.layer.anchorPoint
		
		switch self {
		case .horizontallyEqualSizedAbsolute(initial: let initialFrame, margin: let margin):
			return self.getBounds(horizontallyAfter: previousView, under: anchorPoint, in: boundSize, initialFrame: initialFrame, margin: margin, .absolutely)
			
		case .verticallyEqualSizedAbsolute(initial: let initialFrame, margin: let margin):
			return self.getBounds(verticallyAfter: previousView, under: anchorPoint, in: boundSize, initialFrame: initialFrame, margin: margin, .absolutely)
			
		case .horizontallyEqualSizedRelative(initial: let initialFrame, margin: let margin):
			return self.getBounds(horizontallyAfter: previousView, under: anchorPoint, in: boundSize, initialFrame: initialFrame, margin: margin, .relatively)
			
		case .verticallyEqualSizedRelative(initial: let initialFrame, margin: let margin):
			return self.getBounds(verticallyAfter: previousView, under: anchorPoint, in: boundSize, initialFrame: initialFrame, margin: margin, .relatively)
			
		case .customByFrame(initial: let initialFrameClosure, rest: let restFrameClosure):
			return self.getBounds(after: previousView, under: anchorPoint, in: boundSize, initial: initialFrameClosure, rest: restFrameClosure)
			
		case .customByFittingSizeFrame(fittingSize: let fittingSize, initial: let initialFrameClosure, rest: let restFrameClosure):
			let fittedSize = view.sizeThatFits(fittingSize)
			return self.getBounds(fittedIn: fittedSize, after: previousView, under: anchorPoint, in: boundSize, initial: initialFrameClosure, rest: restFrameClosure)
		}
		
	}
	
}
