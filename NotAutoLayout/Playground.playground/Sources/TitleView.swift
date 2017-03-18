import Foundation
import NotAutoLayout

public class TitleView: LayoutView {
	
	public let titleLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		return label
	}()
	
	override public init(frame: CGRect) {
		
		super.init(frame: frame)
		
		self.addSubview(self.titleLabel, withAssociatedLayoutMethods: self.makeTitleLabelLayoutMethods())
		
	}
	
	convenience public init() {
		self.init(frame: .zero)
	}
	
	required public init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func makeTitleLabelLayoutMethods() -> [LayoutMethod] {
		
		let position = LayoutPosition.makeCustom { (boundSize) -> CGRect in
			let size = CGSize(width: 200, height: 40)
			let x = (boundSize.width - size.width) / 2
			let y = (boundSize.height - size.height) / 2
			return CGRect(x: x, y: y, width: size.width, height: size.height)
		}
		
		let method = LayoutMethod(constantPosition: position)
		return [method]
		
	}
	
}

extension TitleView {
	
	public func setTitle(_ title: String) {
		self.titleLabel.text = title
	}
	
}
