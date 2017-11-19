//
//  CGSize.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/07/05.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension CGSize {
	
	var halfWidth: CGFloat {
		return self.width / 2
	}
	
	var halfHeight: CGFloat {
		return self.height / 2
	}
	
}

extension CGSize {
	
	var ratio: CGFloat {
		return self.width / self.height
	}
	
	static func makeSize(usingHeightIn canvasSize: CGSize, with ratio: CGFloat) -> CGSize {
		
		guard ratio.isFinite else {
			return CGSize(width: .greatestFiniteMagnitude, height: canvasSize.height)
		}
		
		let height = canvasSize.height
		let width = height * ratio
		let size = CGSize(width: width, height: height)
		
		return size
		
	}
	
	static func makeSize(usingWidthIn canvasSize: CGSize, with ratio: CGFloat) -> CGSize {
		
		guard ratio.isNonZero else {
			return CGSize(width: canvasSize.width, height: .greatestFiniteMagnitude)
		}
		
		let width = canvasSize.width
		let height = width / ratio
		let size = CGSize(width: width, height: height)
		
		return size
		
	}
	
	static func aspectFitSize(in canvasSize: CGSize, with ratio: CGFloat) -> CGSize {
		
		switch ratio > canvasSize.ratio {
		case true:
			return makeSize(usingWidthIn: canvasSize, with: ratio)
			
		case false:
			return makeSize(usingHeightIn: canvasSize, with: ratio)
		}
		
	}
	
	static func aspectFillSize(in canvasSize: CGSize, with ratio: CGFloat) -> CGSize {
		
		switch ratio < canvasSize.ratio {
		case true:
			return makeSize(usingWidthIn: canvasSize, with: ratio)
			
		case false:
			return makeSize(usingHeightIn: canvasSize, with: ratio)
		}
		
	}
	
}
