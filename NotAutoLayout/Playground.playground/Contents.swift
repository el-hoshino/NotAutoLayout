//: Playground - noun: a place where people can play
import PlaygroundSupport
import NotAutoLayout

let view = LayoutInfoStoredView(frame: .init(x: 0, y: 0, width: 320, height: 568))
view.backgroundColor = .white
PlaygroundPage.current.liveView = view

view.nal.makeSequentialLayout { $0
	.makeFirstLayout(by: { $0
		.makeFrame(.zero)
	})
	.setRestFrames(by: { $0
		.movingX(by: 10)
	})
}

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
