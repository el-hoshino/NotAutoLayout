//
//  LayoutIndividualAdditions.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/07/11.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension Layout.Individual {
	
	public typealias Evaluation = (_ boundSize: CGSize) -> CGFloat

}

extension Layout.Individual {
	
	public var additionalEvaluationsRemoved: Layout.Individual {
		return self.settingAdditionalEvaluations([])
	}
	
}

extension Layout.Individual {
	
	public func movingLeft(to left: @escaping (_ boundSize:CGSize) -> CGFloat) -> Layout.Individual {
		let evaluation = FrameAdditionalEvaluation.moveLeftTo(left)
		return self.addingAdditionalEvaluation(evaluation)
	}
	
	public func movingLeft(to left: CGFloat) -> Layout.Individual {
		return self.movingLeft(to: { _ in left })
	}
	
	public func movingCenter(to center: @escaping (_ boundSize: CGSize) -> CGFloat) -> Layout.Individual {
		let evaluation = FrameAdditionalEvaluation.moveCenterTo(center)
		return self.addingAdditionalEvaluation(evaluation)
	}
	
	public func movingCenter(to center: CGFloat) -> Layout.Individual {
		return self.movingCenter(to: { _ in center })
	}
	
}
