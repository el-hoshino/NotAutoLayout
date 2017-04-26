//
//  LayoutIndividual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/18.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Layout.Individual {
	
	fileprivate func getPosition(of frame: Frame, in boundSize: CGSize, _ method: PositioningMethod) -> Bounds {
		
		let frame = method.absoluteFrame(frame, by: boundSize)
		let bounds = frame.bounds(in: boundSize)
		return bounds
		
	}
	
	fileprivate func getPosition(of frame: CGRect, in boundSize: CGSize, _ method: PositioningMethod) -> Bounds {
		
		let frame = method.absoluteFrame(frame, by: boundSize)
		let bounds = frame.bounds(in: boundSize)
		return bounds
		
	}
	
}

extension Layout.Individual {
	
	fileprivate func getPosition(by insets: UIEdgeInsets, in boundSize: CGSize) -> Bounds {
		
		let x = insets.left
		let y = insets.top
		let width = boundSize.width - (insets.left + insets.right)
		let height = boundSize.height - (insets.top + insets.bottom)
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return Bounds(frame: frame)
		
	}
	
}

extension Layout.Individual {
	
	fileprivate func getPosition(of transform: SizeToFrame, in boundSize: CGSize) -> Bounds {
		
		let frame = transform(boundSize)
		let bounds = frame.bounds(in: boundSize)
		
		return bounds
		
	}
	
	fileprivate func getPosition(of originTransform: SizeToPoint, _ sizeTransform: SizeToSize, in boundSize: CGSize) -> Bounds {
		
		let origin = originTransform(boundSize)
		let size = sizeTransform(boundSize)
		let frame = CGRect(origin: origin, size: size)
		let bounds = Bounds(frame: frame)
		
		return bounds
		
	}
	
	fileprivate func getPosition(of xTransform: SizeToFloat, _ yTransform: SizeToFloat, _ widthTransform: SizeToFloat, _ heightTransform: SizeToFloat, in boundSize: CGSize) -> Bounds {
		
		let x = xTransform(boundSize)
		let y = yTransform(boundSize)
		let width = widthTransform(boundSize)
		let height = heightTransform(boundSize)
		let frame = CGRect(x: x, y: y, width: width, height: height)
		let bounds = Bounds(frame: frame)
		
		return bounds
		
	}
	
	fileprivate func getPosition(of transform: FitSizeBoundSizeToFrame, for view: UIView, thatFits fittingSize: CGSize, in boundSize: CGSize) -> Bounds {
		
		let fitSize = view.sizeThatFits(fittingSize)
		let frame = transform(fitSize, boundSize)
		let bounds = frame.bounds(in: boundSize)
		
		return bounds
		
	}
	
}

extension Layout.Individual {
	
	func absolutePosition(of view: UIView, in boundSize: CGSize) -> Bounds {
		
		switch self {
		case .absolute(let frame):
			return self.getPosition(of: frame, in: boundSize, .absolutely)
			
		case .relative(let frame):
			return self.getPosition(of: frame, in: boundSize, .relatively)
			
		case .insets(let insets):
			return self.getPosition(by: insets, in: boundSize)
			
		case .customByFrame(frame: let frameTransform):
			return self.getPosition(of: frameTransform, in: boundSize)
			
		case .customByOriginSize(origin: let originTransform, size: let sizeTransform):
			return self.getPosition(of: originTransform, sizeTransform, in: boundSize)
			
		case .customByXYWidthHeight(x: let xTransform, y: let yTransform, width: let widthTransform, height: let heightTransform):
			return self.getPosition(of: xTransform, yTransform, widthTransform, heightTransform, in: boundSize)
			
		case .customFitsSizeByFrame(fittingSize: let fittingSize, frame: let frame):
			return self.getPosition(of: frame, for: view, thatFits: fittingSize, in: boundSize)
			
		}
		
	}
	
}
