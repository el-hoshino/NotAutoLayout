//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import NotAutoLayout

let baseView = LayoutView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
PlaygroundPage.current.liveView = baseView

let titleView = TitleView()
let contentView = UITableView()
let tabView = TabView()

let titleViewPosition = LayoutPosition
	.customByXYWidthHeight(x: { _ in 0 },
	                       y: { _ in 0 },
	                       width: { $0.width },
	                       height: { _ in 60 })
let contentViewPosition = LayoutPosition
	.customByXYWidthHeight(x: { _ in 0 },
	                       y: { _ in titleView.frame.origin.y + titleView.frame.height },
	                       width: { $0.width },
	                       height: { $0.height - ((titleView.frame.origin.y + titleView.frame.height) + 60) })
let tabViewPosition = LayoutPosition
	.customByXYWidthHeight(x: { _ in 0 },
	                       y: { _ in contentView.frame.origin.y + contentView.frame.height },
	                       width: { $0.width },
	                       height: { _ in 60 })

titleView.backgroundColor = .red
contentView.backgroundColor = .green
tabView.backgroundColor = .blue

baseView.addSubview(titleView, withAssociatedConstantPosition: titleViewPosition)
baseView.addSubview(contentView, withAssociatedConstantPosition: contentViewPosition)
baseView.addSubview(tabView, withAssociatedConstantPosition: tabViewPosition)

titleView.setTitle("Hello NotAutoLayout!")

for i in 0 ..< 10 {
	let tabItem = UIView()
	tabItem.backgroundColor = .brown
	tabView.addSubview(tabItem, withAssociatedLayoutMethods: tabView.makeTabItemLayoutMethods(at: i))
}

baseView.setNeedsLayout()
tabView.updateContentSize()
