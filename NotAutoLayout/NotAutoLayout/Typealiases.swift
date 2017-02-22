//
//  Typealiases.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/02/22.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public typealias LayoutCondition = (_ canvasSize: CGSize) -> Bool
public typealias LayoutMethod = (condition: LayoutCondition, position: LayoutPosition)
