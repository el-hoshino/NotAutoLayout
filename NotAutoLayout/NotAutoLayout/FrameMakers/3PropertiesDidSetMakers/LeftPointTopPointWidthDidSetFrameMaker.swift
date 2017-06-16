//
//  LeftPointTopPointWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/15.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftPointTopPointWidthDidSetLayoutMaker {
		
	let left: CGFloat
	
	let top: CGFloat
	
	let width: CGFloat
	
}

extension LeftPointTopPointWidthDidSetLayoutMaker: LeftPointPropertyDidSet { }
extension LeftPointTopPointWidthDidSetLayoutMaker: TopPointPropertyDidSet { }
extension LeftPointTopPointWidthDidSetLayoutMaker: WidthPropertyDidSet { }

extension LeftPointTopPointWidthDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> CGRect {
		
		let frame = CGRect(x: self.left, from: .left,
		                  y: self.top, from: .top,
		                  width: self.width,
		                  height: height)
		return frame
		
	}
	
}
