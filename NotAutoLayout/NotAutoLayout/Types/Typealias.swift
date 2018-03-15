//
//  Typealias.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/13.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public typealias IndividualFrameCalculationParameters = (targetView: UIView, property: ViewLayoutGuides)

public typealias IndividualFrameCalculation = (IndividualFrameCalculationParameters) -> CGRect

public typealias SequentialFrameCalculationParameters = (targetViews: [UIView], property: ViewLayoutGuides)

public typealias SequentialFrameCalculation = (SequentialFrameCalculationParameters) -> [CGRect]
