//
//  LazyBox.swift
//  NotAutoLayout
//
//  Created by 史 翔新 on 2018/03/15.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

final class LazyBox <T> {
    
    private let initializer: () -> T
    private(set) lazy var value: T = {
        return self.initializer()
    }()
    
    init(_ initializer: @escaping () -> T) {
        self.initializer = initializer
    }
    
}
