//: Playground - noun: a place where people can play
import PlaygroundSupport
import NotAutoLayout

let controller = IPhoneXScreenController()
controller.rotate(to: .portrait)
PlaygroundPage.current.liveView = controller.view

let appView = LayoutInfoStoredView()
appView.backgroundColor = .white
controller.view.addSubview(appView)

controller.view.nal.layout(appView) { $0
	.stickOnParent()
}

let padding: NotAutoLayout.Float = 10
let summaryView = ProfileSummaryView()
let contentsView = ContentsView()
let replyView = ReplyView()

summaryView.avatar = #imageLiteral(resourceName: "avatar.png")
summaryView.mainTitle = "星野恵瑠＠今日も1日フレンズ㌠"
summaryView.subTitle = "@lovee"
contentsView.contents = """
	Hello, NotAutoLayout!
	The new NotAutoLayout 3.0 now has even better syntax which is:
	- Easy to write (thanks to method-chain structures)
	- Easy to read (thanks to more natural English-like statements)
	- Capable with dynamic view sizes (with commands like `fitSize()`)
	- Even better closure support to help you set various kinds of layouts with various kinds of properties!
	- And one more thing: an experienmental sequencial layout engine!
	"""
contentsView.timeStamp = Date()

appView.nal.setupSubview(summaryView) { $0
	.setDefaultLayout { $0
		.setLeft(by: { $0.layoutMarginsGuide.left })
		.setRight(by: { $0.layoutMarginsGuide.right })
		.setTop(by: { $0.layoutMarginsGuide.top })
		.setHeight(to: 50)
	}
	.addToParent()
}
appView.nal.setupSubview(contentsView) { $0
	.setDefaultLayout({ $0
		.setLeft(by: { $0.layoutMarginsGuide.left })
		.setRight(by: { $0.layoutMarginsGuide.right })
        .pinTop(to: summaryView, with: { $0.bottom + padding })
		.fitHeight()
	})
	.setDefaultOrder(to: 1)
	.addToParent()
}
appView.nal.setupSubview(replyView) { $0
	.setDefaultLayout({ $0
		.setBottomLeft(by: { $0.layoutMarginsGuide.bottomLeft })
		.setRight(by: { $0.layoutMarginsGuide.right })
		.setHeight(to: 30)
	})
	.addToParent()
}

let imageViews = (0 ..< 3).map { (_) -> UIImageView in
    let image = #imageLiteral(resourceName: "avatar.png")
    let view = UIImageView(image: image)
    appView.addSubview(view)
    return view
}


appView.nal.layout(imageViews) { $0
    .setMiddle(by: { $0.vertical(at: 0.7) })
    .fitSize()
    .setHorizontalInsetsEqualingToMargin()
}
