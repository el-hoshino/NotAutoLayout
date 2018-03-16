//
//  ViewLayoutGuides.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/13.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct ViewLayoutGuides {
	
	private(set) weak var parentView: UIView?
    
    init(parentView: UIView) {
        
        self.parentView = parentView
        
    }
	
}

extension ViewLayoutGuides {
	
	private func makeGuide(directionGetter: @escaping () -> UIUserInterfaceLayoutDirection?, rect: Rect?) -> Guide {
		
		guard let rect = rect else {
			return .empty
		}
		
		let guide = Guide(directionGetter: directionGetter, rect: rect)
		
		return guide
		
	}
	
}

extension ViewLayoutGuides: LayoutGuideRepresentable {
    
    public var layoutGuide: Guide {
        return self.boundsGuide
    }
    
}

extension ViewLayoutGuides {
    
    public var boundsGuide: Guide {
		return self.makeGuide(directionGetter: { [weak parentView] in parentView?.currentDirection }, rect: self.parentView?.boundsRect)
    }
    
    public var layoutMarginsGuide: Guide {
		return self.makeGuide(directionGetter: { [weak parentView] in parentView?.currentDirection }, rect: self.parentView?.layoutMarginsRect)
    }
    
    public var readableGuide: Guide {
		return self.makeGuide(directionGetter: { [weak parentView] in parentView?.currentDirection }, rect: self.parentView?.readableRect)
    }
    
    @available(iOS 11.0, *)
    public var safeAreaGuide: Guide {
		return self.makeGuide(directionGetter: { [weak parentView] in parentView?.currentDirection }, rect: self.parentView?.safeAreaRect)
    }
    
}

extension ViewLayoutGuides {
    
    public var layoutMargins: Insets {
        return (self.parentView?.layoutMargins).map({ Insets($0) }) ?? .zero
    }
    
    @available(iOS 11.0, *)
    public var safeAreaInsets: Insets {
        return (self.parentView?.safeAreaInsets).map({ Insets($0) }) ?? .zero
    }
    
}

extension ViewLayoutGuides {
	
	func size(for view: UIView, thatFits fittingSize: Size) -> Size {
		
		let fittedSize = view.sizeThatFits(fittingSize)
		
		return fittedSize
		
	}
	
}

extension ViewLayoutGuides {
	
	func evaluateSize(from calculation: (ViewLayoutGuides) -> Size) -> Size {
		
		return calculation(self)
		
	}
	
	func evaluateSize(for view: UIView, from aspect: LayoutElement.Size.AspectSizing) -> Size {
		
		let canvasSize = { (safeAreaOnly: Bool) -> Size in
			switch safeAreaOnly {
			case true:
				if #available(iOS 11.0, *) {
					return self.safeAreaGuide.size
				} else {
					fallthrough
				}
				
			case false:
				return self.boundsGuide.size
			}
		}(aspect.safeAreaOnly)
		
		let targetRatio = aspect.ratio ?? { (targetView: UIView?) in
			return targetView?.sizeThatFits(.zero).ratio
		}(view) ?? 1
		
		guard targetRatio.isNaN == false,
			canvasSize.ratio.isNaN == false
		else {
			return canvasSize
		}
		
		switch aspect {
		case .fit, .safeAreaFit:
			return Size.aspectFitSize(in: canvasSize, with: targetRatio)
			
		case .fill, .safeAreaFill:
			return Size.aspectFillSize(in: canvasSize, with: targetRatio)
		}
		
	}
	
}
