//
//  Dictionary.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/19.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Dictionary {
	
	func containsKey(_ key: Key) -> Bool {
		return self[key] != nil
	}
	
}
