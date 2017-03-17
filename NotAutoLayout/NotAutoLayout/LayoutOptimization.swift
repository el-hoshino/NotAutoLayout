//
//  LayoutOptimization.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/18.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public enum LayoutOptimization {
	case none
	case sequence
	case matrix(colsPerRow: Int)
}
