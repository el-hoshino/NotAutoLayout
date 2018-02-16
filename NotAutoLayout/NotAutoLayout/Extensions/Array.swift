//
//  Array.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/19.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Array {
	
	func last(before index: Index, where condition: (Element) throws -> Bool) rethrows -> Element? {
		
		let index = Swift.min(index, self.endIndex)
		
		for item in self[self.startIndex ..< index].reversed() {
			
			if try condition(item) == true {
				return item
			}
			
		}
		
		return nil
		
	}
	
}

extension Array {
	
	func forEachPair(_ body: (_ previous: Element?, _ current: Element) throws -> Void) rethrows {
		
		var iterator = self.makeIterator()
		var previous: Element? = nil
		
		func postProcess(previous: inout Element?, current: Element) {
			
			previous = current
			
		}
		
		while let next = iterator.next() {
			
			try body(previous, next)
			
			postProcess(previous: &previous, current: next)
			
		}
		
	}
	
}

extension Array {
	
	func forEachCell(underColsPerRow colsPerRow: Int, _ body: (_ previousCol: Element?, _ previousRow: Element?, _ current: Element) throws -> Void) rethrows {
		
		var iterator = self.makeIterator()
		var previousRowIterator: Iterator = self.makeIterator()
		
		var currentIndex = 0
		var previousRow: Element? = nil
		var previousCol: Element? = nil
		
		func postProcess(previousCol: inout Element?, previousRow: inout Element?, current: Element) {
			
			currentIndex += 1
			
			if currentIndex % colsPerRow == 0 {
				previousCol = nil
				
			} else {
				previousCol = current
			}
			
			if currentIndex >= colsPerRow {
				previousRow = previousRowIterator.next()
			}
			
		}
		
		while let next = iterator.next() {
			
			try body(previousCol, previousRow, next)
			
			postProcess(previousCol: &previousCol, previousRow: &previousRow, current: next)
			
		}
		
	}
	
}

extension Array {
	
	mutating func mutatingForEach(_ body: (inout Element) throws -> Void) rethrows {
		
		for index in self.indices {
			try body(&self[index])
		}
		
	}
	
}

extension Array where Element: Numeric {
	
	func sum(ofFirst n: Int) -> Element {
		
		let n = Swift.min(n, self.count)
		let droppingN = self.count - n
		let droppedArray = self.dropLast(droppingN)
		
		let sum = droppedArray.reduce(0, (+))
		
		return sum
		
	}
	
}
