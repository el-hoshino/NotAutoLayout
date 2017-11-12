//
//  LeftRightTopDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct LeftRightTopDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let left: LayoutElement.Line
	
	let right: LayoutElement.Line
	
	let top: LayoutElement.Line
	
}

extension LeftRightTopDidSetLayoutMaker {
	
	private func makeFrame(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let width = right - x
		let height = bottom - y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(left: CGFloat, right: CGFloat, top: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = top
		let width = right - x
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension LeftRightTopDidSetLayoutMaker: LayoutMakerCanSetBottomToMakeLayoutEditorType {
	
	public typealias WillSetBottomMaker = LayoutEditor
	
	public func makeFrame(bottom: LayoutElement.Line, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let left = self.left.evaluated(from: parameter)
		let right = self.right.evaluated(from: parameter)
		let top = self.right.evaluated(from: parameter)
		let bottom = bottom.evaluated(from: parameter)
		return self.makeFrame(left: left, right: right, top: top, bottom: bottom)
	}
	
}

extension LeftRightTopDidSetLayoutMaker {
	
	public func setHeight(to height: CGFloat) -> LayoutEditor {
		
		return self.setHeight(by: { _ in height })
		
	}
	
	public func setHeight(by height: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> LayoutEditor {
		
		let layout = Layout(frame: { (parameter) -> CGRect in
			let left = self.left.evaluated(from: parameter)
			let right = self.right.evaluated(from: parameter)
			let top = self.top.evaluated(from: parameter)
			let height = height(parameter)
			let frame = self.makeFrame(left: left, right: right, top: top, height: height)

			return frame
			
		})
        
        let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
	public func fitHeight(by fittingHeight: CGFloat = 0) -> LayoutEditor {
		
		let layout = Layout(frame: { (fitting, boundSize) -> CGRect in
			
			let left = self.left.evaluated(from: boundSize)
			let right = self.right.evaluated(from: boundSize)
			let top = self.top.evaluated(from: boundSize)
			let width = right - left
			let fittingSize = CGSize(width: width, height: fittingHeight)
			let height = fitting(fittingSize).height
			let frame = self.makeFrame(left: left, right: right, top: top, height: height)

			return frame
			
		})
        
        let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}
