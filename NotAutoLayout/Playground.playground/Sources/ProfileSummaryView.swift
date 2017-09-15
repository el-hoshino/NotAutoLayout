import UIKit
import NotAutoLayout

public class ProfileSummaryView: UIView {
	
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
		
		let view = self.avatarView
		view.backgroundColor = .red
		view.clipsToBounds = true
		self.addSubview(view)
		
	}
	
	private func setupMainTitleView() {
		
		let view = self.mainTitleLabel
		view.clipsToBounds = true
		view.font = .boldSystemFont(ofSize: UIFont.smallSystemFontSize)
		view.textColor = .black
		self.addSubview(view)
		
	}
	
	private func setupSubTitleView() {
		
		let view = self.subTitleLabel
		view.clipsToBounds = true
		view.font = .systemFont(ofSize: UIFont.smallSystemFontSize)
		view.textColor = .darkGray
		self.addSubview(view)
		
	}
	
}

extension ProfileSummaryView {
	
	private func placeAvatarView() {
		
		self.nal.layout(self.avatarView) { $0
			.pinMiddleLeft(to: $0.parentView, s: .middleLeft)
			.setSize(to: self.avatarSize)
			.addingProcess(by: { (view, frame, _) in
				view.layer.cornerRadius = min(frame.width, frame.height) / 2
			})
		}
		
	}
	
	private func placeMainTitleView() {
		
		self.nal.layout(self.mainTitleLabel) { $0
			.pinTopRight(to: $0.parentView, s: .topRight)
			.pinLeft(to: self.avatarView, s: .right, offsetBy: self.margin)
			.pinBottom(to: $0.parentView, s: .middle)
		}
		
	}
	
	private func placeSubTitleView() {
		
		self.nal.layout(self.subTitleLabel) { $0
			.pinTopRight(to: $0.parentView, s: .middleRight)
			.pinLeft(to: self.avatarView, s: .right, offsetBy: self.margin)
			.pinBottom(to: $0.parentView, s: 0.75)
		}
		
	}
	
}
