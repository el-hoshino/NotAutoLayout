//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import NotAutoLayout

let view = LayoutView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
view.backgroundColor = .white
PlaygroundPage.current.liveView = view

typealias LayoutOutput = (condition: LayoutCondition, viewA: LayoutPosition, viewB: LayoutPosition, viewC: LayoutPosition)

let oneThird: CGFloat = 1 / 3

let landscapeLayout: LayoutOutput = {
	let isLandscape: LayoutCondition = { $0.width > $0.height }
	let viewA = LayoutPosition.relative(CGRect(x: 0, y: 0, width: oneThird, height: 1))
	let viewB = LayoutPosition.relative(CGRect(x: oneThird, y: 0, width: oneThird, height: 1))
	let viewC = LayoutPosition.relative(CGRect(x: oneThird * 2, y: 0, width: oneThird, height: 1))
	return (isLandscape, viewA, viewB, viewC)
}()

let otherLayout: LayoutOutput = {
	let condition: LayoutCondition = { _ in true }
	let viewA = LayoutPosition.relative(CGRect(x: 0, y: 0, width: 1, height: oneThird))
	let viewB = LayoutPosition.relative(CGRect(x: 0, y: oneThird, width: 1, height: oneThird))
	let viewC = LayoutPosition.relative(CGRect(x: 0, y: oneThird * 2, width: 1, height: oneThird))
	return (condition, viewA, viewB, viewC)
}()

let labelA: UILabel = {
	let label = UILabel()
	label.backgroundColor = .red
	label.textAlignment = .center
	label.text = "Label A"
	return label
}()

let labelB: UILabel = {
	let label = UILabel()
	label.backgroundColor = .green
	label.textAlignment = .center
	label.text = "Label B"
	return label
}()

let labelC: UILabel = {
	let label = UILabel()
	label.backgroundColor = .blue
	label.textAlignment = .center
	label.text = "Label C"
	return label
}()

let subviewTuples: [SubviewTuple] = {
	
	var viewALayoutMethods: [LayoutMethod] = []
	var viewBLayoutMethods: [LayoutMethod] = []
	var viewCLayoutMethods: [LayoutMethod] = []
	
	do {
		let layout = landscapeLayout
		viewALayoutMethods.append((layout.condition, layout.viewA))
		viewBLayoutMethods.append((layout.condition, layout.viewB))
		viewCLayoutMethods.append((layout.condition, layout.viewC))
	}
	
	do {
		let layout = otherLayout
		viewALayoutMethods.append((layout.condition, layout.viewA))
		viewBLayoutMethods.append((layout.condition, layout.viewB))
		viewCLayoutMethods.append((layout.condition, layout.viewC))
	}
	
	let a: SubviewTuple = (labelA, viewALayoutMethods)
	let b: SubviewTuple = (labelB, viewBLayoutMethods)
	let c: SubviewTuple = (labelC, viewCLayoutMethods)
	
	return [a, b, c]

}()

view.layoutingSubviews = subviewTuples

view.reloadLayoutingSubviews()
view.setNeedsLayout()
