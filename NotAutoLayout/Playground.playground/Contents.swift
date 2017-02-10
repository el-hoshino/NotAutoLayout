//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import NotAutoLayout

var str = "Hello, playground"

let view = LayoutView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
view.backgroundColor = .white
PlaygroundPage.current.liveView = view

typealias LayoutOutput = (condition: LayoutView.Condition, viewA: LayoutView.Position, viewB: LayoutView.Position, viewC: LayoutView.Position)

let oneThird: CGFloat = 1 / 3

let landscapeLayout: LayoutOutput = {
	let isLandscape: LayoutView.Condition = { $0.width > $0.height }
	let viewA = LayoutView.Position.relative(CGRect(x: 0, y: 0, width: oneThird, height: 1))
	let viewB = LayoutView.Position.relative(CGRect(x: oneThird, y: 0, width: oneThird, height: 1))
	let viewC = LayoutView.Position.relative(CGRect(x: oneThird * 2, y: 0, width: oneThird, height: 1))
	return (isLandscape, viewA, viewB, viewC)
}()

let otherLayout: LayoutOutput = {
	let condition: LayoutView.Condition = { _ in true }
	let viewA = LayoutView.Position.relative(CGRect(x: 0, y: 0, width: 1, height: oneThird))
	let viewB = LayoutView.Position.relative(CGRect(x: 0, y: oneThird, width: 1, height: oneThird))
	let viewC = LayoutView.Position.relative(CGRect(x: 0, y: oneThird * 2, width: 1, height: oneThird))
	return (condition, viewA, viewB, viewC)
}()

let viewA = UIView()
viewA.backgroundColor = .red

let viewB = UIView()
viewB.backgroundColor = .green

let viewC = UIView()
viewC.backgroundColor = .blue

let subviewTuples: [LayoutView.SubviewTuple] = {
	
	var viewALayoutMethods: [LayoutView.LayoutMethod] = []
	var viewBLayoutMethods: [LayoutView.LayoutMethod] = []
	var viewCLayoutMethods: [LayoutView.LayoutMethod] = []
	
	do {
		let layout = landscapeLayout
		let viewALayout: LayoutView.LayoutMethod = (layout.condition, layout.viewA)
		let viewBLayout: LayoutView.LayoutMethod = (layout.condition, layout.viewB)
		let viewCLayout: LayoutView.LayoutMethod = (layout.condition, layout.viewC)
		viewALayoutMethods.append(viewALayout)
		viewBLayoutMethods.append(viewBLayout)
		viewCLayoutMethods.append(viewCLayout)
	}
	
	do {
		let layout = otherLayout
		let viewALayout: LayoutView.LayoutMethod = (layout.condition, layout.viewA)
		let viewBLayout: LayoutView.LayoutMethod = (layout.condition, layout.viewB)
		let viewCLayout: LayoutView.LayoutMethod = (layout.condition, layout.viewC)
		viewALayoutMethods.append(viewALayout)
		viewBLayoutMethods.append(viewBLayout)
		viewCLayoutMethods.append(viewCLayout)
	}
	
	let a: LayoutView.SubviewTuple = (viewA, viewALayoutMethods)
	let b: LayoutView.SubviewTuple = (viewB, viewBLayoutMethods)
	let c: LayoutView.SubviewTuple = (viewC, viewCLayoutMethods)
	
	return [a, b, c]

}()

view.layoutingSubviews = subviewTuples

view.reloadLayoutingSubviews()
view.setNeedsLayout()
