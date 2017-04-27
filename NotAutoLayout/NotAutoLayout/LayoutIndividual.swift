//
//  LayoutIndividual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/18.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Layout {
	
	/// A enum to provide serveral ways to store or retrieve a Frame value for individual subviews.
	///
	/// - absolute: Absolute `Frame` value.
	/// - relative: Relative `Frame` value which origin and size value are represented as the ratio compared to the current view's bound size.
	/// - insets: Margin values between the bounds of linked child view and current view.
	/// - customByFrame: `Frame` from bound size.
	/// - customByOriginSize: `origin` and `size` from bound size.
	/// - customByXYWidthHeight: `x`, `y`, `width` and `height` from bound size.
	/// - customByFittingSizeFrame: Fitting size, and `Frame` from fitted size and bound size.
	public enum Individual {
		
		// MARK: Typealias
		
		/// A closure to retrieve `Frame` value from current bound size.
		public typealias SizeToFrame = (CGSize) -> Frame
		
		/// A closure to retrieve `Frame` value from fitted size and current bound size.
		public typealias FittedSizeBoundSizeToFrame = (_ fittedSize: CGSize, _ boundSize: CGSize) -> Frame
		
		/// A closure to retrieve `CGPoint` value from current bound size.
		public typealias SizeToPoint = (CGSize) -> CGPoint
		
		/// A closure to retrieve `CGSize` value from current bound size.
		public typealias SizeToSize = (CGSize) -> CGSize
		
		/// A closure to retrieve `CGFloat` value from current bound size.
		public typealias SizeToFloat = (CGSize) -> CGFloat
		
		
		// MARK: Cases
		
		case absolute(Frame)
		case relative(Frame)
		
		case insets(UIEdgeInsets)
		
		case customByFrame(frame: SizeToFrame)
		case customByOriginSize(origin: SizeToPoint, size: SizeToSize)
		case customByXYWidthHeight(x: SizeToFloat, y: SizeToFloat, width: SizeToFloat, height: SizeToFloat)
		
		case customByFittingSizeFrame(fittingSize: CGSize, frame: FittedSizeBoundSizeToFrame)
		
	}
	
}
extension Layout.Individual {
	
	fileprivate func getBounds(of frame: Frame, in boundSize: CGSize, _ method: CalculationMethod) -> Bounds {
		
		let frame = method.absoluteFrame(frame, by: boundSize)
		let bounds = frame.bounds(in: boundSize)
		return bounds
		
	}
	
	fileprivate func getBounds(of frame: CGRect, in boundSize: CGSize, _ method: CalculationMethod) -> Bounds {
		
		let frame = method.absoluteFrame(frame, by: boundSize)
		let bounds = frame.bounds(in: boundSize)
		return bounds
		
	}
	
}

extension Layout.Individual {
	
	fileprivate func getBounds(by insets: UIEdgeInsets, in boundSize: CGSize) -> Bounds {
		
		let x = insets.left
		let y = insets.top
		let width = boundSize.width - (insets.left + insets.right)
		let height = boundSize.height - (insets.top + insets.bottom)
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return Bounds(frame: frame)
		
	}
	
}

extension Layout.Individual {
	
	fileprivate func getBounds(of transform: SizeToFrame, in boundSize: CGSize) -> Bounds {
		
		let frame = transform(boundSize)
		let bounds = frame.bounds(in: boundSize)
		
		return bounds
		
	}
	
	fileprivate func getBounds(of originTransform: SizeToPoint, _ sizeTransform: SizeToSize, in boundSize: CGSize) -> Bounds {
		
		let origin = originTransform(boundSize)
		let size = sizeTransform(boundSize)
		let frame = CGRect(origin: origin, size: size)
		let bounds = Bounds(frame: frame)
		
		return bounds
		
	}
	
	fileprivate func getBounds(of xTransform: SizeToFloat, _ yTransform: SizeToFloat, _ widthTransform: SizeToFloat, _ heightTransform: SizeToFloat, in boundSize: CGSize) -> Bounds {
		
		let x = xTransform(boundSize)
		let y = yTransform(boundSize)
		let width = widthTransform(boundSize)
		let height = heightTransform(boundSize)
		let frame = CGRect(x: x, y: y, width: width, height: height)
		let bounds = Bounds(frame: frame)
		
		return bounds
		
	}
	
	fileprivate func getBounds(of transform: FittedSizeBoundSizeToFrame, for view: UIView, thatFits fittingSize: CGSize, in boundSize: CGSize) -> Bounds {
		
		let fittedSize = view.sizeThatFits(fittingSize)
		let frame = transform(fittedSize, boundSize)
		let bounds = frame.bounds(in: boundSize)
		
		return bounds
		
	}
	
}

extension Layout.Individual {
	
	func absoluteBounds(of view: UIView, in boundSize: CGSize) -> Bounds {
		
		switch self {
		case .absolute(let frame):
			return self.getBounds(of: frame, in: boundSize, .absolutely)
			
		case .relative(let frame):
			return self.getBounds(of: frame, in: boundSize, .relatively)
			
		case .insets(let insets):
			return self.getBounds(by: insets, in: boundSize)
			
		case .customByFrame(frame: let frameTransform):
			return self.getBounds(of: frameTransform, in: boundSize)
			
		case .customByOriginSize(origin: let originTransform, size: let sizeTransform):
			return self.getBounds(of: originTransform, sizeTransform, in: boundSize)
			
		case .customByXYWidthHeight(x: let xTransform, y: let yTransform, width: let widthTransform, height: let heightTransform):
			return self.getBounds(of: xTransform, yTransform, widthTransform, heightTransform, in: boundSize)
			
		case .customByFittingSizeFrame(fittingSize: let fittingSize, frame: let frame):
			return self.getBounds(of: frame, for: view, thatFits: fittingSize, in: boundSize)
			
		}
		
	}
	
}
