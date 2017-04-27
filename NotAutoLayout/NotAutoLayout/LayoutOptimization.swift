//
//  LayoutOptimization.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/18.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

/// Optimization method used for layouting.
///
/// - none: Normal layout optimization with nothing special.
/// - sequence: Stores the previous subview which may be helpful for sequential layout.
/// - matrix: Stores the previous subview in column, the previous subview in row and the column size, which may be helpful for matrical layout.
public enum LayoutOptimization {
	case none
	case sequence
	case matrix(colsPerRow: Int)
}
