import UIKit
import NotAutoLayout

private let margin: NotAutoLayout.Float = 10

public class ContentsView: UIView {
	
	private let contentsLabel: UILabel
	private let timeStampView: UILabel
	
	private let dateFormatter: DateFormatter
	
	public var contents: String? {
		get {
			return self.contentsLabel.text
		}
		set {
			self.contentsLabel.text = newValue
		}
	}
	
	public var timeStamp: Date? {
		get {
			return self.timeStampView.text.map { self.dateFormatter.date(from: $0) } ?? nil
		}
		set {
			newValue.map { self.timeStampView.text = self.dateFormatter.string(from: $0) }
		}
	}
	
	public override init(frame: CGRect) {
		
		self.contentsLabel = UILabel()
		self.timeStampView = UILabel()
		self.dateFormatter = DateFormatter()
		
		super.init(frame: frame)
		
		self.setupContentsLabel()
		self.setupTimeStampLabel()
		self.setupDateFormatter()
		
	}
	
	public convenience init() {
		self.init(frame: .zero)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public override func sizeThatFits(_ size: CGSize) -> CGSize {
		
		let fittingSize = CGSize(width: size.width - (margin.cgValue * 2), height: 0)
		let contentsLabelFittedSize = self.contentsLabel.sizeThatFits(fittingSize)
		let timeStampViewFittedSize = self.timeStampView.sizeThatFits(fittingSize)
		let fittedWidth = max(contentsLabelFittedSize.width, timeStampViewFittedSize.width)
		let fittedHeight = contentsLabelFittedSize.height + timeStampViewFittedSize.height + (margin.cgValue * 3)
		
		return CGSize(width: fittedWidth, height: fittedHeight)
		
	}
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		self.placeContentsLabel()
		self.placeTimeStampView()
	}
	
}

extension ContentsView {
	
	private func setupContentsLabel() {
		
		let view = self.contentsLabel
		view.clipsToBounds = true
		view.numberOfLines = 0
		view.font = .systemFont(ofSize: UIFont.labelFontSize)
		view.textColor = .black
		self.addSubview(view)
		
	}
	
	private func setupTimeStampLabel() {
		
		let view = self.timeStampView
		view.clipsToBounds = true
		view.font = .systemFont(ofSize: UIFont.smallSystemFontSize)
		view.textColor = .darkGray
		self.addSubview(view)
		
	}
	
	private func setupDateFormatter() {
		
		let formatter = self.dateFormatter
		formatter.dateFormat = "yyyy/MM/dd HH:mm"
		
	}
	
}

extension ContentsView {
	
	private func placeContentsLabel() {
		
		self.nal.layout(self.contentsLabel, by: { $0
			.setLeft(by: { $0.safeAreaGuide.left + margin })
			.setRight(by: { $0.safeAreaGuide.right - margin })
			.setTop(by: { $0.safeAreaGuide.top + margin })
			.fitHeight()
		})
		
	}
	
	private func placeTimeStampView() {
		
		self.nal.layout(self.timeStampView) { $0
			.pinTopLeft(to: self.contentsLabel, with: { $0.bottomLeft })
			.pinRight(to: self.contentsLabel, with: { $0.right })
			.fitHeight()
			.movingY(by: margin)
		}
		
	}
	
}
