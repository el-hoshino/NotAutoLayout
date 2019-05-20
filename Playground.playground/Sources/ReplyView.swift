import UIKit
import NotAutoLayout

private let padding: CGFloat = 5

public class ReplyView: UIView {
	
	private let replyView: UITextView
	
	private let replyPlaceholderText = "Reply to me!"
	
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
		view.textContainerInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
		view.font = .systemFont(ofSize: UIFont.systemFontSize)
		view.textColor = .darkGray
		view.backgroundColor = UIColor(red: 224.0 / 255.0, green: 231.0 / 255.0, blue: 236.0 / 255.0, alpha: 1)
		self.setReply(with: nil)
		self.addSubview(view)
		
	}
	
}

extension ReplyView {
	
	private func placeReplyView() {
		
		self.nal.layout(self.replyView, by: { $0
			.setFrame(by: { $0.frame })
			.addingProcess(by: { (frame, parameters) in
				parameters.targetView.layer.cornerRadius = (frame.height / 2).cgValue
			})
		})
		
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
