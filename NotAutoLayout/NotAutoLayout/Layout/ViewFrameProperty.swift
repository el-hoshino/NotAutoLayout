//
//  ViewFrameProperty.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/13.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

private enum SafeAreaGuideBox {
    case none
    @available(iOS 11.0, *) case some(LazyBox<LayoutGuide>)
}

private func makeGuide(direction: UIUserInterfaceLayoutDirection?, rect: Rect?) -> LayoutGuide {
    
    guard let direction = direction, let rect = rect else {
        return .empty
    }
    
    let guide = LayoutGuide.init(uiLayoutDirection: direction, rect: rect)
    
    return guide
    
}

public struct ViewFrameProperty {
	
	private(set) weak var parentView: UIView?
    
    private let boundsGuideBox: LazyBox<LayoutGuide>
    private let layoutMarginsGuideBox: LazyBox<LayoutGuide>
    private let readableGuideBox: LazyBox<LayoutGuide>
    private let safeAreaGuideBox: SafeAreaGuideBox
    
    init(parentView: UIView) {
        
        self.parentView = parentView
        
        self.boundsGuideBox = .init { [weak parentView] in
            makeGuide(direction: parentView?.currentDirection, rect: parentView?.boundsRect)
        }
        
        self.layoutMarginsGuideBox = .init { [weak parentView] in
            makeGuide(direction: parentView?.currentDirection, rect: parentView?.layoutMarginsRect)
        }
        
        self.readableGuideBox = .init { [weak parentView] in
            makeGuide(direction: parentView?.currentDirection, rect: parentView?.readableRect)
        }
        
        self.safeAreaGuideBox = {
            if #available(iOS 11.0, *) {
                return .some(.init { [weak parentView] in makeGuide(direction: parentView?.currentDirection, rect: parentView?.safeAreaRect) })
            } else {
                return .none
            }
        }()
        
    }
	
}

extension ViewFrameProperty: LayoutGuideRepresentable {
    
    public var layoutGuide: LayoutGuide {
        return self.boundsGuide
    }
    
}

extension ViewFrameProperty {
    
    public var boundsGuide: LayoutGuide {
        return self.boundsGuideBox.value
    }
    
    public var layoutMarginsGuide: LayoutGuide {
        return self.layoutMarginsGuideBox.value
    }
    
    public var readableGuide: LayoutGuide {
        return self.readableGuideBox.value
    }
    
    @available(iOS 11.0, *)
    public var safeAreaGuide: LayoutGuide {
        guard case .some(let guide) = self.safeAreaGuideBox else {
            preconditionFailure("safeAreaGuide should be able to access on iOS over 11.0")
        }
        return guide.value
    }
    
}

extension ViewFrameProperty {
    
    public var layoutMargins: UIEdgeInsets {
        return self.parentView?.layoutMargins ?? .zero
    }
    
    @available(iOS 11.0, *)
    public var safeAreaInsets: UIEdgeInsets {
        return self.parentView?.safeAreaInsets ?? .zero
    }
    
}

extension ViewFrameProperty {
	
	func size(for view: UIView, thatFits fittingSize: CGSize) -> CGSize {
		
		let fittedSize = view.sizeThatFits(fittingSize)
		
		return fittedSize
		
	}
	
}

extension ViewFrameProperty {
	
	func evaluateSize(from calculation: (ViewFrameProperty) -> CGSize) -> CGSize {
		
		return calculation(self)
		
	}
	
	func evaluateSize(for view: UIView, from aspect: LayoutElement.Size.AspectSizing) -> CGSize {
		
		let canvasSize = { (safeAreaOnly: Bool) -> CGSize in
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
			return CGSize.aspectFitSize(in: canvasSize, with: targetRatio)
			
		case .fill, .safeAreaFill:
			return CGSize.aspectFillSize(in: canvasSize, with: targetRatio)
		}
		
	}
	
}

private extension UIView {
    
    var currentDirection: UIUserInterfaceLayoutDirection {
        
        if #available(iOS 10.0, *) {
            return UIView.userInterfaceLayoutDirection(for: self.semanticContentAttribute, relativeTo: self.effectiveUserInterfaceLayoutDirection)
            
        } else {
            return UIView.userInterfaceLayoutDirection(for: self.semanticContentAttribute)
        }
        
    }
    
    var boundsRect: Rect {
        return Rect(from: self.bounds)
    }
    
    var layoutMarginsRect: Rect {
        let frame = self.bounds.frame(inside: self.layoutMargins)
        return Rect(from: frame)
    }
    
    var readableRect: Rect {
        // FIXME: Get this property without Auto Layout UILayoutGuide
        let frame = self.readableContentGuide.layoutFrame
        return Rect(from: frame)
    }
    
    @available(iOS 11.0, *)
    var safeAreaRect: Rect {
        let frame = self.bounds.frame(inside: self.safeAreaInsets)
        return Rect(from: frame)
    }
    
}
