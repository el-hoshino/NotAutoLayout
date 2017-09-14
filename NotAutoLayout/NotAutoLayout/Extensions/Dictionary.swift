//
//  Dictionary.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/19.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Dictionary {
	
	static func + (lhs: Dictionary<Key, Value>, rhs: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
		
		return lhs.appending(rhs)
		
	}
	
}

extension Dictionary {
	
	func appending(_ appending: Dictionary<Key, Value>) -> Dictionary<Key, Value> {
		
		var result = self
		result.append(appending)
		return result
		
	}
	
	mutating func append(_ appending: Dictionary<Key, Value>) {
		
		for pair in appending {
			self[pair.key] = pair.value
		}
		
	}
	
}

extension Dictionary {
	
	func containsKey(_ key: Key) -> Bool {
		return self[key] != nil
	}
	
}
