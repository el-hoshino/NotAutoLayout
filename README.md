# NotAutoLayout
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

NotAutoLayoutView is a framework to help you layout subviews without Auto Layout constraints.

Please note that this framework hasn't been tested widely yet, therefore it's still under a beta version. And currently it's for iOS only.

Please open an issue or send me a pull request if you have any problems, better ideas or any other things you want me to know.

## Why NotAutoLayout
Apple introduced Interface Builder and Storyboard to help developers create views visually, which is a very good idea. But after iPhone 5, things changed. There're more and more screen resolutions with different aspect ratios that drives developer crazy. To solve this problem, Apple introduced Auto Layout and Size Classes.

But the problem is, they're just making things more complicated (and that's why they introduced UIStackView and NSGridView, maybe). You have to create dozens of constraints in order to just create a very simple view in the storyboard, which makes the system complicated and hard to debug. So there are some frameworks like [Snapkit](https://github.com/SnapKit/SnapKit) and [PureLayout](https://github.com/PureLayout/PureLayout) to help you create Auto Layout constraints much more easily (which should be Xcode's duty). But there are still some *old school* developers (like me :P) just don't like, or even hate Auto Layout and want to create layout through codes. That's why I created NotAutoLayout framework.

With NotAutoLayout, you don't need to care about anything like constraints or size classes, instead you just need to focus on where should I place the element, how big should I resize the element, and which zIndex should I lay the element on. You can  even create a CSS-style responsive layout with just a couple lines of code. Every layout process done through NotAutoLayout framework is inside the `layoutSubviews()` method, which makes it easier to debug than constraints (Yes you can even put a breaker to get the detailed layout information!).

In addition, you can also subclass the `LayoutView` class, or subclass any other `UIView` class and conform it to `LayoutControllable` protocol, so you can keep the layouts in Views to prevent fat Controllers.

## Requirements
- iOS 8.0+
- Xcode 8.0+
- Swift 3.0+

## Installation
### Use Carthage:
- Download and install [Carthage](https://github.com/Carthage/Carthage#installing-carthage).
- Add the following line to your [Cartfile](https://github.com/Carthage/Carthage/blob/master/Documentation/Artifacts.md#cartfile).
```
github "el-hoshino/NotAutoLayout"
```
- Run `carthage update`.
- Add the framework to your project.

### Manually
- Download the whole repository.
- Add the NotAutoLayout project file into your project.
- Build the framework.

## Usage
### TL;DR
A very simple sample code is written in the Playground file, which may help you get the idea.
```swift
import UIKit
import PlaygroundSupport
import NotAutoLayout

let view = LayoutView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
view.backgroundColor = .white
PlaygroundPage.current.liveView = view

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
```

### Tell me more
There are basically 2 ways to use NotAutoLayout framework. The easiest one is simply create a `LayoutView` to layout the subviews in it, or you can also choose to subclass `LayoutView` or even subclass any other `UIView` and conform it to `LayoutControllable` protocol.

- Use a `LayoutView`
You can just create an instance of `LayoutView` like any other `UIView` objects through `LayoutView(frame: CGRect)` initializer.

- Subclass a `LayoutView`
You can just subclass a `LayoutView` like subclassing any other `UIView` classes, and you may add subviews as well as layout information for these subviews inside the subclass so you don't need to do it in a `UIViewController`, which may help you prevent a fat Controller.

- Conform other `UIView` subclasses to `LayoutControllable` protocol
Sometimes you may want to create classes other than `LayoutView`'s subclass, like you want to create a `UIImageView`'s subclass. In this case, all you need to do is to store `var layoutInfo: [UIView: [NotAutoLayout.LayoutMethod]]` dictionary and `var zIndexInfo: [UIView: Int]` dictionary, and override `layoutSubviews()` method and run `layoutControl()` after `super.layoutSubviews()`. Now you're ready to use your own subclass to layout.

After the LayoutView object created, you can then add subviews to it, just like any other UIView objects. Also you may want to set the layout information of that subview through methods like `setLayoutMethods(_ methods: [NotAutoLayout.LayoutMethod], for subview: UIView)` and `setZIndex(_ zIndex: Int, for subview: UIView)`.

Basically the view object automatically layouts its subviews before it appears. For some reason if you want to manually forced layout it, you can call `setNeedsLayouts()` from the main thread, just like what you do in normal `UIView` objects.

In addition, although there is a `zIndexInfo` dictionary, it won't have any effect until you added all the subviews you need and call `reloadSubviews()`. This method will remove all the subviews on it temporarily, sort them from the information in `zIndexInfo`, and re-add them again in the sorted order. So it's a good idea to add the subviews using `addSubview` or `insertSubview` methods correctly, then you're not required to call `reloadSubviews()` every time.

To layout the subviews you added, there're some structures and enums to store the layout information, which is needed in `layoutSubviews()` method. You may find the details in API Reference chapter. For instance, we just talk about the basic ideas here.

`LayoutControllable` objects, or `LayoutView` in this case, links its each subview with `[LayoutMethod]` and `ZIndex` through `layoutInfo` and `zIndexInfo` dictionaries. If a subview doesn't have a linked `[LayoutMethod]` property, it won't get repositioned in `layoutSubview()` process (but is still on the `LayoutView` object, if you have already added it).

`LayoutMethod` is the most important structure that keeps your layout information. It's made up from 2 parts: `condition: LayoutCondition` and `position: LayoutPosition`.

`LayoutCondition` is a closure with type `(CGSize) -> Bool`. You can judge if `LayoutControllable` should use this `LayoutMethod` under current canvas size (or of course you can set it as `{_ in true}` that will always return a true regardless of the canvas size). If the result of `condition(bounds.size)` is true, the `LayoutPosition` will be calculated to layout the subview. And since each subview may have a linked *array* of  `LayoutMethod`, you can set multiple layout methods to a subview for different conditions like under landscape, in a big screen like iPad, etc. But be careful that only the first `condition` in the `LayoutMethod` array that returns true will be chosen in layout process.

`LayoutPosition` is a enum that you can put various frame information, like `.absolute(CGRect)` which will always place the linked subview in the given frame, no matter how `LayoutView` itself's bound size changes; and `.relative(CGRect)` will always place the linked subview depending on how big the `LayoutSubview` itself's bound size is, in to the `LayoutPosition` instance. You may find the details in API Reference chapter.

In addition, although the layout information is designed to be like a `frame` information, it's actually set to the `bounds.size` and `center` property so theoretically it's OK to apply `CGAffineTransform` to the subviews.

## API Reference
### LayoutControllable: class
A class-only protocol created to handle the layout stuff, which is basically considered to be used in `UIView` subclasses. But you can conform any class to it if you want.

#### subviews: [UIView] { get }
`[UIView]` get-only property. Every `UIView` has it.

#### boundSize: CGSize { get }
`CGSize` get-only property. In `UIView` it's get from `bounds.size`.

#### layoutInfo: [UIView: [LayoutMethod]] { get set }
`[UIView: [LayoutMethod]]` get-set property. Stores the needed layout information to layout subviews.

#### zIndexInfo: [UIView: [Int]] { get set }
`[UIView: Int]` get-set property. Stores the needed zIndex information in `reloadSubviews()` methods. If a subview doesn't have a linked zIndex info, the method will consider a default value `0`.

#### addSubview(_ subview: UIView)
Void method. Every `UIView` has it.

#### layoutSubviews()
Void method. Every `UIView` has it. If you make your own class that conforms to `LayoutControllable`, don't forget to call `layoutControl()` method in it. And in `UIView` this method should not be called directly. Always call `setNeedsLayout()` instead.

#### setNeedsLayout()
Void method. Every `UIView` has it. You should always call this method from main thread.

#### refreshLayoutInfo()
Void method. In protocol extension it removes `[LayoutMethod]` linked to subviews which are already removed from self.

#### refreshZIndexInfo()
Void method. In protocol extension it removes ZIndex linked to subviews which are already removed from self.

#### layoutControl()
Void method. In protocol extension this is the core method to layout the subviews with the help of `layoutInfo` dictionary. If you're conforming your own class to `LayoutControllable`, remember to call this method under layout process (`layoutSubviews()` in `UIView`, for example).

#### reloadSubviews()
Void method. In protocol extension this removes all subviews temporarily, sorts them in zIndex order (if no zIndex value available, default value `0` will be applied), and re-adds them again.

#### setLayoutMethods(_ methods: [LayoutMethod], for subview: UIView)
Void method. In protocol extension this links a `subview` with `methods`. If there's already another `[LayoutMethod]` information linked to `subview`, the old information will be erased.

#### setConstantPosition(_ position: LayoutPosition, for subview: UIView)
Void method. In protocol extension this links a `subview` with a layout method of `(condition: {_ in true}, position: position)`, which means the position information set here is always used in `layoutControl()`. If there's already another `[LayoutMethod]` information linked to `subview`, the old information will be erased

#### appendLayoutMethod(_ method: LayoutMethod, for subview: UIView)
Void method. In protocol extension this links a `subview` with `method`. If there's already another `[LayoutMethod]` information linked to `subview`, this method will be appended to the exist information.

#### appendConstantPosition(_ position: LayoutPosition, for subview: UIView)
Void method. In protocol extension this links a `subview` with a layout method of `(condition: {_ in true}, position: position)`, which means the position information set here is always used if not any other layout methods meets the condition. If there's already another `[LayoutMethod]` information linked to `subview`, this method will be appended to the exist information.

#### setLayout(of subview: UIView, at position: LayoutPosition, while condition: @escaping LayoutCondition)
Void method. In protocol extension this links a `subview` with a layout method of `condition: condition, position: position)`. If there's already another `[LayoutMethod]` information linked to `subview`, this method will be appended to the exist information.

#### setZIndex(_ zIndex: Int, for subview: UIView)
Void method. In protocol extension this links a `subview` with a ZIndex information. If there's already another ZIndex information linked to `subview`, the old value will be erased.

### LayoutView
A very basic `LayoutControllable` protocol-conformed subclass of `UIView`. For many situations you just need to create an instance of `LayoutView` to use it. But if you want to store your own properties in `LayoutView`, you'll need to subclass it.

### LayoutMethod
This is a typealias of (condition: LayoutCondition, position: LayoutPosition).

### LayoutCondition
This is a typealias of `(_ boundSize: CGSize) -> Bool`. Specifically it's a closure that needs the `LayoutControllable` view's bound size to produce a Bool return value.

Since this closure is a part of `LayoutMethod`, which is possibly stored in `layoutInfo` property in `LayoutControllable`, remember to write a [capture list](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID56) if needed to prevent memory leak.

### LayoutPosition
This is an enum that contains values to calculate the required frame information.

#### .absolute(CGRect)
The contained `CGRect` value represents the absolute `frame` of linked `UIView` object.

#### .relative(CGRect)
The contained `CGRect` value represents the percentage of `frame` compared to `LayoutControllable#boundSize`. For example, if the `LayoutView`'s bound size is `CGSize(width: 100, height: 200)`, and the `LayoutPosition` value is `.relative(CGRect(x:0.2, y: 0.2, width: 0.6, height: 0.4))`, the linked subview's frame will be `CGRect(x: 100*0.2/*=20*/, y: 200*0.2/*=40*/, width: 100*0.6/*=60*/, height: 200*0.6/*=120*/)`

#### .insets(UIEdgeInsets)
The contained `UIEdgeInsets` value represents the inset from the linked `UIView` object to `LayoutControllable` object. For example, if the `LayoutView`'s bound size is `CGSize(width: 100, height: 200)` and the `LayoutPosition` value is `.insets(UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40))`, the linked subview's frame will be `CGRect(x: 20, y: 10, width: 100-20-40/*=40*/, height: 200-10-30/*=160*/)`

#### .offset(value: UIOffset, from: OffsetOrigin, size: CGSize)
The contained `value` represents the offset value, `from` represents which point should be the standard point, and `size` represents the `UIView` object's size. You can define 9 kinds of `OffsetOrigin` including `.topLeft`, `.topCenter`, `.topRight`, `.middleLeft`, `.middleCenter`, `.middleRight`, `.bottomLeft`, `.bottomCenter` and `.bottomRight`. For example if the `LayoutView`'s bound size is `CGSize(width: 100, height: 200)` and the `LayoutPosition` value is `.offset(value: UIOffset(horizontal: -10, vertical: 20), from: .topRight, size: CGSize(width:30, height: 40))`, the linked subview's frame will be `CGRect(x: 100-30+(-10)/*=60*/, y: 20, width: 30, height: 40)`


#### .customByFrame(frame: (CGSize) -> CGRect)
This contained frame closure will produce a CGRect value dynamically and directly from the `LayoutView`'s bound size, that represents the linked subview's frame. For example if the `LayoutView`'s bound size is `CGSize(width: 100, height: 200)` and the `LayoutPosition` is `.customByFrame(frame: {CGRect(x: 0, y: $0.width*0.2+20, width: $0.width, height: $0.height*0.5)})`, the linked subview's frame will be `CGRect(x: 0, y: 100*0.2+20/*=40*/, width: 100, height: 200*0.5/*=100*/)`

Be careful that although this case is very powerful that it can produce any kind of layout information dynamically as you wish, since it's a part of `LayoutMethod` which is possibly stored in `layoutInfo` property, remember to write a [capture list](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID56) if needed to prevent memory leak.

#### .customByOriginSize(origin: (CGSize) -> CGPoint, size: (CGSize) -> CGSize)
A very similar case with `.customByFrame(frame: (CGSize) -> CGRect)` that it only separately produces the `origin` and `size` properties, which may be useful in some situations that you may need less code than `.customByFrame`.

#### .customByXYWidthHeight(x: (CGSize) -> CGFloat, y: (CGSize) -> CGFloat, width: (CGSize) -> CGFloat, height: (CGSize) -> CGFloat)
Another very similar case with `.customByFrame(frame: (CGSize) -> CGRect)` that it only separately produces the `x`, `y`, `width` and `height` properties, which may be useful in some situations that you may need less code that `.customByFrame`.

## License
NotAutoLayout is released under the Apache license. See LICENSE for details.