//
//  MiddleCenterWidthDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct MiddleCenterWidthDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let middleCenter: LayoutElement.Point
	
	let width: LayoutElement.Length
	
}

extension MiddleCenterWidthDidSetLayoutMaker {
	
	private func makeFrame(middleCenter: CGPoint, width: CGFloat, height: CGFloat) -> CGRect {
		
		let x = middleCenter.x - width.half
		let y = middleCenter.y - height.half
		let size = CGSize(width: width, height: height)
		let origin = CGPoint(x: x, y: y)
		let frame = CGRect(origin: origin, size: size)
		
		return frame
		
	}
	
}

//extension MiddleCenterWidthDidSetLayoutMaker {
//	
//	public func setHeight(to height: CGFloat) -> LayoutEditor {
//		
//		return self.setHeight(by: { _ in height })
//		
//	}
//	
//	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
//		
//		let layout = Layout(frame: { (parameter) -> CGRect in
//			let middleCenter = self.middleCenter.evaluated(from: parameter)
//			let width = self.width.evaluated(from: parameter)
//			let height = height(parameter)
//			let frame = self.makeFrame(middleCenter: middleCenter, width: width, height: height)
//			
//			return frame
//			
//		})
//		
//		let editor = LayoutEditor(layout)
//		
//		return editor
//		
//	}
//	
//	public func fitHeight(by fittingHeight: CGFloat = 0) -> LayoutEditor {
//		
//		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
//			
//			let middleCenter = self.middleCenter.evaluated(from: boundSize)
//			let width = self.width.evaluated(from: boundSize)
//			let fittingSize = CGSize(width: width, height: fittingHeight)
//			let height = fitting(fittingSize).height
//			let frame = self.makeFrame(middleCenter: middleCenter, width: width, height: height)
//			
//			return frame
//			
//		})
//		
//		let editor = LayoutEditor(layout)
//		
//		return editor
//		
//	}
//	
//}

