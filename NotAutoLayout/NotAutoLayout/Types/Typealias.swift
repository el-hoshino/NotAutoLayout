//
//  Typealias.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2018/02/13.
//  Copyright © 2018年 史翔新. All rights reserved.
//

import Foundation

public typealias IndividualFrameCalculationParameters<ParentView: UIView> = (targetView: UIView, property: ViewFrameProperty<ParentView>)

public typealias IndividualFrameCalculation<ParentView: UIView> = (IndividualFrameCalculationParameters<ParentView>) -> CGRect

public typealias SequentialFrameCalculationParameters<ParentView: UIView> = (targetViews: [UIView], property: ViewFrameProperty<ParentView>)

public typealias SequentialFrameCalculation<ParentView: UIView> = (SequentialFrameCalculationParameters<ParentView>) -> [CGRect]
