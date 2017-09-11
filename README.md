# NotAutoLayout
[![Platform](https://img.shields.io/badge/platform-ios-blue.svg?style=flat)](https://developer.apple.com/iphone/index.action)
[![Language](https://img.shields.io/badge/language-swift-brightgreen.svg?style=flat)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

NotAutoLayoutView is a framework to help you layout subviews *without* Auto Layout constraints.

Please note that this framework hasn't been widely tested yet, and currently it's for iOS only.

Please open an issue or send me a pull request if you have any problems, better ideas or any other things you want me to know.

## Why NotAutoLayout
Apple introduced Interface Builder and Storyboard to help developers create views visually, which is a very good idea. But after iPhone 5, things changed. There're more and more screen resolutions with different aspect ratios that drives developer crazy. To solve this problem, Apple introduced Auto Layout and Size Classes.

But the problem is, they're just making things more complicated (and that's why they introduced UIStackView and NSGridView, maybe). You have to create dozens of constraints in order to just create a very simple view in the storyboard, which makes the system complicated and hard to debug. In addition, there is no hierarchy for the constraints, which means that you have to manage all those dozens of constraints in one place, which is just not intuitive because we always add many subviews to views, and even more further subviews to subviews, which makes a hierarchy of views.

So, there are some frameworks like [Snapkit](https://github.com/SnapKit/SnapKit) and [PureLayout](https://github.com/PureLayout/PureLayout) to help you create Auto Layout constraints much more easily (which should be Xcode's duty). But there are still some *old school* developers (like me :P) just don't like, or even hate Auto Layout and want to create layout through codes. That's why I created NotAutoLayout framework.

With NotAutoLayout, you don't need to care about anything like constraints or size classes, instead you just need to focus on **where** should I place the element, **how big** should I resize the element, and **which zIndex** should I lay the element on. You can  even create a CSS-style responsive layout with just a couple lines of code. Every layout process done through NotAutoLayout framework is inside the `layoutSubviews()` method, which makes it easier to debug than constraints (Yes you can even put a breaker to get the detailed layout information!).

Also, `LayoutView`s can be nested, which means that you can manage the layout of subviews with hierarchies, just like you manage your subviews with hierarchies.

In addition, you can also subclass the `LayoutView` class, or subclass any other `UIView` class and conform it to `LayoutControllable` protocol, so you can keep the layouts in Views to prevent fat Controllers.

## Requirements
- iOS 8.0+
- Xcode 9.0+
- Swift 4.0+

## Installation
### Use Carthage:
- Download and install [Carthage](https://github.com/Carthage/Carthage#installing-carthage).
- Add the following line to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).
```
github "el-hoshino/NotAutoLayout" ~> 2.0
```
- Run `carthage update`.
- Add the framework to your project.

### Manually
- Download the whole repository.
- Add the NotAutoLayout project file into your project.
- Build the framework.

## Usage
### TL;DR
I wrote a barely practical sample code Playground file, which may help you get the idea. Here's the main source code, and you can find the full sample code inside the project
```swift
import UIKit
import PlaygroundSupport
import NotAutoLayout

let baseView = LayoutView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
PlaygroundPage.current.liveView = baseView

let titleView = TitleView()
let contentView = UITableView()
let tabView = TabView()

let titleViewLayout = Layout
	.makeCustom(x: { _ in 0 },
	            y: { _ in 0 },
	            width: { $0.width },
	            height: { _ in 60 })
let contentViewLayout = Layout
	.makeCustom(x: { _ in 0 },
	            y: { _ in titleView.frame.maxY },
	            width: { $0.width },
	            height: { $0.height - (titleView.frame.maxY + 64) })
let tabViewLayout = Layout
	.makeCustom(x: { _ in 0 },
	            y: { _ in contentView.frame.maxY },
	            width: { $0.width },
	            height: { _ in 64 })

titleView.backgroundColor = .red
contentView.backgroundColor = .green
tabView.backgroundColor = .blue

baseView.addSubview(titleView, constantLayout: titleViewLayout)
baseView.addSubview(contentView, constantLayout: contentViewLayout)
baseView.addSubview(tabView, constantLayout: tabViewLayout)

titleView.setTitle("Hello NotAutoLayout!")

for _ in 0 ..< 10 {
	let tabItem = UIView()
	tabItem.backgroundColor = .brown
	tabView.addSubview(tabItem, layoutMethods: tabView.makeTabItemLayoutMethods())
}

baseView.setNeedsLayout()
tabView.updateContentSize() // You can implement this into a ViewController's viewDidLayoutSubviews() method, which makes more sense if you have a ViewController that holds the tabView.
```
![screenshot](https://raw.githubusercontent.com/el-hoshino/NotAutoLayout/master/README_Resource/PlaygroundSample.png)

### Tell me more
There are basically 2 ways to use NotAutoLayout framework. The easiest one is simply create a `LayoutView` to layout the subviews in it, or you can also choose to subclass `LayoutView` or even subclass any other `UIView` and conform it to `LayoutControllable` protocol.

- Use a `LayoutView`
You can just create an instance of `LayoutView` like any other `UIView` objects through `LayoutView(frame: CGRect)` initializer.

- Subclass a `LayoutView`
You can just subclass a `LayoutView` like subclassing any other `UIView` classes, and you may add subviews as well as layout information for these subviews inside the subclass so you don't need to do it in a `UIViewController`, which may help you prevent a fat Controller.

- Conform other `UIView` subclasses to `LayoutControllable` protocol
Sometimes you may want to create classes other than `LayoutView`'s subclass, like you want to create a `UIImageView`'s subclass. In this case, all you need to do is to store `var layoutInfo: [Hash: [NotAutoLayout.LayoutMethod]]` dictionary, `var orderInfo: [Hash: Int]` dictionary and `var zIndexInfo: [Hash: Int]` dictionary (`Hash` here is a typealias of `Int`, which is actually the target `View`'s `hash` property), setup a `var layoutOptimazation: LayoutOptimization` property, override `func layoutSubviews()` method and call `layoutControl()` after `super.layoutSubviews()`. Now you're ready to use your own subclass to layout.

After the LayoutView object created, you can then add subviews to it, just like any other UIView objects. Also you may want to set the layout information of that subview through methods like `setLayoutMethods(_ methods: [NotAutoLayout.LayoutMethod], for subview: UIView)` and `setZIndex(_ zIndex: Int, for subview: UIView)`. If this subview is not added yet, you may also call `addSubview(_ view: UIView, layoutMethods: [LayoutMethod], order: Int? = nil, zIndex: Int? = nil)` method to add the subview and setup the layout info for it at the same time.

Basically the view object automatically layouts its subviews before it appears. For some reason if you want to manually forced layout it, you can call `setNeedsLayouts()` or `layoutIfNeeded()` from the main thread, just like what you do in normal `UIView` objects.

In addition, although there is a `zIndexInfo` dictionary, it won't have any effect until you added all the subviews you need and call `reloadSubviews()`. This method will remove all the subviews on it temporarily, sort them from the information in `zIndexInfo`, and re-add them again in the sorted order. So it's a good idea to add the subviews using `addSubview` or `insertSubview` methods correctly, then you're not required to call `reloadSubviews()` every time.

And sometimes, you may need to layout one subview before another because the other one needs the frame of that subview to layout. In this situation, you may store the layout orders of views in `orderInfo` dictionary. If there's no linked order info of a subview, it'll be considered as `0`, which means if you want to layout a specific subview before any other subviews, you may set its order to a minus number.

To layout the subviews you added, there're some structures and enums to store the layout information, which is needed in `layoutSubviews()` method. You may find the details in markdown document comment. For instance, we just talk about the basic ideas here.

`LayoutControllable` objects, or `LayoutView` in this case, links its each subview with `[LayoutMethod]`, `order` and `ZIndex` through `layoutInfo`, `orderInfo` and `zIndexInfo` dictionaries. If a subview doesn't have a linked `[LayoutMethod]` property, it won't get relayout in `layoutSubview()` process (but is still on the `LayoutView` object, if you have already added it).

`LayoutMethod` is the most important structure that keeps your layout information. It's made up from 2 parts: `condition: Condition` and `layout: Layout`.

`Condition` is a closure with type `(CGSize) -> Bool`. You can judge if `LayoutControllable` should use this `LayoutMethod` under current canvas size (or of course you can set it as `{_ in true}` that will always return a true regardless of the canvas size). If the result of `condition(bounds.size)` is true, the `Layout` will be calculated to layout the subview. And since each subview may have a linked *array* of  `LayoutMethod`, you can set multiple layout methods to a subview for different conditions like under landscape, in a big screen like iPad, etc. But be careful that only the first `condition` in the `LayoutMethod` array that returns true will be chosen in layout process.

`Layout` is a enum that you can put various frame information, like `.individual(.absolute(CGRect))` which will always place the linked subview in the given frame, no matter how `LayoutView` itself's bound size changes; and `.individual(.relative(CGRect))` will always place the linked subview depending on how big the `LayoutSubview` itself's bound size is, in to the `LayoutPosition` instance. You may find the details in markdown document comment.

In addition, although the layout information is designed to be like a `frame` information, it's actually set to the `bounds.size` and `center` property so theoretically it's OK to apply `CGAffineTransform` to the subviews.

### How it actually works
You may already have got the basic idea how it works in previous chapter. Basically NotAutoLayout does 2 things.

#### To set a layout
There're serveral method provided to set the layout like `addSubview(_ view: UIView, layoutMethods: [LayoutMethod], order: Int? = nil, zIndex: Int? = nil)`. You can call these methods anytime, and the value you set will be used while it layouts the subviews.

#### To layout
In `layoutControl()`, the `LayoutControllable` object (usually current `UIView`) iterates the subviews, tries to find if there's a linked `[LayoutMethod]` information to each `subview`. It'll get the first `Layout` in the `LayoutMethod` array which returns `true` in `Condition`. Through `Layout`, the `LayoutControllable` will calculate the correct `Frame` value provided by user, and use it to set `bounds.size` and `center` for the `subview`.

## License
NotAutoLayout is released under the Apache license. See LICENSE for details.