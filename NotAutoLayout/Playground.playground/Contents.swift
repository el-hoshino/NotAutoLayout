//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import NotAutoLayout

let baseView = LayoutInfoStoredView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
PlaygroundPage.current.liveView = baseView

baseView.backgroundColor = .white

public class ProfileSummaryView: LayoutInfoStoredView {
	
	private let avatarView: UIImageView
	private let mainTitleLabel: UILabel
	private let subTitleLabel: UILabel
	
	private let avatarSize: CGSize = .init(width: 50, height: 50)
	private let margin: CGFloat = 10
	
	public var avatar: UIImage? {
		get {
			return self.avatarView.image
		}
		set {
			self.avatarView.image = newValue
		}
	}
	
	public var mainTitle: String? {
		get {
			return self.mainTitleLabel.text
		}
		set {
			self.mainTitleLabel.text = newValue
		}
	}
	
	public var subTitle: String? {
		get {
			return self.subTitleLabel.text
		}
		set {
			self.subTitleLabel.text = newValue
		}
	}
	
	public override init(frame: CGRect) {
		
		self.avatarView = UIImageView()
		self.mainTitleLabel = UILabel()
		self.subTitleLabel = UILabel()
		
		super.init(frame: frame)
		
		self.setupAvatarView()
		self.setupMainTitleView()
		self.setupSubTitleView()
		
	}
	
	public convenience init() {
		self.init(frame: .zero)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public override func sizeThatFits(_ size: CGSize) -> CGSize {
		
		let widthExcludeLabel = self.avatarSize.width + self.margin
		let labelWidth = size.width - widthExcludeLabel
		let labelFittingSize = CGSize(width: labelWidth, height: 0)
		let mainFittedSize = self.mainTitleLabel.sizeThatFits(labelFittingSize)
		let subFittedSize = self.subTitleLabel.sizeThatFits(labelFittingSize)
		let labelMaxWidth = max(mainFittedSize.width, subFittedSize.width)
		let fittedWidth = labelMaxWidth + widthExcludeLabel
		let fittedHeight = self.avatarSize.height
		
		return CGSize(width: fittedWidth, height: fittedHeight)
		
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		self.placeAvatarView()
		self.placeMainTitleView()
		self.placeSubTitleView()
	}
	
}

extension ProfileSummaryView {
	
	private func setupAvatarView() {
		
		self.avatarView.backgroundColor = .red
		self.avatarView.clipsToBounds = true
		self.addSubview(self.avatarView)
		
	}
	
	private func setupMainTitleView() {
		
		self.mainTitleLabel.clipsToBounds = true
		self.mainTitleLabel.font = .boldSystemFont(ofSize: 14)
		self.mainTitleLabel.textColor = .black
		self.addSubview(self.mainTitleLabel)
		
	}
	
	private func setupSubTitleView() {
		
		self.subTitleLabel.clipsToBounds = true
		self.subTitleLabel.font = .systemFont(ofSize: 14)
		self.subTitleLabel.textColor = .darkGray
		self.addSubview(self.subTitleLabel)
		
	}
	
}

extension ProfileSummaryView {
	
	private func placeAvatarView() {
		
		self.nal.place(self.avatarView) { $0
			.pinMiddleLeft(to: $0.parentView, s: .middleLeft)
			.setSize(to: self.avatarSize)
			.addingProcess(by: { (view, frame, _) in
				view.layer.cornerRadius = min(frame.width, frame.height) / 2
			})
		}
		
	}
	
	private func placeMainTitleView() {
		
		self.nal.place(self.mainTitleLabel) { $0
			.pinTopRight(to: $0.parentView, s: .topRight)
			.pinLeft(to: self.avatarView, s: .right, offsetBy: self.margin)
			.pinBottom(to: $0.parentView, s: .middle)
		}
		
	}
	
	private func placeSubTitleView() {
		
		self.nal.place(self.subTitleLabel) { $0
			.pinTopRight(to: $0.parentView, s: .middleRight)
			.pinLeft(to: self.avatarView, s: .right, offsetBy: self.margin)
			.pinBottom(to: $0.parentView, s: 0.75)
		}
		
	}
	
}

let margin: CGSize = .init(width: 10, height: 10)

let summaryView = ProfileSummaryView()

summaryView.avatar = #imageLiteral(resourceName: "avatar.png")
summaryView.mainTitle = "星野恵瑠＠今日も1日フレンズ㌠"
summaryView.subTitle = "@lovee"

baseView.nal.setupSubview(summaryView) { $0
	.makeDefaultLayout { $0
		.pinLeft(to: $0.parentView, s: .left, offsetBy: margin.width)
		.pinRight(to: $0.parentView, s: .right, offsetBy: -margin.width)
		.pinTop(to: $0.parentView, s: .top, offsetBy: margin.height)
		.fitHeight()
	}
	.addToParent()
}



baseView.setNeedsLayout()

