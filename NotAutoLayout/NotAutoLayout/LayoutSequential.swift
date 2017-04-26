//
//  LayoutSequential.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/18.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Layout.Sequential {
	
	private func getBounds(horizontallyAfter previousView: UIView, margin: CGFloat) -> Bounds {
		
		let size = previousView.frame.size
		let previousMaxX = previousView.frame.maxX
		let x = previousMaxX + margin
		let origin = CGPoint(x: x, y: previousView.frame.minY)
		let frame = CGRect(origin: origin, size: size)
		let bounds = Bounds(frame: frame)
		
		return bounds
		
	}
	
	fileprivate func getBounds(horizontallyAfter previousView: UIView?, in boundSize: CGSize, initialFrame: Frame, margin: CGFloat, _ method: CalculationMethod) -> Bounds {
		
		if let previousView = previousView {
			let margin = method.absoluteWidth(margin, by: boundSize)
			let bounds = self.getBounds(horizontallyAfter: previousView, margin: margin)
			return bounds
			
		} else {
			let frame = method.absoluteFrame(initialFrame, by: boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Sequential {
	
	private func getBounds(verticallyAfter previousView: UIView, margin: CGFloat) -> Bounds {
		
		let size = previousView.frame.size
		let previousMaxY = previousView.frame.maxY
		let y = previousMaxY + margin
		let origin = CGPoint(x: previousView.frame.minX, y: y)
		let frame = CGRect(origin: origin, size: size)
		let bounds = Bounds(frame: frame)
		
		return bounds
		
	}
	
	fileprivate func getBounds(verticallyAfter previousView: UIView?, in boundSize: CGSize, initialFrame: Frame, margin: CGFloat, _ method: CalculationMethod) -> Bounds {
		
		if let previousView = previousView {
			
			let bounds = self.getBounds(verticallyAfter: previousView, margin: margin)
			return bounds
			
		} else {
			let bounds = initialFrame.bounds(in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Sequential {
	
	fileprivate func getBounds(after previousView: UIView?, in boundSize: CGSize, initial: SizeToFrame, rest: PreviousFrameAndSizeToFrame) -> Bounds {
		
		if let previousView = previousView {
			let frame = rest(previousView.frame, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
			
		} else {
			let frame = initial(boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Sequential {
	
	fileprivate func getBounds(for view: UIView, tahtFits fittingSize: CGSize, after previousView: UIView?, in boundSize: CGSize, initial: FitSizeBoundSizeToFrame, rest: PreviousFrameFitSizeAndSizeToFrame) -> Bounds {
		
		let fitSize = view.sizeThatFits(fittingSize)
		
		if let previousView = previousView {
			let frame = rest(previousView.frame, fitSize, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
			
		} else {
			let frame = initial(fitSize, boundSize)
			let bounds = frame.bounds(in: boundSize)
			return bounds
		}
		
	}
	
}

extension Layout.Sequential {
	
	func absoluteBounds(of view: UIView, after previousView: UIView? = nil, in boundSize: CGSize) -> Bounds {
		
		switch self {
		case .horizontallyEqualSizedAbsolute(initial: let initialFrame, margin: let margin):
			return self.getBounds(horizontallyAfter: previousView, in: boundSize, initialFrame: initialFrame, margin: margin, .absolutely)
			
		case .verticallyEqualSizedAbsolute(initial: let initialFrame, margin: let margin):
			return self.getBounds(verticallyAfter: previousView, in: boundSize, initialFrame: initialFrame, margin: margin, .absolutely)
			
		case .horizontallyEqualSizedRelative(initial: let initialFrame, margin: let margin):
			return self.getBounds(horizontallyAfter: previousView, in: boundSize, initialFrame: initialFrame, margin: margin, .relatively)
			
		case .verticallyEqualSizedRelative(initial: let initialFrame, margin: let margin):
			return self.getBounds(verticallyAfter: previousView, in: boundSize, initialFrame: initialFrame, margin: margin, .relatively)
			
		case .customByFrame(initial: let initialFrameClosure, rest: let restFrameClosure):
			return self.getBounds(after: previousView, in: boundSize, initial: initialFrameClosure, rest: restFrameClosure)
			
		case .customFitsSizeByFrame(fittingSize: let fittingSize, initial: let initialFrameClosure, rest: let restFrameClosure):
			return self.getBounds(for: view, tahtFits: fittingSize, after: previousView, in: boundSize, initial: initialFrameClosure, rest: restFrameClosure)
		}
		
	}
	
}
