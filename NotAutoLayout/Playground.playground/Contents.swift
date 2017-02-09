//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import NotAutoLayout

var str = "Hello, playground"

let view = LayoutView(frame: CGRect(x: 0, y: 0, width: 720, height: 640))
view.backgroundColor = .white
PlaygroundPage.current.liveView = view

let isSmallSize: (CGSize) -> Bool = { $0.width < 540 || $0.height < 640 }

let viewA = UIView()
viewA.backgroundColor = .blue

let viewACondition1: LayoutView.Condition = isSmallSize
let viewAPosition1 = LayoutView.Position.relative(CGRect(x: 0, y: 0, width: 0.5, height: 1))
let viewALayoutMethod1: LayoutView.LayoutMethod = (viewACondition1, viewAPosition1)

let viewACondition2: LayoutView.Condition = { _ in true }
let viewAPosition2 = LayoutView.Position.absolute(CGRect(x: 0, y: 0, width: 270, height: 640))
let viewALayoutMethod2: LayoutView.LayoutMethod = (viewACondition2, viewAPosition2)
let viewATuple: LayoutView.SubviewTuple = (viewA, [viewALayoutMethod1, viewALayoutMethod2])

let viewB = UIView()
viewB.backgroundColor = .red

let viewBCondition1: LayoutView.Condition = isSmallSize
let viewBPosition1 = LayoutView.Position.relative(CGRect(x: 0.5, y: 0, width: 0.5, height: 1))
let viewBLayoutMethod1: LayoutView.LayoutMethod = (viewBCondition1, viewBPosition1)

let viewBCondition2: LayoutView.Condition = { _ in true }
let viewBPosition2 = LayoutView.Position.absolute(CGRect(x: 270, y: 0, width: 270, height: 640))
let viewBLayoutMethod2: LayoutView.LayoutMethod = (viewBCondition2, viewBPosition2)
let viewBTuple: LayoutView.SubviewTuple = (viewB, [viewBLayoutMethod1, viewBLayoutMethod2])

view.layoutingSubviews = [viewATuple, viewBTuple]

view.reloadLayoutingSubviews()
view.setNeedsLayout()
