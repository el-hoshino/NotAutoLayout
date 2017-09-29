//
//  LayoutControlParameter.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/13.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LayoutControlParameter {
	
	public let boundSize: CGSize
	
	public let safeAreaInsets: UIEdgeInsets
	
}

extension LayoutControlParameter {
	
	static func initialize(from view: UIView) -> LayoutControlParameter {
		
		let boundSize = view.bounds.size
		let safeAreaInsets: UIEdgeInsets = {
			if #available(iOS 11.0, *) {
				return view.safeAreaInsets
			} else {
				return .zero
			}
		}()
		
		let parameter = LayoutControlParameter(boundSize: boundSize, safeAreaInsets: safeAreaInsets)
		
		return parameter
		
	}
	
}

extension LayoutControlParameter {
	
	public var boundWidth: CGFloat {
		return self.boundSize.width
	}
	
	public var boundHeight: CGFloat {
		return self.boundSize.height
	}
	
}

extension LayoutControlParameter {
	
	public var topSafeAreaInset: CGFloat {
		return self.safeAreaInsets.top
	}
	
	public var bottomSafeAreaInset: CGFloat {
		return self.safeAreaInsets.bottom
	}
	
	public var leftSafeAreaInset: CGFloat {
		return self.safeAreaInsets.left
	}
	
	public var rightSafeAreaInset: CGFloat {
		return self.safeAreaInsets.right
	}
	
}

extension LayoutControlParameter {
	
	public var safeWidth: CGFloat {
		return self.boundWidth - self.safeAreaInsets.width
	}
	
	public var safeHeight: CGFloat {
		return self.boundHeight - self.safeAreaInsets.height
	}
	
	public var safeOrigin: CGPoint {
		return CGPoint(x: self.leftSafeAreaInset, y: self.topSafeAreaInset)
	}
	
	public var safeSize: CGSize {
		return CGSize(width: self.safeWidth, height: self.safeHeight)
	}
	
}

extension LayoutControlParameter {
	
	public func boundsWithZeroOrigin() -> CGRect {
		
		let boundsWithZeroOrigin = CGRect(origin: .zero, size: self.boundSize)
		
		return boundsWithZeroOrigin
		
	}
	
	@available(iOS 11.0, *)
	public func boundsWithZeroOrigin(safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> CGRect {
		
		let boundsWithZeroOrigin = CGRect(origin: .zero, size: self.boundSize)
		
		switch shouldOnlyIncludeSafeArea {
		case true:
			return boundsWithZeroOrigin.inside(self.safeAreaInsets)
			
		case false:
			return boundsWithZeroOrigin
		}
		
	}
	
}
