import UIKit
import NotAutoLayout

public class ReplyView: UIView {
	
	private let replyView: UITextView
	
	private let replyPlaceholderText = "Reply to me!"
	
	private let margin: CGFloat = 10
	private let padding: CGFloat = 5
	
	public var contents: String? {
		get {
			return self.replyView.text
		}
		set {
			self.setReply(with: newValue)
		}
	}
	
	public override init(frame: CGRect) {
		
		self.replyView = UITextView()
		
		super.init(frame: frame)
		
		self.setupReplyView()
		
	}
	
	public convenience init() {
		self.init(frame: .zero)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public override func sizeThatFits(_ size: CGSize) -> CGSize {
		
		let replyFittingWidth = size.width - (self.margin * 2)
		let replyFittingSize = CGSize(width: replyFittingWidth, height: 0)
		let replyFittedSize = self.replyView.sizeThatFits(replyFittingSize)
		let fittedWidth = replyFittedSize.width + (self.margin * 2)
		let fittedHeight = replyFittedSize.height + (self.margin * 2)
		
		return CGSize(width: fittedWidth, height: fittedHeight)
		
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		self.placeReplyView()
	}
	
}

extension ReplyView {
	
	private func setupReplyView() {
		
		let view = self.replyView
		view.isEditable = false
		view.isSelectable = false
		view.clipsToBounds = true
		view.textContainerInset = UIEdgeInsets(top: self.padding, left: self.padding, bottom: self.padding, right: self.padding)
		view.font = .systemFont(ofSize: UIFont.systemFontSize)
		view.textColor = .darkGray
		view.backgroundColor = UIColor(red: 224.0 / 255.0, green: 231.0 / 255.0, blue: 236.0 / 255.0, alpha: 1)
		self.setReply(with: nil)
		self.addSubview(view)
		
	}
	
}

extension ReplyView {
	
	private func placeReplyView() {
		
		self.nal.layout(self.replyView) { $0
			.pinMiddleCenter(to: $0.parentView, s: .middleCenter)
			.setWidth(by: { $0.boundWidth - (self.margin * 2) })
			.fitHeight()
			.addingProcess(by: { (replyView, frame, _) in
				replyView.layer.cornerRadius = frame.height / 2
			})
		}
		
	}
	
}

extension ReplyView {
	
	private func setReply(with text: String?) {
		
		switch text {
		case let reply?:
			self.replyView.text = reply
			
		case nil:
			self.replyView.text = self.replyPlaceholderText
		}
		
	}
	
}
