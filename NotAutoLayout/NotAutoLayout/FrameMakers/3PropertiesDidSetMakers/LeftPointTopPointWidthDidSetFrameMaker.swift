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
	
	public func setHeight(to height: CGFloat) -> Layout.Individual {
		
		let frame = CGRect(x: self.left,
		                   y: self.top,
		                  width: self.width,
		                  height: height)
		let layout = Layout.Individual.makeAbsolute(from: frame)
		
		return layout
		
	}
	
}
