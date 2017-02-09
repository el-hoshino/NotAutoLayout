//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import NotAutoLayout

var str = "Hello, playground"

let view = LayoutView(frame: CGRect(x: 0, y: 0, width: 960, height: 640))
view.backgroundColor = .white
PlaygroundPage.current.liveView = view

let isSmallSize: (CGSize) -> Bool = { $0.width < 540 || $0.height < 640 }

let viewA = UIView()
viewA.backgroundColor = .red

let viewACondition1: LayoutView.Condition = isSmallSize
let viewAPosition1 = LayoutView.Position.relative(CGRect(x: 0, y: 0, width: 0.5, height: 0.7))
let viewALayoutMethod1: LayoutView.LayoutMethod = (viewACondition1, viewAPosition1)

let viewACondition2: LayoutView.Condition = { _ in true }
let viewAPosition2 = LayoutView.Position.absolute(CGRect(x: 0, y: 0, width: 270, height: 448))
let viewALayoutMethod2: LayoutView.LayoutMethod = (viewACondition2, viewAPosition2)

let viewATuple: LayoutView.SubviewTuple = (viewA, [viewALayoutMethod1, viewALayoutMethod2])


let viewB = UIView()
viewB.backgroundColor = .green

let viewBCondition1: LayoutView.Condition = isSmallSize
let viewBPosition1 = LayoutView.Position.relative(CGRect(x: 0.5, y: 0, width: 0.5, height: 0.7))
let viewBLayoutMethod1: LayoutView.LayoutMethod = (viewBCondition1, viewBPosition1)

let viewBCondition2: LayoutView.Condition = { _ in true }
let viewBPosition2 = LayoutView.Position.absolute(CGRect(x: 270, y: 0, width: 270, height: 448))
let viewBLayoutMethod2: LayoutView.LayoutMethod = (viewBCondition2, viewBPosition2)

let viewBTuple: LayoutView.SubviewTuple = (viewB, [viewBLayoutMethod1, viewBLayoutMethod2])


let viewC = UIView()
viewC.backgroundColor = .blue

let viewCCondition1: LayoutView.Condition = isSmallSize
let viewCPosition1 = LayoutView.Position.relative(CGRect(x: 0, y: 0.7, width: 1, height: 0.3))
let viewCLayoutMethod1: LayoutView.LayoutMethod = (viewCCondition1, viewCPosition1)

let viewCCondition2: LayoutView.Condition = { _ in true }
let viewCPosition2 = LayoutView.Position.custom { CGRect(x: (540 - (min($0.width, $0.height) * 0.3)) / 2, y: $0.height * 0.7, width: min($0.width, $0.height) * 0.3, height: min($0.width, $0.height) * 0.3) }
let viewCLayoutMethod2: LayoutView.LayoutMethod = (viewCCondition2, viewCPosition2)

let viewCTuple: LayoutView.SubviewTuple = (viewC, [viewCLayoutMethod1, viewCLayoutMethod2])


view.layoutingSubviews = [viewATuple, viewBTuple, viewCTuple]

view.reloadLayoutingSubviews()
view.setNeedsLayout()
