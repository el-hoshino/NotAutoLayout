//
//  Calculations.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/07/05.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

func + (lhs: CGPoint, rhs: CGVector) -> CGPoint {
	
	let result = CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
	return result
	
}

func += (lhs: inout CGPoint, rhs: CGVector) {
	
	lhs = lhs + rhs
	
}

func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	
	let result = CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
	return result
	
}

func += (lhs: inout CGPoint, rhs: CGPoint) {
	
	lhs = lhs + rhs
	
}

func + (lhs: CGSize, rhs: CGSize) -> CGSize {
	
	let result = CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
	return result
	
}

func += (lhs: inout CGSize, rhs: CGSize) {
	
	lhs = lhs + rhs
	
}

func - (lhs: CGPoint, rhs: CGVector) -> CGPoint {
	
	let result = CGPoint(x: lhs.x - rhs.dx, y: lhs.y - rhs.dy)
	return result
	
}

func -= (lhs: inout CGPoint, rhs: CGVector) {
	
	lhs = lhs - rhs
	
}

func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
	
	let result = CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
	return result
	
}

func -= (lhs: inout CGPoint, rhs: CGPoint) {
	
	lhs = lhs - rhs
	
}

func - (lhs: CGSize, rhs: CGSize) -> CGSize {
	
	let result = CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
	return result
	
}

func -= (lhs: inout CGSize, rhs: CGSize) {
	
	lhs = lhs - rhs
	
}
