//
//  Condition.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

/// A closure of `(CGSize) -> Bool`, used in `LayoutMethod` to determine which `Layout` to use. `(CGSize)` is given by the bound size of current view.
public typealias Condition = (_ boundSize: CGSize) -> Bool
