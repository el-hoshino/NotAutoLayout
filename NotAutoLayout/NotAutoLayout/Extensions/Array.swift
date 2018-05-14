//
//  Array.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/19.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Array where Element: Numeric {
	
	func sum(ofFirst n: Int) -> Element {
		
		let n = Swift.min(n, self.count)
		let droppingN = self.count - n
		let droppedArray = self.dropLast(droppingN)
		
		let sum = droppedArray.reduce(0, (+))
		
		return sum
		
	}
	
}
