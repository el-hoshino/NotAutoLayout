# NotAutoLayout
[![Platform](https://img.shields.io/badge/platform-ios-blue.svg?style=flat)](https://developer.apple.com/iphone/index.action)
[![Language](https://img.shields.io/badge/language-swift-brightgreen.svg?style=flat)](https://developer.apple.com/swift)
[![Build Status](https://www.bitrise.io/app/a650632c681bd908/status.svg?token=wwCZECU6zvtAwAfY2Jw5hQ&branch=master)](https://www.bitrise.io/app/a650632c681bd908)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

NotAutoLayoutView is a framework to help you layout subviews *without* Auto Layout constraints.

Please note that this framework hasn't been widely tested yet, and currently it's for iOS only.

Please open an issue or send me a pull request if you have any problems, better ideas or any other things you want me to know.

Currently this README.md file doesn't cover the whole project yet, it will be fixed in future releases.

## Why NotAutoLayout
Apple introduced Interface Builder and Storyboard to help developers create views visually, which is a very good idea. But after iPhone 5, things changed. There're more and more screen resolutions with different aspect ratios that drives developer crazy. To solve this problem, Apple introduced Auto Layout and Size Classes.

But the problem is, they're just making things more complicated (and that's why they introduced UIStackView and NSGridView, maybe). You have to create dozens of constraints in order to just create a very simple view in the storyboard, which makes the system complicated and hard to debug. In addition, there is no hierarchy for the constraints, which means that you have to manage all those dozens of constraints in one place, which is just not intuitive because we always add many subviews to views, and even more further subviews to subviews, which makes a hierarchy of views.

So, there are some frameworks like [Snapkit](https://github.com/SnapKit/SnapKit) and [PureLayout](https://github.com/PureLayout/PureLayout) to help you create Auto Layout constraints much more easily (which should be Xcode's duty). But there are still some *old school* developers (like me :P) just don't like, or even hate Auto Layout and want to create layout through codes. That's why I created NotAutoLayout framework.

With NotAutoLayout, you don't need to care about anything like constraints or size classes, instead you just need to focus on **where** is the edge of the element, **how big** should I resize the element, and maybe **what** should I do after layout process finished. Every layout process done through NotAutoLayout framework is through directly setting `frame` property if `transform` is `.identity`, or `bounds.size` and `center` properties otherwise, which makes it easier to debug than constraints (Yes you can even put a breaker to get the detailed layout information!).

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

let view = LayoutInfoStoredView(frame: .init(x: 0, y: 0, width: 320, height: 568))
view.backgroundColor = .white
PlaygroundPage.current.liveView = view

let margin: CGSize = .init(width: 10, height: 10)
let summaryView = ProfileSummaryView()
let contentsView = ContentsView()
let replyView = ReplyView()

summaryView.avatar = #imageLiteral(resourceName: "avatar.png")
summaryView.mainTitle = "星野恵瑠＠今日も1日フレンズ㌠"
summaryView.subTitle = "@lovee"
contentsView.contents = """
	Hello, NotAutoLayout!
	The whole new NotAutoLayout 2.0 now has much better syntax which is:
	- Easier to write (thanks to method-chain structures)
	- Easier to read (thanks to more natural English-like statements)
	- Even supports dynamic view sizes (with commands like `fitSize()`)!
	"""
contentsView.timeStamp = Date()

view.nal.setupSubview(summaryView) { $0
	.makeDefaultLayout { $0
		.pinLeft(to: $0.parentView, s: .left, offsetBy: margin.width)
		.pinRight(to: $0.parentView, s: .right, offsetBy: -margin.width)
		.pinTop(to: $0.parentView, s: .top, offsetBy: margin.height)
		.fitHeight()
	}
	.addToParent()
}
view.nal.setupSubview(contentsView) { $0
	.makeDefaultLayout({ $0
		.pinTopLeft(to: summaryView, s: .bottomLeft)
		.pinRight(to: summaryView, s: .right)
		.fitHeight()
		.movingY(by: margin.height)
	})
	.setDefaultOrder(to: 1)
	.addToParent()
}
view.nal.setupSubview(replyView) { $0
	.makeDefaultLayout({ $0
		.pinBottomCenter(to: $0.parentView, s: .bottomCenter)
		.setWidth(by: { $0.boundWidth - (margin.width * 2) })
		.fitHeight()
	})
	.addToParent()
}

view.setNeedsLayout()
```
![screenshot](README_Resource/PlaygroundSample.png)

### Tell me more
Waiting to be filled ...

### How to make a layout
You may call `nal.layout(_ subview: UIView, by making: (_ layoutMaker: InitialLayoutMaker) -> Layout.Individual)` to set a layout for subview from the parent view. The very basic idea is to make layouts through `LayoutMaker`s. With `LayoutMaker`, you can setup a layout by setting each part of a frame step by step to generate a specific layout, and then the parent view will use the generated layout to set the frame of the subview.

To setup a layout by `LayoutMaker`, you may call methods like `$0.setTopLeft(to: .zero).fitSize()` in the provided `making` closure. Since it's a `(InitialLayoutMaker) -> Layout.Individual` type closure, it will guarantee that finally you'll get a specific layout that avoids things like ambiguous layout in Auto Layout. And since `InitialLayoutMaker` has lots of chaind methods those lead to a `Layout.Individual`, you can easily write a method chain without missing any part of a frame.

To make a certain frame, you'll need 4 elements: 2 unique horizontal positions and 2 unique vertical positions. Horizontal positions may be any of the things like `left`, `center`, `right` or any specific position like `0.3`, and `width` which also can represent a horizontal position. Vertical positions may be any of the things like `top`, `middle`, `bottom` or any specific position like `0.3`, and of course `height`. To set these elements through `LayoutMaker`, there is a approximate order that is:
1. Set point-specific positions (like `.topLeft`) before line-specific positions (like `.top` or `.left`).
2. Set line-specific positions before set size elements (`.width`, `.height` and `.size`).
3. In line-specific positions, set horizontal positions (like `.left`) before vertical positions (like `.top`).
4. In size elements, set `.width` before `.height` if you set them separately.

Since you only need 2 unique horizontal positions and 2 unique vertical positions to make a frame, you don't need to write all those 4 categories of statements. For example, you may write `$0.setTopLeft(to: .zero).fitSize()` to make a specific frame, which only have 2 statements.

And in `LayoutMaker`s, you also have some methods that can get the parent view's size and safe area related properties (like `.setLeft(by: { $0.leftSafeAreaInset })`), which can help you in making responsive layouts.

### How it actually works
Waiting to be filled ...

## Known issues
- [ ] README.md file is not finished yet.
- [ ] Inline documents are not finished yet.
- [ ] Some `LayoutMaker` methods are not declared yet.
- [ ] Sequencial layout is not implemented yet.
- [ ] Matrical layout is not implemented yet.

## Golas for oncoming version 3.0
NotAutoLayout v3.0 will be released along with Swift 4.1 (that means probably on 1st or 2nd quarter in 2018), which may contain some break changes to the current API. One of the biggest changes is `pinXxx` API. Currently it's made like `pinLeft(to: someView, s: .right, offsetBy: 10, safeAreaOnly: true)`, which is very long and not very user friendly. In v3.0, it'll be changed to something like `pinLeft(to: someView, at: { $0.safeRight + 10 })`, which much shorter, as well as much easier to read.

Also, currently in v2.x, sequencial and matrical layouts are not implemented yet. Hopefully they'll be implemented in v3.0, or at least 3.1.

For details about version 3.0.0, please take a look at [3.0.0 Milestone](https://github.com/el-hoshino/NotAutoLayout/milestone/5).

## License
NotAutoLayout is released under the Apache license. See LICENSE for details.
