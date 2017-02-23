//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import NotAutoLayout

let view = LayoutView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
view.backgroundColor = .white
PlaygroundPage.current.liveView = view

typealias LayoutOutput = (condition: LayoutCondition, viewA: LayoutPosition, viewB: LayoutPosition, viewC: LayoutPosition)

let oneThird: CGFloat = 1 / 3

let label: UILabel = {
	let label = UILabel()
	label.backgroundColor = .red
	label.textAlignment = .center
	label.text = "Label A"
	view.addSubview(label)
	return label
}()

let position = LayoutPosition.customByXYWidthHeight(x: { $0.width * 0.8 - 10 },
                                                    y: { _ in 10 },
                                                    width: { $0.width * 0.2 },
                                                    height: { $0.width * 0.2 })
view.setConstantPosition(position, for: label)

view.setNeedsLayout()
