//: Playground - noun: a place where people can play
import PlaygroundSupport
import NotAutoLayout

let controller = IPhoneXScreenController()
PlaygroundPage.current.liveView = controller.view

let appView = LayoutInfoStoredView()
appView.backgroundColor = .white
controller.view.addSubview(appView)

controller.view.nal.layout(appView) { $0
	.stickOnParent()
}



let margin: Size = .init(width: 10, height: 10)
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

appView.nal.setupSubview(summaryView) { $0
	.setDefaultLayout { $0
		.setLeft(by: { $0.left })
		.setRight(by: { $0.right })
		.setTop(by: { $0.top })
		.setHeight(by: { $0.safeAreaGuide.top + 50 })
	}
	.addToParent()
}
appView.nal.setupSubview(contentsView) { $0
	.setDefaultLayout({ $0
		.pinTopLeft(to: summaryView, with: { $0.bottomLeft })
		.pinRight(to: summaryView, with: { $0.right })
		.fitHeight()
		.movingY(by: margin.height)
	})
	.setDefaultOrder(to: 1)
	.addToParent()
}
appView.nal.setupSubview(replyView) { $0
	.setDefaultLayout({ $0
		.setBottomLeft(by: { $0.bottomLeft })
		.setRight(by: { $0.right })
		.setTop(by: { $0.safeAreaGuide.bottom - 30 })
	})
	.addToParent()
}

appView.setNeedsLayout()


let imageViews = (0 ..< 3).map { (_) -> UIImageView in
	let image = #imageLiteral(resourceName: "avatar.png")
	let view = UIImageView(image: image)
	appView.addSubview(view)
	return view
}


appView.nal.layout(imageViews) { $0
	.setMiddle(by: { $0.middle })
	.fitSize()
	.setHorizontalInsetsEqualingToMargin()
}
