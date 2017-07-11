//
//  LayoutControllableLayoutMaking.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/06/16.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	public func makeLayout(_ making: (InitialLayoutMaker) -> Layout.Individual) -> Layout.Individual {
		
		let maker = InitialLayoutMaker(parentView: self.body)
		return making(maker)
		
	}
	
}

extension NotAutoLayoutContainer where Containee: UIView & LayoutControllable {
	
	public func setupSubview(_ subview: UIView, setup: (SubviewSetupWizard<Containee>) -> SubviewSetupWizard<Containee>.Finished) {
		
		let setupWizard = SubviewSetupWizard(parent: self.body, settee: subview)
		let result = setup(setupWizard)
		
		switch result {
		case .success:
			break
		}
		
	}
	
}
